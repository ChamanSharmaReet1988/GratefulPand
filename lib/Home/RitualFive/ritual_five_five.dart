import 'package:flutter/material.dart';
import 'package:gratefull_panda/Tabbar/tabbar_screen.dart';
import 'package:gratefull_panda/Utils/user_preferences.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

class RitualFiveFive extends StatefulWidget {
  final bool isFromOnboarding;

  const RitualFiveFive({super.key, this.isFromOnboarding = false});

  @override
  State<RitualFiveFive> createState() => _RitualFiveFiveState();
}

class _RitualFiveFiveState extends State<RitualFiveFive> {
  late bool _isFromOnboarding;
  String pandaName = "";

  @override
  void initState() {
    super.initState();
    _isFromOnboarding = widget.isFromOnboarding;
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
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Back to Home",
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

      body: Stack(
        children: [
          Image.asset(
            "assets/ritualfivebackgroundimage.png",
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
                        "assets/ritual5key.png",
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
                            "Today’s rituals are complete.",
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
                              "Your brain just practiced calm, focus, and gratitude. These are the habits that slowly reshape mood.",
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
                          const SizedBox(height: 16),
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

                                spacing: 8,
                                children: [
                                  Image.asset(
                                    "assets/elements.png",
                                    width: 18,
                                    height: 18,
                                    fit: BoxFit.contain,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Baby $pandaName got',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: const Color(0xB2342D18),
                                          fontSize: 14,
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        '78 pts',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: const Color(0xFFFF9E37),
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 90),
                    const Spacer(),
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
