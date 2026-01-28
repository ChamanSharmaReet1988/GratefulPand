import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/Database/category_db.dart';
import 'package:gratefull_panda/Models/category.dart';

class GratitudeGuideScreen extends StatefulWidget {
  const GratitudeGuideScreen({super.key});

  @override
  State<GratitudeGuideScreen> createState() => _GratitudeGuideScreenState();
}

class _GratitudeGuideScreenState extends State<GratitudeGuideScreen> {
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
                    "Gratitude Guide",
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

          const SizedBox(height: 24),
          buildAreaSelector(),

          const SizedBox(height: 24),
          _buildStepsSection(),

          const SizedBox(height: 24),
          gratitudeExampleCard(
            title: "Gratitude Example",
            description:
                "I'm grateful for my persistence — even on days I wanted to stop, I kept showing up.",
          ),





          

          const SizedBox(height: 30),
        ],
      ),
    ),
    bottomNavigationBar: _buildBottomButtons(),
  );
}

Widget _buildStepsSection() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: const Color(0xFFE9D1B5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStepCard(
            stepTitle: "Step 1",
            mainText:
                "Remember one quality, habit, or small choice that helped you keep going.",
            exampleText:
                "Example: staying patient, showing up even when tired, forgiving yourself, starting again.",
          ),
          const SizedBox(height: 24),
          _buildStepCard(
            stepTitle: "Step 2",
            mainText:
                "Write a quiet thank-you to yourself — even one line is enough.",
            bodyPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          ),
        ],
      ),
      
    ),
  );
}

Widget gratitudeExampleCard({
  required String title,
  required String description,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          width: 1.5,
          color: Color(0xFFE9D1B5),
        ),
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF372D17),
            fontSize: 16,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 12),
        // const SizedBox(height: 12),

        // Divider
        const Divider(
          color: Color(0xFFE9D1B5),
          thickness: 1.5,
          height: 1,
        ),

        const SizedBox(height: 12),
        Text(
          description,
          style: const TextStyle(
            color: Color(0xB2342D18),
            fontSize: 16,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}

Widget _buildBottomButtons() {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 20, 70),
      child: Row(
        children: [
          // Refresh Button (Outline)
          Expanded(
            child: Container(
              height: 48,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 2,
                    color: Color(0xFFBE752B),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  // TODO: Refresh action
                },
                child: const Text(
                  "Refresh",
                  style: TextStyle(
                    color: Color(0xFFBE752B),
                    fontSize: 16,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // I'm Ready Button (Filled)
          Expanded(
            child: Container(
              height: 48,
              decoration: ShapeDecoration(
                color: const Color(0xFFC17C37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x99000000),
                    offset: Offset(1, 4),
                    blurRadius: 0,
                  )
                ],
              ),
              child: TextButton(
                onPressed: () {
                  // TODO: Ready action
                },
                child: const Text(
                  "I’m Ready",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildStepCard({
  required String stepTitle,
  required String mainText,
  String? exampleText,
  EdgeInsetsGeometry bodyPadding = const EdgeInsets.all(16),
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: 80,
        height: 28,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        decoration: const ShapeDecoration(
          color: Color(0xFFB59575),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          stepTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),

      Container(
        width: double.infinity,
        padding: bodyPadding,
        decoration: const ShapeDecoration(
          color: Color(0xFFFFF5E0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              offset: Offset(0, 2),
            )
          ],
        ),
       child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mainText,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Color(0xFF342D18),
                fontSize: 16,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
            ),

            if (exampleText != null) ...[
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1.5,
                      color: Color(0xFFE9D1B5),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  exampleText,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Color(0xB2342D18),
                    fontSize: 14,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    ],
  );
}

Widget buildAreaSelector() {
  final List<String> areas = [
    "Self",
    "Friends",
    "Family",
    "Partner & Love",
    "Children & Parenthood",
    "Pets & Companions",
    "Health & Body",
    "Work & Purpose",
    "Home & Sanctuary",
    "Nature & Environment",
    "The World & Humanity",
    "Money & Stability",
    "Learning & Growth",
    "Creativity & Expression",
    "Spirituality",
    "Moments & Simple Joys",
  ];

  int selectedIndex = 0;

  return StatefulBuilder(
    builder: (context, setState) {
      return Container(
        height: 32, // Container height based on vertical padding (7+7) + text height
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: areas.length,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (context, index) {
            final isSelected = index == selectedIndex;
            final areaText = areas[index];

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isSelected ? 8 : 6, // Selected: 8px, Unselected: 6px
                  vertical: 7, // Same for both
                ),
                decoration: ShapeDecoration(
                  color: isSelected ? const Color(0xFFBE752B) : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: isSelected
                        ? BorderSide.none
                        : const BorderSide(
                            width: 1,
                            color: Color(0xFFD2B981),
                          ),
                  ),
                  shadows: isSelected
                      ? const [
                          BoxShadow(
                            color: Color(0x99000000),
                            blurRadius: 0,
                            offset: Offset(1, 2),
                            spreadRadius: 0,
                          ),
                        ]
                      : [],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Calculate text width based on content
                    SizedBox(
                      width: _calculateTextWidth(areaText, isSelected),
                      child: Text(
                        areaText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isSelected
                              ? const Color(0xFFFFF5E0)
                              : const Color(0xFF8E7743),
                          fontSize: 12,
                          fontFamily: 'Outfit',
                          fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                          height: 1.0, // No extra line spacing
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

// Helper function to calculate text width based on Figma examples
double _calculateTextWidth(String text, bool isSelected) {
  // Based on Figma: "Self" (selected) = 32px width, "Friends" (unselected) = 40px width
  // These are minimum widths, text will expand if longer
  
  final textLength = text.length;
  
  if (isSelected) {
    // For selected state, use dynamic width based on text
    return (textLength * 7.0).clamp(32.0, double.infinity);
  } else {
    // For unselected state, use dynamic width
    return (textLength * 8.0).clamp(40.0, double.infinity);
  }
}

}