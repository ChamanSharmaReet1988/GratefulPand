import 'package:flutter/material.dart';
import 'package:gratefull_panda/Affirmation/affirmation_favorite_screen.dart';
import 'package:gratefull_panda/Affirmation/create_your_mix_screen.dart';
import 'package:gratefull_panda/Affirmation/my_affirmation_screen.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/Database/category_db.dart';
import 'package:gratefull_panda/Home/ritualFour/ritual_four_explore_screen.dart';
import 'package:gratefull_panda/Models/category.dart';

class AffirmationScreen extends StatefulWidget {
  const AffirmationScreen({super.key});

  @override
  State<AffirmationScreen> createState() => _AffirmationScreenState();
}

class _AffirmationScreenState extends State<AffirmationScreen> {
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
              padding: const EdgeInsets.only(top: 74, bottom: 24),
              child: Column(
                children: [
                  Padding(
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

                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        affirmationCardWithTitle(
                          imagePath: "assets/attract_love.png",
                          title: "Favourites",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const AffirmationFavoriteScreen(),
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 24),
                        affirmationCardWithTitle(
                          imagePath: "assets/faith_surrender.png",
                          title: "My Affirmation",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const MyAffirmationScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: createMixButton(context),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final item = filteredData[index];
                return CategoryCard(category: item);
              }, childCount: filteredData.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: 144 / 162,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 150)),
        ],
      ),
    );
  }

  Widget affirmationCardWithTitle({
    required String imagePath,
    required String title,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath,
                width: (MediaQuery.of(context).size.width / 2) - 12 - 24,
                height:
                    (162 / 144) *
                    ((MediaQuery.of(context).size.width / 2) - 12 - 24),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: (MediaQuery.of(context).size.width / 2) - 12 - 24,

                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF342D18),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createMixButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CreateYourMixScreen()),
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: ShapeDecoration(
          color: const Color(0xFFF2E3D0),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1.50, color: Color(0xFFC07021)),
            borderRadius: BorderRadius.circular(8),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x99000000),
              blurRadius: 0,
              offset: Offset(1, 3),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset("assets/plus-sign-circle.png"),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Create your own mix',
                  style: TextStyle(
                    color: Color(0xFFC07021),
                    fontSize: 16,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 22,
              height: 22,
              child: Image.asset("assets/arrow-right-yellow.png"),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewToggle extends StatelessWidget {
  final bool isGrid;
  final VoidCallback onGridTap;
  final VoidCallback onFullTap;

  const ViewToggle({
    super.key,
    required this.isGrid,
    required this.onGridTap,
    required this.onFullTap,
  });

  @override
  Widget build(BuildContext context) {
    const double iconSize = 16.67;

    return Center(
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: ShapeDecoration(
          color: const Color(0xFFF2E3D0),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1.50, color: Color(0xFFC07021)),
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: const [
            BoxShadow(color: Color(0x99000000), offset: Offset(1, 3)),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onFullTap,
              child: Row(
                children: [
                  Image.asset(
                    isGrid
                        ? "assets/uncheckmark-circle.png"
                        : "assets/checkmark-circle.png",
                    width: iconSize,
                    height: iconSize,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Full',
                    style: isGrid
                        ? TextStyle(
                            color: Color(0xB2342D18),
                            fontSize: 14,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                          )
                        : TextStyle(
                            color: Color(0xFFC07021),
                            fontSize: 14,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                          ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: onGridTap,
              child: Row(
                children: [
                  Image.asset(
                    isGrid
                        ? "assets/checkmark-circle.png"
                        : "assets/uncheckmark-circle.png",
                    width: iconSize,
                    height: iconSize,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Grid',
                    style: isGrid
                        ? TextStyle(
                            color: Color(0xFFC07021),
                            fontSize: 14,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                          )
                        : TextStyle(
                            color: Color(0xB2342D18),
                            fontSize: 14,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
