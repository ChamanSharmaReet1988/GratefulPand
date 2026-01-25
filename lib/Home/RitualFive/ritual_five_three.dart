import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/Home/RitualFive/ritual_five_four.dart';
import 'package:gratefull_panda/Utils/user_preferences.dart';

class RitualFiveThree extends StatefulWidget {
  const RitualFiveThree({super.key});

  @override
  State<RitualFiveThree> createState() => _RitualFiveThreeState();
}

class _RitualFiveThreeState extends State<RitualFiveThree> {
  var inputOneValue = "";
  var inputTwoValue = "";
  var inputThreeValue = "";

  final GlobalKey _thirdBoxKey = GlobalKey();
  double _thirdBoxHeight = 0;
  double _thirdBoxY = 0;

  @override
  void initState() {
    super.initState();
    _loadInputData();
  }

  Future<void> _loadInputData() async {
    final inputOne = await UserPreferences.getRitual5ThankInputData1();
    final inputTwo = await UserPreferences.getRitual5ThankInputData2();
    final inputThree = await UserPreferences.getRitual5ThankInputData3();

    setState(() {
      inputOneValue = inputOne;
      inputTwoValue = inputTwo;
      inputThreeValue = inputThree;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox =
          _thirdBoxKey.currentContext?.findRenderObject() as RenderBox?;

      if (renderBox != null) {
        final size = renderBox.size;
        final position = renderBox.localToGlobal(Offset.zero);

        setState(() {
          _thirdBoxHeight = size.height;
          _thirdBoxY = position.dy;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2E6D2),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
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
                  MaterialPageRoute(builder: (context) => RitualFiveFour()),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,

              children: [
                Container(
                  width: double.infinity,
                  height: _thirdBoxHeight > 0
                      ? _thirdBoxHeight / 2.0 + _thirdBoxY + 15
                      : null,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE9D1B5),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(32),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 120,
                      left: 24,
                      right: 24,
                    ),
                    child: Column(
                      children: [
                        _buildAwarenessBox(
                          title: 'Feel it',
                          message: inputOneValue,
                        ),
                        const SizedBox(height: 18),
                        _buildAwarenessBox(
                          title: 'Feel it',
                          message: inputTwoValue,
                        ),
                        const SizedBox(height: 18),
                        Container(
                          child: _buildAwarenessBox(
                            title: 'Feel it',
                            message: inputThreeValue,
                            boxKey: _thirdBoxKey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 44, left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: SizedBox(
                        height: 24,
                        width: 24,
                        child: Image.asset(
                          "assets/back.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            Padding(
              padding: EdgeInsets.only(top: 16, left: 26, right: 26, bottom: 0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                  bottom: 0,
                ),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1.50,
                      color: const Color(0xFFE9D1B5),
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 0,
                    left: 6,
                    right: 6,
                    bottom: 0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      SizedBox(
                        child: Text(
                          'Read each thank-you slowly.',
                          style: TextStyle(
                            color: const Color(0xFF372D17) /* Dark-500 */,
                            fontSize: 16,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 12),

                      SizedBox(
                        width: 272,
                        child: Text(
                          'Let the words warm you for a moment before moving to the next.',
                          style: TextStyle(
                            color: const Color(0xFFC17C37) /* Orange-500 */,
                            fontSize: 16,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAwarenessBox({
    required String title,
    required String message,
    Key? boxKey,
  }) {
    return Column(
      key: boxKey,
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
            softWrap: true,
            maxLines: null,
            message,
            style: TextStyle(
              color: const Color(0xFF342D18),
              fontSize: 16,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
