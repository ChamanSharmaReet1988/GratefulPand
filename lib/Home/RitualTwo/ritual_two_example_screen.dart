import 'package:flutter/material.dart';
import 'package:gratefull_panda/Home/ritualTwo/ritualTwo_input_screen.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

class RitualTwoExampleScreen extends StatelessWidget {
  const RitualTwoExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenHeight < 700;

    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(
                      16,
                      MediaQuery.of(context).padding.top + 8,
                      16,
                      0,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.darkBackgroungColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
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

                        const SizedBox(height: 20),
                        const Text(
                          'Examples to guide your “I Am”',
                          style: TextStyle(
                            color: Color(0xFF372D17),
                            fontSize: 20,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 8),
                        const Text(
                          'Read these. See what feels right for you.',
                          style: TextStyle(
                            color: Color(0xFF6D6450),
                            fontSize: 14,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 24),
                        _affirmationContainer(
                          "I am noticing my thoughts without judgment.",
                          context,
                        ),
                        _affirmationContainer(
                          "I am learning to see my thoughts, not become them.",
                          context,
                        ),
                        _affirmationContainer(
                          "I am aware of what I’m feeling, and that’s enough.",
                          context,
                        ),
                        _affirmationContainer(
                          "I am present, even when my mind wanders.",
                          context,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
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
                        builder: (context) => RitualTwoInputScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Next",
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: isSmallScreen ? 14 : 16,
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
          ),
        ],
      ),
    );
  }

  Widget _affirmationContainer(String text, BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.whitishBackgroundColor,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RitualTwoInputScreen(),
                  ),
                );
              },
              child: Text(
                text,
                style: TextStyle(
                  color: const Color(0xFF342D18),
                  fontSize: 16,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left, // ✅ centered text
              ),
            ),
          ),
        ],
      ),
    );
  }
}
