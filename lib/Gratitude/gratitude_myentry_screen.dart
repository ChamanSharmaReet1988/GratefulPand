import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/Database/category_db.dart';
import 'package:gratefull_panda/Models/category.dart';

class GratitudeMyentryScreen extends StatefulWidget {
  const GratitudeMyentryScreen({super.key});

  @override
  State<GratitudeMyentryScreen> createState() => _GratitudeMyentryScreenState();
}

class _GratitudeMyentryScreenState extends State<GratitudeMyentryScreen> {
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
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SizedBox(
              height: 30,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 20,
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
                  const Text(
                    "My Entry",
                    style: TextStyle(
                      color: Color(0xFF372D17),
                      fontSize: 18,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 42),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: buildCurrentStreakCard(),
          ),

          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: buildStatsCard(
              bestStreak: "4 Days",
              totalDays: "5 Days",
              totalEntries: "5",
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: buildCalendarCard(),
          ),

          const SizedBox(height: 30),
        ],
      ),
    ),
  );
}

  Widget buildCurrentStreakCard() {
  return Container(
    width: 312,
    padding: const EdgeInsets.all(1),
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
        )
      ],
    ),
    child: Row(
      children: [
        Expanded(
          child: _streakItem(
            iconPath: "assets/sparkles.png",
            title: "Current Streak",
            value: "4 Days",
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _streakItem(
            iconPath: "assets/flag.png",
            title: "Next Milestone",
            value: "7 Days",
          ),
        ),
      ],
    ),
  );
}

Widget _streakItem({
  required String iconPath,
  required String title,
  required String value,
}) {
  return Row(
    children: [
      Image.asset(
        iconPath,
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      ),
      const SizedBox(width: 8),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF60512C),
              fontSize: 12,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF372D17),
              fontSize: 16,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget buildStatsCard({
  required String bestStreak,
  required String totalDays,
  required String totalEntries,
}) {
  return Container(
    padding: const EdgeInsets.all(12),
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
      children: [
        _statItem(title: "Best Streak", value: bestStreak),
        _statItem(title: "Total Days", value: totalDays),
        _statItem(title: "Total Entries", value: totalEntries),
      ],
    ),
  );
}

Widget _statItem({
  required String title,
  required String value,
}) {
  return SizedBox(
    width: 90,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF60512C),
            fontSize: 12,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF372D17),
            fontSize: 14,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget buildCalendarCard() {
  DateTime currentMonth = DateTime.now();

  int daysInMonth(DateTime date) {
    final firstDayNextMonth = DateTime(date.year, date.month + 1, 1);
    return firstDayNextMonth.subtract(const Duration(days: 1)).day;
  }

  int firstWeekdayOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1).weekday % 7;
  }

  String monthName(int month) {
    const months = [
      '',
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month];
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool isBeforeOrToday(DateTime date) {
    final today = DateTime.now();
    final normalizedToday = DateTime(today.year, today.month, today.day);
    return date.isBefore(normalizedToday) || isSameDay(date, normalizedToday);
  }

  return StatefulBuilder(
    builder: (context, setState) {
      final totalDays = daysInMonth(currentMonth);
      final startOffset = firstWeekdayOfMonth(currentMonth);

      return Container(
        padding: const EdgeInsets.all(18),
        decoration: ShapeDecoration(
          color: const Color(0xFFF2E3D0),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1.5, color: Color(0xFFC07021)),
            borderRadius: BorderRadius.circular(24),
          ),
          shadows: const [
            BoxShadow(color: Color(0x99000000), offset: Offset(1, 3)),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentMonth = DateTime(
                        currentMonth.year,
                        currentMonth.month - 1,
                      );
                    });
                  },
                  child: const Icon(Icons.chevron_left),
                ),

                Text(
                  "${monthName(currentMonth.month)} ${currentMonth.year}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Outfit',
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentMonth = DateTime(
                        currentMonth.year,
                        currentMonth.month + 1,
                      );
                    });
                  },
                  child: const Icon(Icons.chevron_right),
                ),
              ],
            ),

            const SizedBox(height: 12), 

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero, 
              itemCount: totalDays + startOffset,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                childAspectRatio: 1.0, 
              ),
              itemBuilder: (context, index) {
                if (index < startOffset) {
                  return const SizedBox.shrink(); 
                }

                final dayNumber = index - startOffset + 1;

                final date = DateTime(
                  currentMonth.year,
                  currentMonth.month,
                  dayNumber,
                );

                final isToday = isSameDay(date, DateTime.now());

                return Container(
                  height: 32,
                  width: 32,  
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isToday ? const Color(0xFFBE752B) : null,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    "$dayNumber",
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isBeforeOrToday(date)
                          ? const Color(0xFF6F441B) 
                          : const Color(0xFFB59575), 
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
}
