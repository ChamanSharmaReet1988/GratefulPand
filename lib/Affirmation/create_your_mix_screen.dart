import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/Database/afirmation_db.dart';
import 'package:gratefull_panda/Database/category_db.dart';
import 'package:gratefull_panda/Home/RitualFour/ritual_four_music_screen.dart';
import 'package:gratefull_panda/Models/affirmation.dart';
import 'package:gratefull_panda/Models/category.dart';

class CreateYourMixScreen extends StatefulWidget {
  const CreateYourMixScreen({super.key});

  @override
  State<CreateYourMixScreen> createState() => _CreateYourMixScreenState();
}

class _CreateYourMixScreenState extends State<CreateYourMixScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<Category> filteredData = [];
  List<Category> categoryList = [];
  Set<int> selectedIndexes = {};

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    loadCategories();
  }

  Future<void> loadCategories() async {
    List<Category> categories = await CategoryDb.instance.getAllCategories();
    setState(() {
      categoryList = categories;
      filteredData = categories;
    });
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase().trim();
    setState(() {
      filteredData = query.isEmpty
          ? categoryList
          : categoryList
                .where((item) => (item.title).toLowerCase().contains(query))
                .toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  Future<List<Affirmation>> getAffirmationsFromSelectedCategories() async {
    List<Affirmation> finalList = [];

    for (final index in selectedIndexes) {
      final category = filteredData[index];

      final affirmations = await AffirmationDb.instance
          .getAffirmationsByCategoryLimit(category.id!, 3);

      finalList.addAll(affirmations);
    }

    return finalList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: Image.asset("assets/back.png"),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Create your own mix',
                        style: TextStyle(
                          color: Color(0xFF372D17),
                          fontSize: 18,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 54),
                ],
              ),
            ),

            const SizedBox(height: 20),
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
                      width: 24,
                      height: 24,
                      child: Image.asset("assets/search.png"),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Color(0xFFA7A7A7),
                            fontSize: 16,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),
            Expanded(
              child: filteredData.isEmpty
                  ? const Center(child: Text("No results found"))
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: filteredData.length,
                      itemBuilder: (context, index) {
                        final item = filteredData[index];
                        final isSelected = selectedIndexes.contains(index);

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  selectedIndexes.remove(index);
                                } else {
                                  selectedIndexes.add(index);
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFFF9EF),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color(0x26342D18),
                                                blurRadius: 24,
                                                offset: Offset(0, 8),
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            child: Image.asset(
                                              item.image!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),

                                        const SizedBox(width: 12),

                                        Expanded(
                                          child: Text(
                                            item.title,
                                            style: const TextStyle(
                                              color: Color(0xFF342D18),
                                              fontSize: 14,
                                              fontFamily: 'Outfit',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Image.asset(
                                      isSelected
                                          ? "assets/check.png"
                                          : "assets/uncheck.png",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 48),
        child: GestureDetector(
          onTap: () async {
            final affirmations = await getAffirmationsFromSelectedCategories();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    RitualFourMusicScreen(affirmations: affirmations),
              ),
            );
          },
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
                  blurRadius: 0,
                  offset: Offset(1, 4),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: const Text(
              'Practise',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
