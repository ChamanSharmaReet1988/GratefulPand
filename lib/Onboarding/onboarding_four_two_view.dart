import 'package:flutter/material.dart';
import 'package:gratefull_panda/Onboarding/onboarding_five_view.dart';

import 'package:gratefull_panda/Utils/user_preferences.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

class RitualFourTwo extends StatefulWidget {
  final bool isFromOnboarding;

  const RitualFourTwo({super.key, this.isFromOnboarding = false});

  @override
  State<RitualFourTwo> createState() => _RitualFourTwoState();
}

class _RitualFourTwoState extends State<RitualFourTwo> {
  String pandaName = "";
  bool grow = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        grow = true;
      });
    });
    _loadPandaName();
  }

  Future<void> _loadPandaName() async {
    final savedPandaName = await UserPreferences.getPandaName();

    setState(() {
      pandaName = savedPandaName ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      extendBody: true,
      extendBodyBehindAppBar: true,
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
                    builder: (context) => OnboardingFiveViewScreen(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
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
          Image.asset(
            "assets/onboardingfourbackground.png",
            fit: BoxFit.contain,
          ),
          Column(
            children: [
              const SizedBox(height: 60),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
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
                  ],
                ),
              ),

              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
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
                      width: MediaQuery.sizeOf(context).width * 0.8,
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
              SizedBox(height: 130),
              SizedBox(
                width: 187,
                height: 217,
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 2500),
                    curve: Curves.easeInOut,
                    width: grow ? 187 : 70,
                    height: grow ? 217 : 88,
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/gratefulPanda.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Column(
                  children: [
                    const Spacer(),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.06,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          Text(
                            "Your Panda grows as you use Grateful Panda.",
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
                              "Each time you show up and complete rituals, your Panda grows a little more, day by day.",
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
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 150,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 12,
                                ),
                                decoration: ShapeDecoration(
                                  color: const Color(
                                    0xFFF2E3D0,
                                  ) /* Orange-100 */,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 2,
                                      color: const Color(
                                        0xFFFFF5E0,
                                      ) /* Orange-50 */,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 12,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Image.asset(
                                        'assets/tape.png',
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: 6,
                                      children: [
                                        Text(
                                          '$pandaName Height',
                                          style: TextStyle(
                                            color: const Color(0xFF60512C),
                                            fontSize: 12,
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          '12 inch',
                                          style: TextStyle(
                                            color: const Color(0xFF342D18),
                                            fontSize: 14,
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Container(
                                width: 150,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 12,
                                ),
                                decoration: ShapeDecoration(
                                  color: const Color(
                                    0xFFF2E3D0,
                                  ) /* Orange-100 */,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 2,
                                      color: const Color(
                                        0xFFFFF5E0,
                                      ) /* Orange-50 */,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 12,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Image.asset(
                                        'assets/weight_scale.png',
                                        width: 20,
                                        height: 20,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: 6,
                                      children: [
                                        Text(
                                          '$pandaName Weight',
                                          style: TextStyle(
                                            color: const Color(0xFF60512C),
                                            fontSize: 12,
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          '100 kg',
                                          style: TextStyle(
                                            color: const Color(0xFF342D18),
                                            fontSize: 14,
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 150),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
