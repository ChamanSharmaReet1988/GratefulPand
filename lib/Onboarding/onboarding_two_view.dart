import 'package:flutter/material.dart';
import 'package:gratefull_panda/Common/data_source.dart';
import 'package:gratefull_panda/Onboarding/onboarding_three_view.dart';
import 'package:gratefull_panda/Utils/user_preferences.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

class OnboardingTwoView extends StatefulWidget {
  const OnboardingTwoView({super.key});

  @override
  State<OnboardingTwoView> createState() => _OnboardingTwoViewState();
}

class _OnboardingTwoViewState extends State<OnboardingTwoView> {
  List<bool> selectedItems = [];

  @override
  void initState() {
    super.initState();
    selectedItems = List.generate(struggleData.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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

              onPressed: () {
                if (!selectedItems.contains(true)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select at least one option"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }

                // Collect selected data
                final selectedData = <Map<String, String>>[];
                for (int i = 0; i < struggleData.length; i++) {
                  if (selectedItems[i]) {
                    selectedData.add(struggleData[i]);
                  }
                }
                UserPreferences.setOnboardingTwoSelectedFeelArray(selectedData);

                // Navigate to next screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => OnboardingThreeViewScreen(),
                  ),
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

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset("assets/back.png", fit: BoxFit.contain),
                ),
              ),
            ),

            SizedBox(height: 18),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
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
                    width: MediaQuery.sizeOf(context).width * 0.25,
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

            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/onbordingPandaImage.png",
                    width: 72,
                    height: 62,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Which of these feels true for you today",
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Choose what you relate with.",
                          style: TextStyle(
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

            SizedBox(height: screenHeight * 0.04),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Column(
                  children: List.generate(struggleData.length, (index) {
                    final item = struggleData[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildCheckboxItem(
                        title: item["title"]!,
                        isSelected: selectedItems[index],
                        onChanged: (value) {
                          setState(() {
                            selectedItems[index] = value ?? false;
                          });
                        },
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxItem({
    required String title,
    required bool isSelected,
    required ValueChanged<bool?> onChanged,
  }) {
    return GestureDetector(
      onTap: () => onChanged(!isSelected),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.viewColorForCheckBoxView,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.white, width: 2),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Row(
          children: [
            Image.asset(
              isSelected ? "assets/check.png" : "assets/uncheck.png",
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.headingTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
