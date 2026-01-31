import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/Common/gratitude_category.dart';
import 'package:gratefull_panda/Gratitude/gratitude_writing_screen.dart';

class GratitudeGuideScreen extends StatefulWidget {
  const GratitudeGuideScreen({super.key});

  @override
  State<GratitudeGuideScreen> createState() => _GratitudeGuideScreenState();
}

class _GratitudeGuideScreenState extends State<GratitudeGuideScreen> {
  int selectedCategoryIndex = 0;
  int selectedItemIndex = 0;

  GratitudeCategory get currentCategory => gratitudeCategories[selectedCategoryIndex];
  Map<String, String> get currentItem => currentCategory.items[selectedItemIndex];

  void _onCategorySelected(int index) {
    setState(() {
      selectedCategoryIndex = index;
      selectedItemIndex = 0;
    });
  }

  void _onRefresh() {
    setState(() {
      selectedItemIndex = (selectedItemIndex + 1) % currentCategory.items.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 60),
            _buildHeader(),
            const SizedBox(height: 24),
            _buildAreaSelector(),
            const SizedBox(height: 24),
            _buildStepsSection(),
            const SizedBox(height: 24),
            _buildGratitudeExample(),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomButtons(),
    );
  }

  Widget _buildHeader() {
    return SizedBox(
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
                child: Image.asset("assets/arrow-left.png", fit: BoxFit.contain),
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
    );
  }

  Widget _buildAreaSelector() {
    return SizedBox(
      height: 32,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: gratitudeCategories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = gratitudeCategories[index];
          final isSelected = index == selectedCategoryIndex;

          return GestureDetector(
            onTap: () => _onCategorySelected(index),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: isSelected ? 8 : 6,
                vertical: 7,
              ),
              decoration: ShapeDecoration(
                color: isSelected ? const Color(0xFFBE752B) : Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: isSelected ? BorderSide.none : const BorderSide(color: Color(0xFFD2B981)),
                ),
                shadows: isSelected
                    ? const [
                        BoxShadow(
                          color: Color(0x99000000),
                          offset: Offset(1, 2),
                          blurRadius: 0,
                        ),
                      ]
                    : [],
              ),
              child: Center(
                child: Text(
                  "${category.categoryName}",
                  style: TextStyle(
                    color: isSelected ? const Color(0xFFFFF5E0) : const Color(0xFF8E7743),
                    fontSize: 12,
                    fontFamily: 'Outfit',
                    fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                    height: 1.0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
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
              mainText: currentItem["prompt"] ?? "",
              exampleText: currentItem["example"],
            ),
            const SizedBox(height: 24),
            _buildStepCard(
              stepTitle: "Step 2",
              mainText: currentItem["placeholder"] ?? "",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGratitudeExample() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1.5, color: Color(0xFFE9D1B5)),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Gratitude Example",
            style: TextStyle(
              color: Color(0xFF372D17),
              fontSize: 16,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          const Divider(color: Color(0xFFE9D1B5), thickness: 1.5),
          const SizedBox(height: 10),
          Text(
            currentItem["gratitude_example"] ?? "",
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
      padding: const EdgeInsets.fromLTRB(24, 0, 20, 40),
      child: Row(
        children: [
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
                onPressed: _onRefresh,
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => GratitudeWritingScreen(
                  //       category: currentCategory?.categoryName ?? '', 
                  //       itemData: currentItem ?? {},                   
                  //     ),
                  //   ),
                  // );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GratitudeWritingScreen(
                        category: currentCategory.categoryName,
                        itemData: currentItem,
                      ),
                    ),
                  );
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
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
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
              BoxShadow(color: Color(0x3F000000), offset: Offset(0, 2)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainText,
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
                      side: const BorderSide(width: 1.5, color: Color(0xFFE9D1B5)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    exampleText,
                    style: const TextStyle(
                      color: Color(0xB2342D18),
                      fontSize: 14,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      ],
    );
  }
}