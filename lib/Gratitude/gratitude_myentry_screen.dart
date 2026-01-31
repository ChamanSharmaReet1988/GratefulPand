import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';

class GratitudeMyentryScreen extends StatefulWidget {
  const GratitudeMyentryScreen({super.key});

  @override
  State<GratitudeMyentryScreen> createState() => _GratitudeMyentryScreenState();
}

class _GratitudeMyentryScreenState extends State<GratitudeMyentryScreen> {
  DateTime currentMonth = DateTime.now();

  String monthName(int month) {
    const months = [
      '',
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month];
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
                          child: Image.asset("assets/arrow-left.png"),
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
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: const Color(0xFFF2E3D0),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1.5, color: Color(0xFFC07021)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Expanded(child: _streakItem("assets/sparkles.png", "Current Streak", "4 Days")),
          const SizedBox(width: 12),
          Expanded(child: _streakItem("assets/flag.png", "Next Milestone", "7 Days")),
        ],
      ),
    );
  }

  Widget _streakItem(String icon, String title, String value) {
    return Row(
      children: [
        Image.asset(icon, width: 24),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 12)),
            Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
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
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _statItem("Best Streak", bestStreak),
          _statItem("Total Days", totalDays),
          _statItem("Total Entries", totalEntries),
        ],
      ),
    );
  }

  Widget _statItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 12)),
        Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget buildCalendarCard() {
    int daysInMonth(DateTime date) {
      final firstDayNextMonth = DateTime(date.year, date.month + 1, 1);
      return firstDayNextMonth.subtract(const Duration(days: 1)).day;
    }

    int firstWeekday(DateTime date) {
      return DateTime(date.year, date.month, 1).weekday % 7;
    }

    bool isSameDay(DateTime a, DateTime b) =>
        a.year == b.year && a.month == b.month && a.day == b.day;

    final totalDays = daysInMonth(currentMonth);
    final offset = firstWeekday(currentMonth);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: ShapeDecoration(
        color: const Color(0xFFF2E3D0),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1.5, color: Color(0xFFC07021)),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Column(
        children: [

          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    currentMonth = DateTime(currentMonth.year, currentMonth.month - 1);
                  });
                },
                icon: const Icon(Icons.chevron_left),
              ),
              Text(
                "${monthName(currentMonth.month)} ${currentMonth.year}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
                  });
                },
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),

          const SizedBox(height: 12),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: totalDays + offset,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              childAspectRatio: 1.4, // 👈 reduces height
            ),
            itemBuilder: (context, index) {
              if (index < offset) return const SizedBox();

              final day = index - offset + 1;
              final date = DateTime(currentMonth.year, currentMonth.month, day);
              final isToday = isSameDay(date, DateTime.now());

              return Center(
                child: SizedBox(
                  height: 32,
                  width: 32,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isToday ? const Color(0xFFBE752B) : null,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      "$day",
                      style: TextStyle(
                        color: isToday ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}