import 'package:flutter/material.dart';
import 'package:gratefull_panda/Home/RitualThree/ritual_three_completed_screen.dart';
import 'package:gratefull_panda/Utils/user_preferences.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

class RitualThreeSayScreen extends StatefulWidget {
  const RitualThreeSayScreen({super.key});

  @override
  State<RitualThreeSayScreen> createState() => _RitualThreeSayScreenState();
}

class _RitualThreeSayScreenState extends State<RitualThreeSayScreen> {
  var inputValue = "";

  @override
  void initState() {
    super.initState();
    _loadInputData();
  }

  Future<void> _loadInputData() async {
    final inputOne = await UserPreferences.getInputTodayGratitude();

    setState(() {
      inputValue = inputOne;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RitualThreeCompletedScreen(
                      isFromOnboarding: false,
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Complete Ritual",
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset(
                      "assets/arrow-right-White.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.45,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.darkBackgroungColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
          ),

          Positioned(
            top: screenHeight * 0.35,
            left: screenWidth * 0.06,
            right: screenWidth * 0.06,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.splashBackgroundColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.borderColor,
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Read your gratitude slowly. Say it again with softness.",
                        style: TextStyle(
                          color: const Color(0xFF342D18),
                          fontSize: 16,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Let yourself feel the moment you just named.",
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                          color: AppColors.splashTextColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  top: -25,
                  right: -15,
                  child: SizedBox(
                    width: 54,
                    height: 40,
                    child: Image.asset(
                      "assets/panda_bubble.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset(
                        "assets/arrow-left.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        decoration: const BoxDecoration(
                          color: AppColors.darkColorForHeading,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Let it sink in',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 16,
                          right: 20,
                          bottom: 16,
                        ),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFFF5E0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(32),
                              bottomLeft: Radius.circular(24),
                              bottomRight: Radius.circular(24),
                            ),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          inputValue,
                          style: TextStyle(
                            color: const Color(0xFF342D18),
                            fontSize: 16,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
