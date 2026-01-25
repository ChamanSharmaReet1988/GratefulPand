import 'package:flutter/material.dart';
import 'package:gratefull_panda/Home/RitualFive/ritual_five_five.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

class RitualFiveFour extends StatefulWidget {
  final bool isFromOnboarding;

  const RitualFiveFour({super.key, this.isFromOnboarding = false});

  @override
  State<RitualFiveFour> createState() => _RitualFiveFourState();
}

class _RitualFiveFourState extends State<RitualFiveFour> {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RitualFiveFive(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Finish Today’s Journey",
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
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
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
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0xFFDE872A),
                            blurRadius: 0,
                            offset: Offset(1, 2),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Image.asset(
                            "assets/elements.png",
                            width: 18,
                            height: 18,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            '1007',
                            style: TextStyle(
                              color: const Color(0xFFFF9E37),
                              fontSize: 16,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
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
                          "Today’s three thank you is complete.",
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
                            "You paused to honor what supports you, and your whole system felt it. Small moments of appreciation create lasting emotional ease.",
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
