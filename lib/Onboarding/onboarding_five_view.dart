import 'package:flutter/material.dart';
import 'package:gratefull_panda/Onboarding/onboarding_last_view.dart';
import 'package:gratefull_panda/constant/color_constant.dart';
import 'package:gratefull_panda/Utils/user_preferences.dart';

class OnboardingFiveViewScreen extends StatefulWidget {
  const OnboardingFiveViewScreen({super.key});

  @override
  State<OnboardingFiveViewScreen> createState() =>
      _OnboardingFiveViewScreenState();
}

class _OnboardingFiveViewScreenState extends State<OnboardingFiveViewScreen> {
  late TextEditingController nameController;
  String pandaName = "Mochi";

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    _loadPandaName();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Future<void> _loadPandaName() async {
    final savedPandaName = await UserPreferences.getPandaName();
    if (!mounted) return;

    setState(() {
      pandaName = savedPandaName ?? "Mochi";
    });
  }

  void _showCongratsBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.splashBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (context) {
        final screenHeight = MediaQuery.of(context).size.height;

        return SizedBox(
          height: screenHeight * 0.70,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16),
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),

              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 37,
                      child: Image.asset(
                        "assets/onboardingBubblethinkingImage.png",
                        width: 258,
                        height: 250,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      top: 210,
                      right: 50,
                      child: Image.asset(
                        "assets/gratefulPanda.png",
                        width: 180,
                        height: 210,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnboardingLastView(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFC17C37),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x99000000),
                          blurRadius: 0,
                          offset: Offset(1, 4),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Text(
                          'Continue',
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
              SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
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
                final name = nameController.text.trim();

                if (name.isEmpty) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please enter your name")),
                  );
                  return;
                }

                await UserPreferences.saveUserName(name);

                if (!mounted) return;
                _showCongratsBottomSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Start my journey",
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 16,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    width: MediaQuery.sizeOf(context).width * 0.9,
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
                          color: Color(0x99FF9E37),
                          blurRadius: 8,
                          offset: Offset(5, 0),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 10),
              child: Row(
                children: [
                  Image.asset(
                    "assets/onbordingPandaImage.png",
                    width: 72,
                    height: 62,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$pandaName is curious",
                          style: const TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "And what shall your $pandaName call you?",
                          style: const TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.headingTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 37),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 16, 8),
              child: Text(
                'Type your name',
                style: TextStyle(
                  color: Color(0xFF60512C),
                  fontSize: 14,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 64,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: ShapeDecoration(
                  color: const Color(0xFFF8F1E9),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Center(
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
