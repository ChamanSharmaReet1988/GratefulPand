import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/utils/user_preferences.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  String selectedGender = 'She / Her';
  final TextEditingController pandaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadPandaName();
  }

  Future<void> _loadPandaName() async {
    final name = await UserPreferences.getPandaName();
    pandaController.text = name?.isNotEmpty == true ? name! : "Mochi";
  }

  @override
  void dispose() {
    pandaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24, top: 66),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset("assets/back.png"),
                    ),
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Your Panda',
                      style: TextStyle(
                        color: Color(0xFF372D17),
                        fontSize: 18,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
              ],
            ),


            const SizedBox(height: 27),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: pandaProfileCard(
                controller: pandaController,
                selectedGender: selectedGender,
                onGenderSelected: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
            ),

            const SizedBox(height: 32),
            Center(child: pandaImage()),
          ],
        ),
      ),
      bottomNavigationBar: saveButton(),
      
    );
  }

Widget pandaProfileCard({
  required TextEditingController controller,
  required String selectedGender,
  required Function(String) onGenderSelected,
}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    decoration: ShapeDecoration(
      color: const Color(0xFFF8F1E9),
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 2, color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Name of Panda',
          style: TextStyle(
            color: Color(0xFF60512C),
            fontSize: 12,
            fontFamily: 'Outfit',
          ),
        ),
        const SizedBox(height: 8),

        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          decoration: ShapeDecoration(
            color: const Color(0xFFF8F1E9),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFD2B981)),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: TextField(
            controller: controller,
            style: const TextStyle(
              color: Color(0xFF4D290C),
              fontSize: 14,
              fontFamily: 'Outfit',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Enter panda name",
              hintStyle: TextStyle(
                color: Color(0xFFB89B6A),
                fontSize: 14,
                fontFamily: 'Outfit',
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),

        const Text(
          'Gender',
          style: TextStyle(
            color: Color(0xFF60512C),
            fontSize: 12,
            fontFamily: 'Outfit',
          ),
        ),
        const SizedBox(height: 8),

        genderOption(
          title: 'She / Her',
          selected: selectedGender == 'She / Her',
          onTap: () => onGenderSelected('She / Her'),
        ),
        const SizedBox(height: 8),

        genderOption(
          title: 'He / Him',
          selected: selectedGender == 'He / Him',
          onTap: () => onGenderSelected('He / Him'),
        ),
        const SizedBox(height: 8),

        genderOption(
          title: 'They / Them',
          selected: selectedGender == 'They / Them',
          onTap: () => onGenderSelected('They / Them'),
        ),
      ],
    ),
  );
}

Widget genderOption({
  required String title,
  required bool selected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: ShapeDecoration(
        color: selected ? const Color(0xFFF2E3D0) : null,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1.5, color: Color(0xFFE9D1B5)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            selected
                ? 'assets/heart_selected.png'
                : 'assets/heart_unselected.png',
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF4D290C),
                fontSize: 14,
                fontFamily: 'Outfit',
              ),
            ),
          ),
          if (selected)
            Image.asset(
              'assets/checkcircle.png',
              width: 18,
              height: 18,
            ),
        ],
      ),
    ),
  );
}

  Widget pandaImage() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        'assets/panda.png',
        width: 64,
        height: 44.31,
        fit: BoxFit.contain,
      ),
      const SizedBox(height: 8),
      const SizedBox(
        width: 312,
        child: Text(
          'Your rituals give Panda the energy to grow\n'
          'a little every day',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF60512C),
            fontSize: 14,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ],
  );
}

Widget saveButton() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 16, 16, 50), // ✅ bottom: 50
    child: Container(
      width: 320,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: ShapeDecoration(
        color: const Color(0xFFC17C37),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x99000000),
            blurRadius: 0,
            offset: Offset(1, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: const Center(
        child: Text(
          'Save',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}
}
