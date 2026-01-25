
import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/Database/category_db.dart';
import 'package:gratefull_panda/Models/category.dart';
import 'package:gratefull_panda/Settings/settings_view.dart';
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

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: _buildMenuIcon(),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            child: Image.asset("assets/search.png"),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: Color(0xFFA7A7A7),
                                  fontSize: 16,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0,
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                    child: buildTodayPromptCard(),
                  ),

                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: buildGratitudeCard(),
                  ),

                  const SizedBox(height: 150),

                  
                ]
              )
            )
          )
        ]
      )
    );
  }

  Widget buildGratitudeCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16), // 16px from screen edges
    child: Container(
      width: double.infinity, // takes all available width
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
          // Emoji
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
          // Date row
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
                child: Stack(),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Prompt & User answer
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
          // Gratitude Images (2x2)
          buildGratitudeImages(),
        ],
      ),
    ),
  );
}

/// 2x2 Gratitude Image Grid using local assets
Widget buildGratitudeImages() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // First row
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
          // const SizedBox(width: 8),
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
      // const SizedBox(height: 8),
      // Second row
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
          // const SizedBox(width: 8),
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

/// Helper widget for each gratitude image
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
        // decoration: 
        // ShapeDecoration(
        //     color: const Color(0xFFB68554),
        //     shape: RoundedRectangleBorder(
        //       side: const BorderSide(width: 1, color: Color(0xFFFFF5E0)),
        //       borderRadius: BorderRadius.circular(12),
        //     ),
        //   ),
        
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
        // Top row
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

        // Quote text
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

        // Inner prompt box
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
        // Emoji
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

        // Title
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

        // Description
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
