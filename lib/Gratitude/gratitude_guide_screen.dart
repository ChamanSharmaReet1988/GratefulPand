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





          

          const SizedBox(height: 30),
        ],
      ),
    ),
  );
}

// Widget buildAreaSelector() {
//   final List<String> areas = [
//     "Self",
//     "Friends",
//     "Family",
//     "Partner & Love",
//     "Children & Parenthood",
//     "Pets & Companions",
//     "Health & Body",
//     "Work & Purpose",
//     "Home & Sanctuary",
//     "Nature & Environment",
//     "The World & Humanity",
//     "Money & Stability",
//     "Learning & Growth",
//     "Creativity & Expression",
//     "Spirituality",
//     "Moments & Simple Joys",
//   ];

//   int selectedIndex = 0;

//   return StatefulBuilder(
//     builder: (context, setState) {
//       return SizedBox(
//         height: 40,
//         child: ListView.separated(
//           scrollDirection: Axis.horizontal,
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           itemCount: areas.length,
//           separatorBuilder: (_, __) => const SizedBox(width: 8),
//           itemBuilder: (context, index) {
//             final isSelected = index == selectedIndex;

//             return GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedIndex = index;
//                 });
//               },
//               child: IntrinsicWidth(
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
//                   decoration: ShapeDecoration(
//                     color: isSelected ? const Color(0xFFBE752B) : null,
//                     shape: RoundedRectangleBorder(
//                       side: isSelected
//                           ? BorderSide.none
//                           : const BorderSide(
//                               width: 1,
//                               color: Color(0xFFD2B981),
//                             ),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     shadows: isSelected
//                         ? const [
//                             BoxShadow(
//                               color: Color(0x99000000),
//                               blurRadius: 0,
//                               offset: Offset(1, 2),
//                               spreadRadius: 0,
//                             ),
//                           ]
//                         : [],
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         areas[index],
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: isSelected
//                               ? const Color(0xFFFFF5E0) 
//                               : const Color(0xFF8E7743), 
//                           fontSize: 12,
//                           fontFamily: 'Outfit',
//                           fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       );
//     },
//   );
// }

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