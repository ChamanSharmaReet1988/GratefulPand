import 'package:flutter/material.dart';
import 'package:gratefull_panda/Onboarding/onboarding_last_view.dart';
import 'package:gratefull_panda/Tabbar/tabbar_screen.dart';
import 'package:gratefull_panda/constant/color_constant.dart';
import 'package:gratefull_panda/Utils/user_preferences.dart';
import 'package:permission_handler/permission_handler.dart';

class ReminderSettingView extends StatefulWidget {
  const ReminderSettingView({super.key, required this.isFromOnboarding});
  final bool isFromOnboarding;

  @override
  State<ReminderSettingView> createState() => _ReminderSettingViewState();
}

class _ReminderSettingViewState extends State<ReminderSettingView> {
  final List<Map<String, String>> _selectedReminders = [];
  late bool _isFromOnboarding;

  @override
  void initState() {
    super.initState();
    _isFromOnboarding = widget.isFromOnboarding;
  }

  void navigateToRootNoAnimation() {
    if (_isFromOnboarding) {
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const TabBarScreen(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
        (route) => false,
      );
    } else {
      Navigator.pop(context);
    }
  }

  Future<void> _onSetReminderPressed() async {
    if (_selectedReminders.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select at least one reminder time"),
        ),
      );
      return;
    }

    final granted = await _requestPermissions();
    if (!granted) return;

    for (final reminder in _selectedReminders) {
      await UserPreferences.saveReminderTime(
        reminder["time"]!,
        reminder["image"]!,
      );
    }

    // Navigate after saving
    if (_isFromOnboarding) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingLastView()),
      );
    } else {
      Navigator.pop(context);
    }
  }

  Future<bool> _requestPermissions() async {
    var notifStatus = await Permission.notification.status;
    if (!notifStatus.isGranted) {
      notifStatus = await Permission.notification.request();
    }

    var locStatus = await Permission.locationWhenInUse.status;
    if (!locStatus.isGranted) {
      locStatus = await Permission.locationWhenInUse.request();
    }

    if (notifStatus.isPermanentlyDenied || locStatus.isPermanentlyDenied) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Permission Required"),
          content: const Text(
            "Please enable notification permission in Settings to set reminders.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                openAppSettings();
                Navigator.pop(ctx);
              },
              child: const Text("Open Settings"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text("Cancel"),
            ),
          ],
        ),
      );
      return false;
    }

    return notifStatus.isGranted && locStatus.isGranted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 66),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            const SizedBox(height: 36),
            reminderInfo(),
            const SizedBox(height: 37),
            reminderSelectionCards(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 120, 
        padding: const EdgeInsets.only(bottom: 40),
        color: AppColors.splashBackgroundColor,
        child: Center(
          child: setReminderButton(),
        ),
      ),
    );
  }

  Widget header() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: navigateToRootNoAnimation,
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
              'Reminder',
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
    );
  }

  Widget reminderInfo() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0), 
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 72,
          height: 62,
          child: Image.asset(
            "assets/onbordingPandaImage.png",
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 8), 
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 0, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Should Panda gently remind you each day.',
                  style: TextStyle(
                    color: Color(0xFF372D17), 
                    fontSize: 20,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8), 
                Text(
                  'Choose a time that feels right. With just a minute a day, new habits often begin to form in around 18 days.',
                  style: TextStyle(
                    color: Color(0xFF60512C), 
                    fontSize: 16,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

  Widget reminderSelectionCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          _ReminderCard(
            time: "Morning 8 AM",
            imageName: "sunrise",
            isSelected: _selectedReminders.any((item) => item["time"] == "Morning 8 AM"),
            onTap: () {
              setState(() {
                toggleReminder("Morning 8 AM", "sunrise");
              });
            },
          ),
          const SizedBox(height: 8),
          _ReminderCard(
            time: "Afternoon 2 PM",
            imageName: "sun",
            isSelected: _selectedReminders.any((item) => item["time"] == "Afternoon 2 PM"),
            onTap: () {
              setState(() {
                toggleReminder("Afternoon 2 PM", "sun");
              });
            },
          ),
          const SizedBox(height: 8),
          _ReminderCard(
            time: "Night 8 PM",
            imageName: "moon",
            isSelected: _selectedReminders.any((item) => item["time"] == "Night 8 PM"),
            onTap: () {
              setState(() {
                toggleReminder("Night 8 PM", "moon");
              });
            },
          ),
        ],
      ),
    );
  }

  void toggleReminder(String time, String image) {
    final isSelected = _selectedReminders.any((item) => item["time"] == time);
    if (isSelected) {
      _selectedReminders.removeWhere((item) => item["time"] == time);
    } else {
      _selectedReminders.add({"time": time, "image": image});
    }
  }

  Widget setReminderButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: _onSetReminderPressed, 
        child: Container(
          width: 148,
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            color: const Color(0xFFC17C37), 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x99000000),
                blurRadius: 0,
                offset: Offset(1, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Set reminder',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        height: 1.40,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReminderCard extends StatelessWidget {
  final String time;
  final String imageName;
  final bool isSelected;
  final VoidCallback onTap;

  const _ReminderCard({
    required this.time,
    required this.imageName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.reminderSelectionView,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.white, width: 2),
        ),
        child: Row(
          children: [
            Image.asset("assets/$imageName.png", width: 20, height: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                time,
                style: const TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
            ),
            Image.asset(
              isSelected ? "assets/checkcircle.png" : "assets/unselectedcircle.png",
              width: 20,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}