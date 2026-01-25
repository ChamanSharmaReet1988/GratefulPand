import 'package:flutter/material.dart';
import 'package:gratefull_panda/Home/RitualOne/ritual_completed_screen.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

class RitualMomentScreen extends StatefulWidget {
  const RitualMomentScreen({super.key});

  @override
  State<RitualMomentScreen> createState() => _RitualMomentScreenState();
}

class _RitualMomentScreenState extends State<RitualMomentScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenHeight < 700;

    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
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
                  padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
                  decoration: BoxDecoration(
                    color: AppColors.splashBackgroundColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.darkBackgroungColor,
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "When breath slows, the world softens its edges.",
                        style: TextStyle(
                          color: const Color(0xFF342D18),
                          fontSize: 16,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: isSmallScreen ? 10 : 12),
                      Text(
                        "Feel your ribs widen, shoulders drop — the body says 'you're safe'.",
                        style: TextStyle(
                          color: const Color(0xFFC17C37) /* Orange-500 */,
                          fontSize: 16,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  top: isSmallScreen ? -25 : -30,
                  right: isSmallScreen ? -8 : -10,
                  child: SizedBox(
                    width: isSmallScreen ? 60 : 60,
                    height: isSmallScreen ? 60 : 60,
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
                /// BACK BUTTON
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
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

                SizedBox(height: 38),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 28,
                        width: 206,
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen ? 10 : 12,
                          vertical: isSmallScreen ? 2 : 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.darkColorForHeading,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Today\'s Grounding Moment',
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
                        padding: EdgeInsets.all(isSmallScreen ? 12 : 14),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFFF5E0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
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
                          'Take one slow breath in for 4, out for 6',
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

                const Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Science Behind: ",
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                            height: 1.4,
                            color: Color(0xFF444444),
                          ),
                        ),
                        TextSpan(
                          text:
                              "Long exhalation activates the vagus nerve, easing the heart.",
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                            color: Color(0xFF6C6452),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.02),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.06,
                    0,
                    screenWidth * 0.06,
                    screenHeight * 0.04,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x77000000),
                          offset: Offset(0, 3),
                        ),
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
                            builder: (context) => RitualCompletedScreen(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Complete Ritual",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          SizedBox(
                            height: isSmallScreen ? 18 : 20,
                            width: isSmallScreen ? 18 : 20,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
