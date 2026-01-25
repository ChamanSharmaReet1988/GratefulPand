import 'package:flutter/material.dart';
import 'package:gratefull_panda/Home/RitualThree/ritual_three_completed_screen.dart';
import 'package:gratefull_panda/Home/RitualThree/ritual_three_say_screen.dart';
import 'package:gratefull_panda/Utils/user_preferences.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

class RitualThreeInputScreen extends StatefulWidget {
  final bool isFromOnboarding;

  const RitualThreeInputScreen({super.key, this.isFromOnboarding = false});

  @override
  State<RitualThreeInputScreen> createState() => _RitualThreeInputScreenState();
}

class _RitualThreeInputScreenState extends State<RitualThreeInputScreen> {
  final TextEditingController gratitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
          child: Container(
            width: double.infinity,
            height: 48,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(color: Color(0x77000000), offset: Offset(0, 3)),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryButtonsColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                if (widget.isFromOnboarding) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RitualThreeCompletedScreen(
                        isFromOnboarding: true,
                      ),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RitualThreeSayScreen(),
                    ),
                  );
                }
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Next",
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Image(
                      image: AssetImage("assets/arrow-right-White.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.only(bottom: 120),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(minHeight: 280),
                  padding: EdgeInsets.fromLTRB(
                    20,
                    MediaQuery.of(context).padding.top,
                    20,
                    80,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.darkBackgroungColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const SizedBox(
                            height: 24,
                            width: 24,
                            child: Image(
                              image: AssetImage("assets/arrow-left.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        widget.isFromOnboarding
                            ? "Write your First Gratitude"
                            : "Write your gratitude",
                        style: const TextStyle(
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: AppColors.heading,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Write one simple thing you’re grateful for today.\n'
                        'Today’s topic is "Something that’s working"',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.exampleScreenSubTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: -50,
                  left: 24,
                  right: 24,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.splashBackgroundColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: TextField(
                      maxLines: 3,
                      controller: gratitudeController,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) {
                        FocusScope.of(context).unfocus(); // hide keyboard
                      },
                      onEditingComplete: () {
                        UserPreferences.setInputTodayGratitude(
                          gratitudeController.text,
                        );
                        FocusScope.of(context).unfocus();
                      },
                      textCapitalization: TextCapitalization.sentences,
                      style: const TextStyle(
                        color: Color(0xFF60512C),
                        fontSize: 16,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'type here',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 157, 157, 156),
                          fontSize: 16,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 4, bottom: 4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
