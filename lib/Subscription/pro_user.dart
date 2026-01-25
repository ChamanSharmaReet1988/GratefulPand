import 'package:flutter/material.dart';
import 'package:gratefull_panda/Tabbar/tabbar_screen.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

class ProUserScreen extends StatelessWidget {
  const ProUserScreen({super.key});

  void navigateToRootNoAnimation(BuildContext context) {
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
      backgroundColor: AppColors.primaryBackgroungColor,
      body: Stack(
        children: [
          // Background rays
          Positioned.fill(
            child: Image.asset(
              'assets/prouserbackground.png',
              fit: BoxFit.cover,
            ),
          ),

          // Close icon
          Positioned(
            top: 50,
            left: 22,
            child: IconButton(
              icon: SizedBox(
                height: 24,
                width: 24,
                child: Image.asset(
                  "assets/crossblack.png",
                  fit: BoxFit.contain,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          Column(
            children: [
              const Spacer(),
              const SizedBox(height: 100),
              // Crown container
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3DE),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(child: Image.asset('assets/premium.png')),
              ),

              const SizedBox(height: 24),

              const Text(
                'Free trial successfully activated',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF372D17) /* Dark-500 */,
                  fontSize: 20,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 12),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  "You’ve unlocked deeper rituals, more tools,\n"
                  "and more ways to care for your mind.\n"
                  "Small daily moments like this can reshape\n"
                  "how you feel from the inside out.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF60512C) /* Dark-400 */,
                    fontSize: 16,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              const Spacer(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GestureDetector(
                  onTap: () => navigateToRootNoAnimation(context),
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2,
                          color: const Color(0xFFC07021),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 6,
                          children: [
                            Text(
                              'Go to home',
                              style: TextStyle(
                                color: const Color(0xFFC07021),
                                fontSize: 16,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 50),
            ],
          ),
        ],
      ),
    );
  }
}
