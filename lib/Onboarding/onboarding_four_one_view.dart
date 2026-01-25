import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gratefull_panda/Common/data_source.dart';
import 'package:gratefull_panda/Onboarding/onboarding_four_two_view.dart';
import 'package:gratefull_panda/constant/color_constant.dart';
import 'package:gratefull_panda/Utils/user_preferences.dart';

class OnboardingFourView extends StatefulWidget {
  const OnboardingFourView({super.key});

  @override
  State<OnboardingFourView> createState() => _OnboardingFourViewState();
}

class _OnboardingFourViewState extends State<OnboardingFourView> {
  late TextEditingController nameTextField;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    nameTextField = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroungColor,
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 8, 24, 30),
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
              onPressed: () async {
                final pandaName = nameTextField.text.trim();

                if (pandaName.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter name of your panda.'),
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }
                await UserPreferences.savePandarName(pandaName);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RitualFourTwo()),
                );
              },
              child: const Center(
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/onboardingfourbackground.png',
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Image.asset(
                                    "assets/back.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 22,
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 4,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 104,
                                    ),
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
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.65,
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
                            SizedBox(height: 136),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 0,
                                ),
                                child: Image.asset(
                                  'assets/gratefulPanda.png',
                                  width: 122,
                                  height: 141,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: Text(
                                'Name your Panda',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF372D17),
                                  fontSize: 20,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: Text(
                                'Your gentle companion on this journey.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF60512C),
                                  fontSize: 16,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
                            Center(
                              child: Text(
                                'What would you like to name your Panda',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: const Color(0xFF60512C),
                                  fontSize: 14,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              child: Container(
                                width: double.infinity,
                                constraints: const BoxConstraints(
                                  minHeight: 64,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFF8F1E9),
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        controller: nameTextField,
                                        style: TextStyle(
                                          color: const Color(0xFF60512C),
                                          fontSize: 16,
                                          fontFamily: 'Outfit',
                                          fontWeight: FontWeight.w500,
                                        ),
                                        decoration: const InputDecoration(
                                          hintText: 'Enter Name',
                                          hintStyle: TextStyle(
                                            color: Color.fromARGB(
                                              255,
                                              157,
                                              157,
                                              156,
                                            ),
                                            fontSize: 16,
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w500,
                                          ),
                                          border: InputBorder.none,
                                          isDense: true,
                                          contentPadding: EdgeInsets.only(
                                            top: 4,
                                            bottom: 4,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Material(
                                      color: const Color(0xFFC17C37),
                                      borderRadius: BorderRadius.circular(8),
                                      elevation: 2,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(8),
                                        splashColor: Colors.white24,
                                        highlightColor: Colors.white10,
                                        onTap: () {
                                          nameTextField.text =
                                              nameSuggestions[_random.nextInt(
                                                nameSuggestions.length,
                                              )];
                                          FocusScope.of(context).unfocus();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 8,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                'assets/refresh.png',
                                                width: 12,
                                                height: 12,
                                                fit: BoxFit.contain,
                                              ),
                                              const SizedBox(width: 6),
                                              Text(
                                                'Suggest Name',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      constraints.maxWidth < 350
                                                      ? 11
                                                      : 12,
                                                  fontFamily: 'Outfit',
                                                  fontWeight: FontWeight.w400,
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
