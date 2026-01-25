import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/Home/RitualFive/ritual_five_three.dart';
import 'package:gratefull_panda/Utils/user_preferences.dart';

class RitualFiveTwo extends StatefulWidget {
  const RitualFiveTwo({super.key});

  @override
  State<RitualFiveTwo> createState() => _RitualFiveTwoState();
}

class _RitualFiveTwoState extends State<RitualFiveTwo> {
  final TextEditingController thankOneController = TextEditingController();
  final TextEditingController thankTwoController = TextEditingController();
  final TextEditingController thankThreeController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
                  MaterialPageRoute(builder: (context) => RitualFiveThree()),
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
              children: [
                Container(
                  width: double.infinity,
                  height: 240,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE9D1B5),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(32),
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

                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 314,
                          child: Text(
                            'Complete your three thank you',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF372D17) /* Dark-500 */,
                              fontSize: 20,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 314,
                          child: Text(
                            'Write it gently, in your own words…',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF6D6450),
                              fontSize: 14,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        thankYouTextField(
                          topPadding: 30,
                          controller: thankOneController,
                        ),

                        thankYouTextField(
                          topPadding: 16,
                          controller: thankTwoController,
                        ),
                        thankYouTextField(
                          topPadding: 16,
                          controller: thankThreeController,
                        ),
                      ],
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    SizedBox(
                      child: Text(
                        'These examples are here to inspire you — use them or write your own.',
                        style: TextStyle(
                          color: const Color(0xFF372D17) /* Dark-500 */,
                          fontSize: 16,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Divider(color: AppColors.borderColor, thickness: 1.5),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4,
                        children: [
                          _bulletText("Thank you God."),
                          _bulletText("Thank you Universe."),
                          _bulletText("Thank you Mom."),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bulletText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "•   ",
            style: TextStyle(
              color: Color(0xB2342D18),
              fontSize: 16,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xB2342D18),
                fontSize: 16,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget thankYouTextField({
    required double topPadding,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, left: 26, right: 26),
      child: Container(
        width: double.infinity,
        height: 68,
        padding: const EdgeInsets.only(top: 8, left: 10, right: 10),
        decoration: ShapeDecoration(
          color: const Color(0xFFF2E3D0),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x1E000000),
              blurRadius: 28,
              offset: Offset(0, 20),
            ),
          ],
        ),
        child: TextField(
          maxLines: 1,
          controller: controller,
          onEditingComplete: () {
            if (controller == thankOneController) {
              UserPreferences.setRitual5ThankInputData1(controller.text);
            } else if (controller == thankTwoController) {
              UserPreferences.setRitual5ThankInputData2(controller.text);
            } else if (controller == thankThreeController) {
              UserPreferences.setRitual5ThankInputData3(controller.text);
            }
            FocusScope.of(context).unfocus();
          },
          textCapitalization: TextCapitalization.sentences,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "type here...",
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 161, 161, 160),
              fontSize: 16,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),
          style: const TextStyle(
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
