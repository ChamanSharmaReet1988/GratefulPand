import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';

class RitualView extends StatefulWidget {
  const RitualView({super.key});

  @override
  State<RitualView> createState() => _RitualViewState();
}

class _RitualViewState extends State<RitualView> {
  bool grounding = true;
  bool iAm = true;
  bool gratitude = false;
  bool affirmation = true;
  bool threeThanks = false;

  @override
  void initState() {
    super.initState();
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: AppColors.splashBackgroundColor,
    body: SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24, top: 66),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
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
                    'Rituals',
                    style: TextStyle(
                      color: Color(0xFF372D17),
                      fontSize: 18,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 56),
            ],
          ),

          const SizedBox(height: 20),
          ritualsDescriptionWidget(),

          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Manage your Rituals',
              style: TextStyle(
              color: const Color(0xFF372D17),
              fontSize: 14,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
              ),
            ),
          ),

         const SizedBox(height: 8),
         manageYourRitualWidget(),

         const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Why these rituals?',
              style: TextStyle(
              color: const Color(0xFF372D17),
              fontSize: 14,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 8),
          ritualsNavigationWidget(
            onItemTap: (title) {
              print("Clicked on: $title");
            },
          ),

          const SizedBox(height: 40),
        ],
      ),
    ),
  );
}

Widget ritualsNavigationWidget({Function(String title)? onItemTap}) {
  final rituals = [
    "Grounding Moment",
    "I Am",
    "Today’s Gratitude",
    "Affirmation",
    "Three Thank-Yous",
  ];

  return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    decoration: ShapeDecoration(
      color: const Color(0xFFF8F1E9),
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 2, color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Column(
      children: List.generate(rituals.length, (index) {
        final title = rituals[index];
        final isLast = index == rituals.length - 1;

        return GestureDetector(
          onTap: () {
            if (onItemTap != null) {
              onItemTap(title);
            }
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 26), 
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF2D2511),
                      fontSize: 14,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Image.asset(
                  "assets/arrow-right_rounded.png",
                  height: 20,
                  width: 20,
                ),
              ],
            ),
          ),
        );
      }),
    ),
  ),
);
}

Widget ritualsDescriptionWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What Are Rituals?',
          style: TextStyle(
            color: Color(0xFF372D17),
            fontSize: 14,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: ShapeDecoration(
            color: const Color(0xFFF8F1E9),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2, color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            'Rituals are small daily practices that gently train your mind to feel calmer, clearer, and more grounded.\n\n'
            'Each one strengthens a different part of your emotional wellbeing — how you breathe, how you speak to yourself, what you notice, and what you appreciate.\n\n'
            'They’re short, science-backed exercises that slowly shape how you think and feel, one day at a time.',
            style: TextStyle(
              color: Color(0xFF60512C),
              fontSize: 14,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget manageYourRitualWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      decoration: ShapeDecoration(
        color: const Color(0xFFF8F1E9),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        children: [
          ritualRow("Grounding Moment", grounding, () {
              setState(() => grounding = !grounding);
            }),
            ritualRow("I Am", iAm, () {
              setState(() => iAm = !iAm);
            }),
            ritualRow("Today’s Gratitude", gratitude, () {
              setState(() => gratitude = !gratitude);
            }),
            ritualRow("Affirmation", affirmation, () {
              setState(() => affirmation = !affirmation);
            }),
            ritualRow("Three Thank-Yous", threeThanks, () {
              setState(() => threeThanks = !threeThanks);
            }),
        ],
      ),
    ),
  );
}

Widget ritualRow(String title, bool isEnabled, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.opaque,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF2D2511),
                fontSize: 14,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Image.asset(
            isEnabled ? "assets/switchon.png" : "assets/switchoff.png",
            height: 28,
          ),
        ],
      ),
    ),
  );
}
}