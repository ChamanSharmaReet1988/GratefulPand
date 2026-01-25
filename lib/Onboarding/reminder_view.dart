import 'package:flutter/material.dart';
import 'package:gratefull_panda/Onboarding/onboarding_last_view.dart';
import 'package:gratefull_panda/Tabbar/tabbar_screen.dart';
import 'package:gratefull_panda/constant/color_constant.dart';
import 'package:gratefull_panda/Utils/user_preferences.dart';
import 'package:permission_handler/permission_handler.dart';

class ReminderViewScreen extends StatefulWidget {
  const ReminderViewScreen({super.key, required this.isFromOnboarding});
  final bool isFromOnboarding;
  @override
  State<ReminderViewScreen> createState() => _ReminderViewScreenState();
}

class _ReminderViewScreenState extends State<ReminderViewScreen> {
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

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: GestureDetector(
                onTap: navigateToRootNoAnimation,
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(
                    "assets/crossblack.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/onbordingPandaImage.png",
                    width: screenWidth * 0.18,
                    height: screenHeight * 0.09,
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Should Panda gently remind you each day?",
                          style: TextStyle(
                            color: Color(0xFF372D17),
                            fontSize: 20,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Choose a time that feels right. With just a minute a day, new habits often begin to form in around 18 days.",
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
                ],
              ),
            ),
            const SizedBox(height: 54),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildTimeButton("Morning 8 AM", "sunrise"),
                  SizedBox(height: screenHeight * 0.02),
                  _buildTimeButton("Afternoon 2 PM", "sun"),
                  SizedBox(height: screenHeight * 0.02),
                  _buildTimeButton("Night 8 PM", "moon"),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryButtonsColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: navigateToRootNoAnimation,
                  child: const Text(
                    "Skip for now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryButtonsColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _onSetReminderPressed,
                  child: const Text(
                    "Set reminder",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeButton(String time, String imageName) {
    final bool isSelected = _selectedReminders.any(
      (item) => item["time"] == time,
    );

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedReminders.removeWhere((item) => item["time"] == time);
          } else {
            _selectedReminders.add({"time": time, "image": imageName});
          }
        });
      },
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
              isSelected ? "assets/check.png" : "assets/uncheck.png",
              width: 20,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  // Handle both notification and location permissions
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

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const OnboardingLastView()),
    );
  }

  Future<bool> _requestPermissions() async {
    // Notification permission
    var notifStatus = await Permission.notification.status;
    if (!notifStatus.isGranted) {
      notifStatus = await Permission.notification.request();
    }

    // Location permission
    var locStatus = await Permission.locationWhenInUse.status;
    if (!locStatus.isGranted) {
      locStatus = await Permission.locationWhenInUse.request();
    }

    // If either permanently denied, show settings dialog
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
}
