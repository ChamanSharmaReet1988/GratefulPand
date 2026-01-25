import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/utils/user_preferences.dart';
import 'package:gratefull_panda/Common/data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataBackupView extends StatefulWidget {
  const DataBackupView({super.key});

  @override
  State<DataBackupView> createState() => _DataBackupViewState();
}

class _DataBackupViewState extends State<DataBackupView> {
  bool isGoogleBackupOn = false;
  bool isIcloudBackupOn = false;
  String? lastBackupDate;
  bool isExpanded = false;

  static const _googleKey = "google_backup_on";
  static const _icloudKey = "icloud_backup_on";

  @override
  void initState() {
    super.initState();
    _loadAllStates();
  }

  Future<void> _loadAllStates() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      isGoogleBackupOn = prefs.getBool(_googleKey) ?? false;
      isIcloudBackupOn = prefs.getBool(_icloudKey) ?? false;
    });

    final date = await UserPreferences.getLastBackupDate();
    setState(() {
      lastBackupDate = (date == null || date.isEmpty) ? null : date;
    });
  }

  Future<void> _saveToggle(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24, top: 66),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset("assets/back.png"),
                    ),
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Data backup',
                      style: TextStyle(
                        color: Color(0xFF372D17),
                        fontSize: 18,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 56),
              ],
            ),

            googleDriveBackupCard(),
            iCloudSyncCard(),
            restoreBackupCard(),

            howDoesThisWorkWidget(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),

            if (isExpanded) howItWorksExpandedContainer(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget googleDriveBackupCard() {
    return backupCard(
      icon: "assets/googleIcon.png",
      title: "Google Drive backup",
      value: isGoogleBackupOn,
      onTap: () {
        setState(() {
          isGoogleBackupOn = !isGoogleBackupOn;
        });
        _saveToggle(_googleKey, isGoogleBackupOn);
      },
    );
  }

  Widget iCloudSyncCard() {
    return backupCard(
      icon: "assets/appleIcon.png",
      title: "iCloud backup",
      value: isIcloudBackupOn,
      onTap: () {
        setState(() {
          isIcloudBackupOn = !isIcloudBackupOn;
        });
        _saveToggle(_icloudKey, isIcloudBackupOn);
      },
    );
  }

  Widget backupCard({
    required String icon,
    required String title,
    required bool value,
    required VoidCallback onTap,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: ShapeDecoration(
        color: const Color(0xFFFFF5E0),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1.50, color: Color(0xFFC07021)),
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x99000000),
            offset: Offset(1, 3),
          )
        ],
      ),
      child: Row(
        children: [
          Image.asset(icon, width: 20, height: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF342D18),
                fontSize: 14,
                fontFamily: 'Outfit',
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Image.asset(
              value ? "assets/switchon.png" : "assets/switchoff.png",
              width: 36,
            ),
          ),
        ],
      ),
    );
  }

  Widget restoreBackupCard() {
    if (lastBackupDate == null) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: ShapeDecoration(
          color: const Color(0xFFFFF5E0),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1.5, color: Color(0xFFC07021)),
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x99000000),
              blurRadius: 0,
              offset: Offset(1, 3),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                final now = DateTime.now();
                final formattedDate =
                    "${getMonthName(now.month)} ${now.day}, ${now.year}";

                UserPreferences.setLastBackupDate(formattedDate);

                setState(() {
                  lastBackupDate = formattedDate;
                });
              },
              child: SizedBox(
                width: 280,
                child: Text(
                  'Restore backup',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF342D18),
                    fontSize: 14,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: 280,
              child: Text(
                'Last backup: Not available',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF8E7743),
                  fontSize: 12,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Last backup: $lastBackupDate',
            style: const TextStyle(
              color: Color(0xFF8E7743),
              fontSize: 12,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),
          GestureDetector(
            onTap: () async {
              final now = DateTime.now();
              final formattedDate =
                  "${getMonthName(now.month)} ${now.day}, ${now.year}";

              await UserPreferences.setLastBackupDate(formattedDate);

              setState(() {
                lastBackupDate = formattedDate;
              });
            },
            child: SizedBox(
              width: 140,
              child: Text(
                'Restore Purchase',
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Color(0xFF372D17),
                  fontSize: 12,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget howDoesThisWorkWidget({VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 280,
              child: Text(
                'How does this work?',
                style: TextStyle(
                  color: Color(0xFF372D17),
                  fontSize: 14,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: 22,
              height: 22,
              child: Image.asset(
                isExpanded ? 'assets/dropUp.png' : 'assets/dropDown.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget howItWorksExpandedContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: ShapeDecoration(
          color: const Color(0xFFF8F1E9),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            _HowItWorksText(
              title: '1. Your data stays yours',
              body:
                  'To protect your privacy, Grateful Panda does not store your personal entries on our own servers.\n'
                  'Instead, your data is securely saved to your own Google Drive or iCloud account, which only you control.',
            ),
            SizedBox(height: 24),
            _HowItWorksText(
              title: '2. Automatic daily backup',
              body:
                  'Once enabled, your data is backed up automatically every day in the background.\n'
                  'There’s nothing you need to remember or manage.',
            ),
            SizedBox(height: 24),
            _HowItWorksText(
              title: '3. Restore anytime, on any device',
              body:
                  'If you lose your phone, get a new one, or reinstall the app, you’ll be given the option to restore your data from backup when you open Grateful Panda again.\n'
                  'Your journey, entries, and progress come back with you.',
            ),
            SizedBox(height: 24),
            _HowItWorksText(
              title: '4. Where to see your backup',
              body:
                  'Google Drive:\n'
                  'Open Google Drive on a laptop or desktop → Settings → Manage apps\n'
                  'You’ll see Grateful Panda listed with its backup size.'
            ),
            SizedBox(height: 24),
            _HowItWorksText(
              title: 'iCloud:',
              body:
                  'Go to iOS Settings → iCloud → Manage Account Storage\n'
                  'You’ll see Grateful Panda listed with the size of your backup.',
            ),
            SizedBox(height: 24),
            _HowItWorksText(
              title: '5. You’re always in control',
              body:
                  'You can turn backup on or off anytime.\n'
                  'If you turn it off, no new data will be saved to cloud storage.',
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- Helper Widget ----------------
class _HowItWorksText extends StatelessWidget {
  final String title;
  final String body;

  const _HowItWorksText({
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$title\n',
            style: const TextStyle(
              color: Color(0xFF60512C),
              fontSize: 14,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: body,
            style: const TextStyle(
              color: Color(0xFF60512C),
              fontSize: 14,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}