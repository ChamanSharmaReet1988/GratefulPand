import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/Database/category_db.dart';
import 'package:gratefull_panda/Models/category.dart';
import 'package:gratefull_panda/Settings/settings_view.dart';
import 'package:gratefull_panda/Gratitude/gratitude_myentry_screen.dart';
import 'package:intl/intl.dart';

class GratitudeScreen extends StatefulWidget {
  const GratitudeScreen({super.key});

  @override
  State<GratitudeScreen> createState() => _GratitudeScreenState();
}

class _GratitudeScreenState extends State<GratitudeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Category> filteredData = [];
  List<Category> affirmationList = [];
  bool isGridView = true;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    loadCategories();
  }

  Future<void> loadCategories() async {
    List<Category> categories = await CategoryDb.instance.getAllCategories();
    setState(() {
      affirmationList = categories;
      filteredData = affirmationList;
    });
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase().trim();
    setState(() {
      filteredData = query.isEmpty
          ? affirmationList
          : affirmationList
                .where((item) => item.title.toLowerCase().contains(query))
                .toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,

      body: Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: _buildMenuIcon(),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: buildFloatingGratitudeButton(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    buildSearchField(controller: _searchController),

                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: buildWeeklyCalendar(),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: buildPromptOfTheDayCard(),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: buildAffirmationList(),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: buildTodayPromptCard(),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: buildGratitudeCard(),
                    ),
                    const SizedBox(height: 110),
                  ],
                ),
              ),
            ),
          ],
        ),
        ],
      ),
    );
  }

  Widget buildSearchField({
  required TextEditingController controller,
  String hintText = 'Search',
  String iconPath = "assets/search.png",
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.40),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 22,
            height: 22,
            child: Image.asset(iconPath),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFFA7A7A7),
                  fontSize: 16,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildFloatingGratitudeButton() {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const GratitudeMyentryScreen(),
        ),
      );
    },
    child: Container(
      height: 40,
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: const Color(0xFFF2E3D0),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1.5, color: Color(0xFFC07021)),
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x99000000),
            offset: Offset(1, 3),
            blurRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/gartitude_fill.png",
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8),
          const Text(
            'Express Gratitude',
            style: TextStyle(
              color: Color(0xFFBE752B),
              fontSize: 16,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
  );
}

  Widget buildGratitudeCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16), 
    child: Container(
      width: double.infinity, 
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: const Color(0xFFFFF5E0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            offset: Offset(1, 3),
            blurRadius: 0,
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '🐼',
            style: TextStyle(
              color: Color(0xFF60512C),
              fontSize: 32,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'TUE, 22 NOV',
                style: TextStyle(
                  color: Color(0xFF60512C),
                  fontSize: 12,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                width: 24,
                height: 24,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: Image.asset(
                  "assets/voice.png",
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Recall one everyday thing you did that quietly made your life easier.',
                style: TextStyle(
                  color: Color(0xFF5A5F63),
                  fontSize: 14,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'User answer will be here based on the prompt.',
                style: TextStyle(
                  color: Color(0xFF342D18),
                  fontSize: 14,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          buildGratitudeImages(),
        ],
      ),
    ),
  );
}

Widget buildGratitudeImages() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Expanded(
            flex: 3,
            child: _gratitudeImage(
              "assets/gratitude_rectangle1.png",
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(4),
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
              borderWidth: 3,
            ),
          ),
          Expanded(
            flex: 2,
            child: _gratitudeImage(
              "assets/gratitude_rectangle2.png",
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
              borderWidth: 3,
              padding: 8,
            ),
          ),
        ],
      ),
      
      Row(
        children: [
          Expanded(
            flex: 2,
            child: _gratitudeImage(
              "assets/gratitude_rectangle3.png",
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(4),
              ),
              borderWidth: 2,
              padding: 8,
            ),
          ),
          Expanded(
            flex: 3,
            child: _gratitudeImage(
              "assets/gratitude_rectangle4.png",
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(12),
              ),
              borderWidth: 2,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _gratitudeImage(
  String assetPath, {
  required BorderRadius borderRadius,
  required double borderWidth,
  double padding = 0,
}) {
  return Container(
    height: 100,
    padding: EdgeInsets.all(padding),
    decoration: ShapeDecoration(
      image: DecorationImage(
        image: AssetImage(assetPath),
        fit: BoxFit.cover,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: borderWidth,
          color: const Color(0xFFFFF5E0),
        ),
        borderRadius: borderRadius,
      ),
    ),
  );
}
  
  Widget buildAffirmationList() {
  return ListView.builder(
    padding: EdgeInsets.zero, 
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: dummyAffirmations.length,
    itemBuilder: (context, index) {
      final item = dummyAffirmations[index];

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: ShapeDecoration(
            color: const Color(0xFFFFF5E0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                offset: Offset(1, 3),
                blurRadius: 0,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Image.asset(
                    item.imagePath,
                    width: 30,
                    height: 30,
                    fit: BoxFit.contain,
                  ),

                  const Spacer(),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF2E3D0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      item.tag,
                      style: const TextStyle(
                        color: Color(0xFFB59575),
                        fontSize: 14,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),
              Text(
                item.day,
                style: const TextStyle(
                  color: Color(0xFF60512C),
                  fontSize: 12,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 8),
              Text(
                item.text,
                style: const TextStyle(
                  color: Color(0xFF60512C),
                  fontSize: 16,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

  Widget _buildMenuIcon() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SetingsView()),
        );
      },
      child: Image.asset('assets/menuHome.png', height: 40, width: 40),
    );
  }

 Widget buildWeeklyCalendar() {
  final DateTime today = DateTime.now();

  final List<DateTime> days = List.generate(
    7,
    (index) => today.add(Duration(days: index - 3)),
  );

  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    decoration: ShapeDecoration(
      color: const Color(0xFFF2E3D0),
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1.5, color: Color(0xFFC07021)),
        borderRadius: BorderRadius.circular(16),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x99000000),
          offset: Offset(1, 3),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: days.map((date) {
        final bool isToday =
            date.day == today.day &&
            date.month == today.month &&
            date.year == today.year;

        final bool isFuture = date.isAfter(today);

        return _dayItem(
          day: DateFormat('E').format(date),
          date: date.day.toString(),
          isToday: isToday,
          isFuture: isFuture,
        );
      }).toList(),
    ),
  );
}
  Widget _dayItem({
    required String day,
    required String date,
    required bool isToday,
    required bool isFuture,
  }) {
    String iconPath;
    if (isToday) {
      iconPath = 'assets/checkmark-circle-white.png';
    } else if (isFuture) {
      iconPath = 'assets/checkmark-circle-blur.png';
    } else {
      iconPath = 'assets/checkmark-circle-dark.png';
    }

    Color dayColor;
    Color dateColor;

    if (isToday) {
      dayColor = const Color(0xFFFFE7B2);
      dateColor = const Color(0xFFF2E3D0);
    } else if (isFuture) {
      dayColor = const Color(0xFFB59575);
      dateColor = const Color(0xFFB59575);
    } else {
      dayColor = const Color(0xFF60512C);
      dateColor = const Color(0xFF342D18);
    }

    return Container(
      width: 40,
      padding: const EdgeInsets.fromLTRB(8, 12, 6, 12), 
      decoration: isToday
        ? ShapeDecoration(
            color: const Color(0xFFB68554),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFFFF5E0)),
              borderRadius: BorderRadius.circular(12),
            ),
          )
        : null,
      
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            day,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: dayColor,
              fontSize: 11,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: dateColor,
              fontSize: 16,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),

          SizedBox(
            width: 14,
            height: 14,
            child: Image.asset(iconPath, fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }

  Widget buildPromptOfTheDayCard() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: ShapeDecoration(
      color: const Color(0xFFFFF5E0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x3F000000),
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: ShapeDecoration(
                color: const Color(0xFFB59575),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Prompt of the day',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Text(
              '#SELF',
              style: TextStyle(
                color: Color(0xFF994E00),
                fontSize: 12,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),
        const Text(
          '“Remember one quality, habit, or small choice that helped you keep going.”',
          style: TextStyle(
            color: Color(0xFF60512C),
            fontSize: 14,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
          ),
        ),

        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: ShapeDecoration(
            color: const Color(0xFFF2E3D0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            'Write a quiet thank-you to yourself — even one line is enough.',
            style: TextStyle(
              color: Color(0xFF60512C),
              fontSize: 16,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildTodayPromptCard() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: ShapeDecoration(
      color: const Color(0xFFFFF5E0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x3F000000),
          offset: Offset(1, 3),
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          '💬',
          style: TextStyle(
            color: Color(0xFF60512C),
            fontSize: 32,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
          ),
        ),

        SizedBox(height: 8),
        Text(
          'TODAY',
          style: TextStyle(
            color: Color(0xFF60512C),
            fontSize: 12,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
          ),
        ),

        SizedBox(height: 8),
        Text(
          'Think of a time you comforted or encouraged yourself when no one else could.',
          style: TextStyle(
            color: Color(0xFF5A5F63),
            fontSize: 14,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}

}

class AffirmationModel {
  final String tag;
  final String day;
  final String text;
  final String imagePath; 

  AffirmationModel({
    required this.tag,
    required this.day,
    required this.text,
    required this.imagePath,
  });
}

final List<AffirmationModel> dummyAffirmations = [
  AffirmationModel(
    tag: "I am",
    day: "TODAY",
    text: "I am learning to see my thoughts, not become them.",
    imagePath: "assets/thumbs-up.png",
  ),
  AffirmationModel(
    tag: "Gratitude ritual",
    day: "YESTERDAY",
    text: "I am learning to see my thoughts, not become them.",
    imagePath: "assets/gartitude_fill.png",
  ),
  AffirmationModel(
    tag: "Three Thank-Yous",
    day: "MONDAY",
    text: "1. Thank you, God\n"
          "2. Thank you, Universe\n"
          "3. Thank you, Mom",
    imagePath: "assets/thumbs-up.png",
  ),
];
