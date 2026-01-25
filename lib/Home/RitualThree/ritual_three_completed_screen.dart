import 'package:flutter/material.dart';
import 'package:gratefull_panda/Home/home_screen.dart';
import 'package:gratefull_panda/Home/RitualFour/ritual_four_opening_screen.dart';
import 'package:gratefull_panda/Onboarding/onboarding_subscription_screen.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

class RitualThreeCompletedScreen extends StatefulWidget {
  final bool isFromOnboarding;

  const RitualThreeCompletedScreen({super.key, this.isFromOnboarding = false});

  @override
  State<RitualThreeCompletedScreen> createState() =>
      _RitualThreeCompletedScreenState();
}

class _RitualThreeCompletedScreenState
    extends State<RitualThreeCompletedScreen> {
  late bool _isFromOnboarding;

  @override
  void initState() {
    super.initState();
    _isFromOnboarding = widget.isFromOnboarding;
  }

  @override
  Widget build(BuildContext context) {
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
                if (_isFromOnboarding) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const OnboardingSubscriptionScreen(),
                    ),
                  );
                } else {
                  Navigator.pushAndRemoveUntil(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const RitualFourOpeningScreen(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                    (route) => false,
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _isFromOnboarding ? "Continue" : "Start Next Ritual",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 10),
                  if (!_isFromOnboarding)
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

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: GestureDetector(
                  onTap: () {
                    if (_isFromOnboarding) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false,
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: Image.asset(
                      _isFromOnboarding
                          ? "assets/crossblack.png"
                          : "assets/arrow-left.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 24),

            /// Progress bar
            _isFromOnboarding
                ? SizedBox(height: 0)
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: Stack(
                      children: [
                        Container(
                          height: 4,
                          padding: const EdgeInsets.symmetric(horizontal: 104),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF3F3F3),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: const Color(0x35ADB1B0),
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.6,
                          height: 4,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 4,
                          ),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFFA23F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: [
                              BoxShadow(
                                color: const Color(0x99FF9E37),
                                blurRadius: 8,
                                offset: const Offset(5, 0),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

            Expanded(
              child: Column(
                children: [
                  const Spacer(),
                  SizedBox(
                    height: 90,
                    width: 90,
                    child: Image.asset(
                      "assets/panda_square_shape.png",
                      fit: BoxFit.contain,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.06,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        Text(
                          _isFromOnboarding
                              ? "You did something kind for your mind."
                              : 'Today’s Gratitude is complete.',
                          style: const TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            _isFromOnboarding
                                ? "Just noticing this one thing is enough for today."
                                : 'You took a moment to notice something good in your life. '
                                      'That one small pause can change the way your day feels.',
                            style: const TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: AppColors.headingTextColor,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
