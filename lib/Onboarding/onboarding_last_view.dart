import 'package:flutter/material.dart';
import 'package:gratefull_panda/Common/common.dart';
import 'package:gratefull_panda/Onboarding/onboarding_subscription_screen.dart';
import 'package:gratefull_panda/Onboarding/reminder_view.dart';
import 'package:gratefull_panda/constant/color_constant.dart';
import 'package:gratefull_panda/Utils/user_preferences.dart';

class OnboardingLastView extends StatefulWidget {
  const OnboardingLastView({super.key});

  @override
  State<OnboardingLastView> createState() => _OnboardingLastViewState();
}

class _OnboardingLastViewState extends State<OnboardingLastView> {
  late TextEditingController nameController;
  late TextEditingController pandaController;
  late TextEditingController reminderController;
  String reminderImage = "";
  List<Map<String, String>> selectedData = [];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    pandaController = TextEditingController();
    reminderController = TextEditingController();
    _loadUserData();
  }

  @override
  void dispose() {
    nameController.dispose();
    pandaController.dispose();
    reminderController.dispose();
    super.dispose();
  }

  void _loadUserData() async {
    final savedName = await UserPreferences.getUserName();
    final savedReminder = await UserPreferences.getReminderTime();
    final savedImage = await UserPreferences.getReminderImage();
    final savedPandaName = await UserPreferences.getPandaName();
    final data = await UserPreferences.getOnboardingTwoSelectedFeelArray();

    setState(() {
      nameController.text = savedName ?? "";
      pandaController.text = savedPandaName ?? "";
      reminderController.text = savedReminder ?? "";
      reminderImage = savedImage ?? "";
      selectedData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/onboardingfourbackground.png',
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset("assets/arrow-left.png"),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 24,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFF5E0),
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 90,
                          height: 90,
                          child: Image.asset("assets/panda_square_shape.png"),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "You're ready!",
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),

                        const SizedBox(height: 24),
                        _buildLabeledTextField("Your name", nameController),
                        const SizedBox(height: 16),
                        _buildLabeledTextField("Your panda", pandaController),
                        const SizedBox(height: 16),
                        _buildReminderTextField(
                          "Your daily reminder",
                          reminderController,
                        ),

                        const SizedBox(height: 16),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Your intention",
                            style: TextStyle(
                              color: Color(0xFF2D2511),
                              fontSize: 16,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(selectedData.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: _buildBulletItem(
                                selectedData[index]["title"] ?? "",
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "You’ve already taken your first step. The rest we’ll do together, one small moment at a time.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF60512C),
                        fontSize: 16,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OnboardingSubscriptionScreen(
                      isFromOnboarding: true,
                    ),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Continue",
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
    );
  }

  Widget _buildLabeledTextField(
    String label,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.headingBlackishColor,
            fontSize: 16,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
            isDense: true,
          ),
          style: TextStyle(
            color: AppColors.headingTextColor,
            fontSize: 14,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
          ),
          onChanged: (value) {
            if (label == "Your name") {
              UserPreferences.saveUserName(value);
            }
          },
        ),
        const SizedBox(height: 8),
        const Divider(color: AppColors.whitingTextColor, thickness: 1),
      ],
    );
  }

  Widget _buildReminderTextField(
    String label,
    TextEditingController controller,
  ) {
    final bool isEmpty = controller.text.trim().isEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF2D2511),
            fontSize: 16,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
          ),
        ),

        GestureDetector(
          onTap: () {
            pushFromBottom(
              context,
              ReminderViewScreen(isFromOnboarding: false),
            );
          },
          behavior: HitTestBehavior.opaque, // important
          child: Row(
            children: [
              Image.asset(
                isEmpty || reminderImage.isEmpty
                    ? "assets/notification.png"
                    : "assets/$reminderImage.png",
                width: 20,
                height: 20,
              ),

              const SizedBox(width: 6),

              Expanded(
                child: IgnorePointer(
                  child: TextField(
                    controller: controller,
                    readOnly: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: isEmpty ? "Reminder not set" : null,
                    ),
                    style: TextStyle(
                      color: isEmpty ? Color(0xFF994E00) : Color(0xFF60512C),
                      fontFamily: 'Outfit',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              if (isEmpty)
                Image.asset("assets/settings.png", width: 20, height: 20),
            ],
          ),
        ),

        const Divider(color: AppColors.whitingTextColor, thickness: 1),
      ],
    );
  }

  Widget _buildBulletItem(String text) {
    return Row(
      children: [
        const Icon(Icons.circle, size: 6, color: AppColors.headingTextColor),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: const Color(0xFF60512C),
              fontSize: 14,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
