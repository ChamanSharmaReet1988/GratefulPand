import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';

class ScienceBehindView extends StatefulWidget {
  const ScienceBehindView({super.key});

  @override
  State<ScienceBehindView> createState() => _ScienceBehindViewState();
}

class _ScienceBehindViewState extends State<ScienceBehindView> {
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
                    'Science Behind',
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

          const SizedBox(height: 28),
          researchQuoteWidget(
            title: 'HARVARD MEDICAL SCHOOL',
            quote:
                '"Gratitude helps you feel more positive emotions, relish good experiences, improve your health, deal with adversity, and build strong relationships."',
          ),
          researchQuoteWidget(
            title: 'UCLA Health',
            quote:
                '"Regularly expressing gratitude literally changes the molecular structure of the brain, keeps gray matter functioning, and makes us healthier and happier"',
          ),
          researchQuoteWidget(
            title: 'UC Berkeley',
            quote:
                '"Gratitude unshackles us from toxic emotions. It works even if you don\'t share it with anyone, strengthening your immune system and lowering blood pressure."',
          ),

          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Rituals',
              style: TextStyle(
              color: const Color(0xFF372D17),
              fontSize: 14,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 8),
          ritualsWidget(
            onItemTap: (title) {
              print("Clicked on: $title");
            },
          ),

          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Features',
              style: TextStyle(
              color: const Color(0xFF372D17),
              fontSize: 14,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
              ),
            ),
          ),

          const SizedBox(height: 8),
          featureWidget(
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

Widget ritualsWidget({Function(String title)? onItemTap}) {
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

Widget featureWidget({Function(String title)? onItemTap}) {
  final rituals = [
    "Gratitude",
    "Affirmation",
    "Vision board",
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

Widget researchQuoteWidget({
  required String title,
  required String quote,
  String underlineImage = 'assets/underline.png', 
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: ShapeDecoration(
        color: const Color(0xFFF8F1E9),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF994E00),
              fontSize: 12,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),

          Image.asset(
            underlineImage,
            fit: BoxFit.fitWidth,
            width: 36,
          ),
          const SizedBox(height: 8),

          Text(
            quote,
            style: const TextStyle(
              color: Color(0xFF60512C),
              fontSize: 14,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
  );
}
}