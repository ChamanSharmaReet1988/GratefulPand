import 'package:flutter/material.dart';

import 'package:gratefull_panda/Database/category_db.dart';
import 'package:gratefull_panda/Home/RitualFour/ritual_four_category_screen.dart';
import 'package:gratefull_panda/Home/RitualFour/ritual_four_intro_screen.dart';
import 'package:gratefull_panda/Models/category.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

class RitulFourExploreScreen extends StatefulWidget {
  const RitulFourExploreScreen({super.key});

  @override
  State<RitulFourExploreScreen> createState() => _RitulFourExploreScreenState();
}

class _RitulFourExploreScreenState extends State<RitulFourExploreScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Category> filteredData = [];
  bool isSearching = false;
  List<Category> affirmationList = [];

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
      isSearching = query.isNotEmpty;

      if (query.isEmpty) {
        filteredData = affirmationList;
      } else {
        filteredData = affirmationList.where((item) {
          final name = item.title.toLowerCase();
          return name.contains(query);
        }).toList();
      }
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            SizedBox(
              height: 30,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.asset('assets/arrow-left.png'),
                      ),
                    ),
                  ),

                  const Text(
                    'Explore affirmation',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 26),
            Container(
              height: 52,
              decoration: BoxDecoration(
                color: AppColors.specialbackColorForSomeViews,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.white, width: 1),
              ),
              child: TextField(
                controller: _searchController,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,

                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: AppColors.searchBarPlaceHolderColor,
                    fontSize: 16,
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),

                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                  child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset(
                        'assets/search.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 48,
                    minHeight: 48,
                  ),
                ),
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(top: 18),
                itemCount: affirmationList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.87,
                ),
                itemBuilder: (context, index) {
                  final item = affirmationList[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              RitualFourCategoryScreen(category: item),
                        ),
                      );
                    },
                    child: CategoryCard(category: item),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 144,
      height: 162,
      decoration: BoxDecoration(
        color: AppColors.specialbackColorForSomeViews,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.white, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  RitualFourCategoryScreen(category: category),
            ),
          );
        },
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      category.image ?? "",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey.shade200,
                          alignment: Alignment.center,
                          child: Text(
                            category.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: AppColors.headingBlackishColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    category.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: const Color(0xFFEEDFCD),
                      fontSize: 14,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            category.isPremium == "1"
                ? Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3DE),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(child: Image.asset('assets/premium.png')),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
