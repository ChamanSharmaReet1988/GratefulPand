import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';

class DailyRitualView extends StatefulWidget {
  const DailyRitualView({super.key});

  @override
  State<DailyRitualView> createState() => _DailyRitualViewState();
}

class _DailyRitualViewState extends State<DailyRitualView> {

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
                    'Grounding Moment',
                    style: TextStyle(
                      color: Color(0xFF372D17),
                      fontSize: 18,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 40), 
            ],
          ),

          const SizedBox(height: 39),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Why this ritual helps?',
              style: TextStyle(
                color: Color(0xFF372D17),
                fontSize: 14,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 8),
          ritualsDescriptionWidget(),

          const SizedBox(height: 39),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Science behind it',
              style: TextStyle(
                color: Color(0xFF372D17),
                fontSize: 14,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 8),
          scienceBehindWidget(),

          const SizedBox(height: 39),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'In simple words',
              style: TextStyle(
                color: Color(0xFF372D17),
                fontSize: 14,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 8),
          simpleWordsWidget(),

          const SizedBox(height: 40),
        ],
      )
    )
  );
}

Widget ritualsDescriptionWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: ShapeDecoration(
            color: const Color(0xFFF8F1E9),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 2, color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            'The Grounding Moment is designed to shift your mind from autopilot into presence.\n\n'
            'All day, your brain collects noise — thoughts, stress, unfinished loops, tension. '
            'This ritual creates a tiny pause that clears mental static and signals to your mind, '
            '“We’re starting fresh.”\n\n'
            'Grounding helps you transition from reactive mode (where the brain is scanning for problems) '
            'to receptive mode (where the brain can feel gratitude, calm, and meaning).\n\n'
            'It prepares your attention system, so the rituals that follow don’t feel rushed or mechanical.\n\n'
            'It also builds predictability — your mind learns,\n\n'
            '“Every time I open Grateful Panda, my day slows down for a moment.”\n\n'
            'This consistency reduces cognitive load and improves long-term emotional regulation.',
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

Widget scienceBehindWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: ShapeDecoration(
        color: const Color(0xFFF8F1E9),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: const Text(
        'Grounding practices in general (pausing, orienting, reconnecting with your senses) have been shown to:\n\n'
        '- Reduce activity in the brain’s threat-detection network (amygdala)\n'
        '- Increase activation in the brain regions tied to presence and interoception (insula)\n'
        '- Improve emotional regulation through parasympathetic activation\n\n'
        'Studies:\n\n'
        'https://www.frontiersin.org/articles/10.3389/fnhum.2018.00044/full\n\n'
        'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3108032/',
        style: TextStyle(
          color: Color(0xFF60512C),
          fontSize: 14,
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}

Widget simpleWordsWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: ShapeDecoration(
        color: const Color(0xFFF8F1E9),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: const Text(
        'Grounding resets your mind and prepares it to feel good things more deeply.',
        style: TextStyle(
          color: Color(0xFF60512C),
          fontSize: 14,
          fontFamily: 'Outfit',
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}

}