import 'package:flutter/material.dart';
import 'package:gratefull_panda/Database/afirmation_db.dart';
import 'package:gratefull_panda/Database/category_db.dart';
import 'package:gratefull_panda/Home/RitualFour/ritual_four_category_screen.dart';
import 'package:gratefull_panda/Home/RitualFour/ritual_four_explore_screen.dart';
import 'package:gratefull_panda/Models/category.dart';
import 'package:gratefull_panda/Tabbar/tabbar_screen.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

class RitualFourOpeningScreen extends StatefulWidget {
  const RitualFourOpeningScreen({super.key});

  @override
  State<RitualFourOpeningScreen> createState() =>
      _RitualFourOpeningScreenState();
}

class _RitualFourOpeningScreenState extends State<RitualFourOpeningScreen> {
  Category? category;
  int affirmationCount = 0;
  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Future<void> loadCategories() async {
    List<Category> categories = await CategoryDb.instance.getAllCategories();
    final count = await AffirmationDb.instance.getAffirmationCountByCategoryId(
      categories[0].id!,
    );
    setState(() {
      category = categories[0];
      affirmationCount = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    void navigateToRootNoAnimation() {
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const TabBarScreen(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
        (route) => false,
      );
    }

    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Image.asset("assets/crossblack.png", height: 24),
                onPressed: navigateToRootNoAnimation,
              ),
            ),

            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 0),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 55),
                    padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                    decoration: BoxDecoration(
                      color: AppColors.darkBackgroungColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Column(
                      children: [
                        Text(
                          "RITUAL #4",
                          style: TextStyle(
                            color: Color(0xB2342D18),
                            fontSize: 14,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                            height: 1.29,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Affirmation",
                          style: TextStyle(
                            color: Color(0xFF342D18),
                            fontSize: 20,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "This ritual helps you speak to yourself with kindness.",
                            style: TextStyle(
                              color: Color(0xB2342D18),
                              fontSize: 15,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              height: 1.40,
                              letterSpacing: -0.15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SizedBox(
                        height: 120,
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.asset("assets/AffirmationOpening.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 44),
            _buildAwarenessBox(
              title: "Recommended",
              message: category?.title ?? "",
            ),

            const SizedBox(height: 38),
            _buildAffirmationsContainer(
              title: "More affirmations",
              message:
                  "Explore additional affirmation sets to support your mindset.",
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAwarenessBox({required String title, required String message}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 19,
      ), // spacing between multiple boxes
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            decoration: ShapeDecoration(
              color: const Color(0xFFB59575),
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
            ),
            child: IntrinsicWidth(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whitishBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32),
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      offset: Offset(0, 2),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70,
                      height: 92,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: AssetImage(
                            'assets/affermationselectedImg.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            message,
                            style: TextStyle(
                              color: Color(0xFF342D18),
                              fontSize: 16,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),

                          Row(
                            children: [
                              if (category?.played != "0")
                                Row(
                                  children: [
                                    Image.asset('assets/played.png', width: 16),
                                    const SizedBox(width: 4),
                                    const Text(
                                      'Played: 4 Times',
                                      style: TextStyle(
                                        color: Color(0xB2342D18),
                                        fontSize: 12,
                                        fontFamily: 'Outfit',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                  ],
                                ),

                              Row(
                                children: [
                                  Image.asset(
                                    'assets/healtcare.png',
                                    width: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Affirmations: $affirmationCount',
                                    style: const TextStyle(
                                      color: Color(0xB2342D18),
                                      fontSize: 12,
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              width: double.infinity,
                              height: 32,
                              child: Container(
                                width: double.infinity,
                                height: 32,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 6,
                                ),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFC17C37),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x99000000),
                                      blurRadius: 0,
                                      offset: Offset(1, 2),
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 10,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RitualFourCategoryScreen(
                                                    category: category!,
                                                  ),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          spacing: 10,
                                          children: [
                                            SizedBox(
                                              width: 167,
                                              child: Text(
                                                'Practice',
                                                style: TextStyle(
                                                  color: Colors
                                                      .white /* Grey-50 */,
                                                  fontSize: 12,
                                                  fontFamily: 'Outfit',
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Image.asset(
                                              'assets/arrow-right-White.png',
                                              width: 20,
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAffirmationsContainer({
    required String title,
    required String message,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 19,
      ), // spacing between multiple boxes
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => RitulFourExploreScreen()),
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF9EF), // Figma background
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white, width: 2),
            boxShadow: const [
              BoxShadow(
                color: Color(0x33000000), // Figma shadow
                blurRadius: 0,
                offset: Offset(3, 3),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 🔹 Icon on the left
              Container(
                width: 22,
                height: 22,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/menu-square.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Color(0xFF342D18),
                        fontSize: 14,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      message,
                      style: TextStyle(
                        color: Color(0xB2342D18),
                        fontSize: 12,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height: 40,
                width: 40,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/Union.png', height: 40, width: 40),
                    Image.asset(
                      'assets/arrow-right.png',
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
