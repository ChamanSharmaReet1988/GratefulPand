import 'package:flutter/material.dart';
import 'package:gratefull_panda/Home/RitualThree/ritual_three_example_screen.dart';
import 'package:gratefull_panda/Tabbar/tabbar_screen.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

class RitualThreeOpeningScreen extends StatefulWidget {
  final bool isFromOnboarding;

  const RitualThreeOpeningScreen({super.key, this.isFromOnboarding = false});

  @override
  State<RitualThreeOpeningScreen> createState() =>
      _RitualThreeOpeningScreenState();
}

class _RitualThreeOpeningScreenState extends State<RitualThreeOpeningScreen> {
  late bool _isFromOnboarding;

  @override
  void initState() {
    super.initState();
    _isFromOnboarding = widget.isFromOnboarding;
  }

  void navigateToRootNoAnimation() {
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
  }

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RitualThreeExampleScreen(
                      isFromOnboarding: _isFromOnboarding,
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Start my gratitude",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (!_isFromOnboarding) ...[
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
                ],
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 0,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: Image.asset("assets/crossblack.png", height: 24),
                      onPressed: navigateToRootNoAnimation,
                    ),
                  ),

                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 19,
                      vertical: 0,
                    ),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 50),
                          padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                          decoration: BoxDecoration(
                            color: AppColors.darkBackgroungColor,
                            borderRadius: BorderRadius.circular(32),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Text(
                                _isFromOnboarding ? "RITUAL #1" : "RITUAL #3",
                                style: TextStyle(
                                  color: Color(0xB2342D18),
                                  fontSize: 14,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),

                              const SizedBox(height: 4),
                              const Text(
                                'Today\'s Gratitude\n"Something that\'s working"',
                                style: TextStyle(
                                  color: Color(0xFF342D18),
                                  fontSize: 20,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),

                              const SizedBox(height: 20),
                              _buildAwarenessBox(
                                title: 'Step 1',
                                message:
                                    'Think of one part of your day or life that quietly works as it should — a routine, a tool, or a system.',
                              ),

                              const SizedBox(height: 16),

                              _buildAwarenessBox(
                                title: 'Step 2',
                                message:
                                    'Take a slow breath and imagine your day if that thing suddenly stopped working.',
                              ),

                              const SizedBox(height: 16),

                              _buildAwarenessBox(
                                title: 'Step 3',
                                message: 'Feel gratitude',
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: SizedBox(
                              height: 120,
                              width: 120,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Image.asset(
                                  "assets/ritualThreeIOpeningImg.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
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
      ),
    );
  }

  Widget _buildAwarenessBox({required String title, required String message}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: const BoxDecoration(
            color: AppColors.darkColorForHeading,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Text(
            title,
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
              BoxShadow(color: Color(0x3F000000), offset: Offset(0, 2)),
            ],
          ),
          child: Text(
            message,
            style: TextStyle(
              color: Color(0xFF342D18),
              fontSize: 16,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
