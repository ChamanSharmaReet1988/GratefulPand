import 'package:flutter/material.dart';
import 'package:gratefull_panda/Home/RitualThree/ritual_three_input_screen.dart';
import 'package:gratefull_panda/Tabbar/tabbar_screen.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

class RitualThreeExampleScreen extends StatefulWidget {
  final bool isFromOnboarding;

  const RitualThreeExampleScreen({super.key, this.isFromOnboarding = false});

  @override
  State<RitualThreeExampleScreen> createState() =>
      _RitualThreeExampleScreenState();
}

class _RitualThreeExampleScreenState extends State<RitualThreeExampleScreen> {
  late bool _isFromOnboarding;
  double _floatingCardHeight = 0;

  @override
  void initState() {
    super.initState();
    _isFromOnboarding = widget.isFromOnboarding;
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
                    builder: (context) => RitualThreeInputScreen(
                      isFromOnboarding: _isFromOnboarding,
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Next",
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 10),
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

      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(
                  24,
                  MediaQuery.of(context).padding.top,
                  24,
                  _floatingCardHeight / 2,
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
                        onTap: () {
                          if (_isFromOnboarding) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    const TabBarScreen(),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
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
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 38),

                    const Text(
                      'Examples to guide you',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF372D17) /* Dark-500 */,
                        fontSize: 20,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'Read these slowly. They help your mind understand the shape of today’s gratitude before you write your own.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF6D6450),
                        fontSize: 14,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    const SizedBox(height: 24),

                    _affirmationContainer(
                      "I’m grateful for my alarm clock because it keeps my mornings steady.",
                    ),
                    _affirmationContainer(
                      "I’m grateful for my laptop because it lets me create, learn, and stay connected without effort.",
                    ),
                  ],
                ),
              ),

              Positioned(
                left: 24,
                right: 24,
                bottom: -_floatingCardHeight / 2,
                child: MeasureSize(
                  onChange: (size) {
                    if (_floatingCardHeight != size.height) {
                      setState(() {
                        _floatingCardHeight = size.height;
                      });
                    }
                  },
                  child: _affirmationContainer(
                    "I’m grateful for my healthy legs — they carry me through everything from grocery runs to long walks that clear my head. They’ve been reliable companions I rarely thank.",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _affirmationContainer(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.white, width: 2),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RitualThreeInputScreen()),
          );
        },
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xFF342D18),
            fontSize: 16,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class MeasureSize extends StatefulWidget {
  final Widget child;
  final ValueChanged<Size> onChange;

  const MeasureSize({super.key, required this.child, required this.onChange});

  @override
  State<MeasureSize> createState() => _MeasureSizeState();
}

class _MeasureSizeState extends State<MeasureSize> {
  Size? oldSize;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = context.size;
      if (size != null && oldSize != size) {
        oldSize = size;
        widget.onChange(size);
      }
    });
    return widget.child;
  }
}
