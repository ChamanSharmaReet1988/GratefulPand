import 'package:flutter/material.dart';
import 'package:gratefull_panda/Database/afirmation_db.dart';
import 'package:gratefull_panda/Home/RitualFour/ritual_four_intro_screen.dart';
import 'package:gratefull_panda/Home/RitualFour/ritual_four_setting_screen.dart';
import 'package:gratefull_panda/Models/category.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

class RitualFourCategoryScreen extends StatefulWidget {
  const RitualFourCategoryScreen({super.key, required this.category});
  final Category category;
  @override
  State<RitualFourCategoryScreen> createState() =>
      _RitualFourCategoryScreenState();
}

class _RitualFourCategoryScreenState extends State<RitualFourCategoryScreen> {
  int affirmationCount = 0;

  @override
  void initState() {
    super.initState();
    loadAffirmationCount();
  }

  Future<void> loadAffirmationCount() async {
    final count = await AffirmationDb.instance.getAffirmationCountByCategoryId(
      widget.category.id!,
    );

    setState(() {
      affirmationCount = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: AppColors.settingBorderColor,
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor: Colors.black.withOpacity(0.3),
                      builder: (context) {
                        return const RitualFourSettingsScreen();
                      },
                    );
                  },
                  child: const Text(
                    'Settings',
                    style: TextStyle(
                      color: Color(0xFFC07021),
                      fontSize: 16,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 48,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(color: Color(0x77000000), offset: Offset(0, 3)),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryButtonsColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            RitualFourIntroScreen(category: widget.category),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          "assets/play.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Practice',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w500,
                          height: 1.40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 44),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(22),
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
              Spacer(),
              Padding(
                padding: EdgeInsets.all(22),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: Image.asset("assets/share.png", fit: BoxFit.contain),
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.specialbackColorForSomeViews,
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 16),
                      Container(
                        width: 100,
                        height: 113,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            widget.category.image ?? "",
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              color: Colors.grey.shade200,
                              child: const Icon(Icons.psychology, size: 40),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),
                      Text(
                        widget.category.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF372D17),
                          fontSize: 20,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      if (widget.category.played != "0")
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/digital-clock.png',
                                  width: 24,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Played: ${widget.category.played ?? 0} Times',
                                  style: const TextStyle(
                                    color: Color(0xB2342D18),
                                    fontSize: 14,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/healtcare.png', width: 24),
                          const SizedBox(width: 8),
                          Text(
                            'Affirmations: $affirmationCount',
                            style: const TextStyle(
                              color: Color(0xB2342D18),
                              fontSize: 14,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),
                      if (widget.category.isPremium == "1")
                        Container(
                          height: 30,
                          width: 100,
                          padding: const EdgeInsets.fromLTRB(6, 6, 6, 8),
                          decoration: const ShapeDecoration(
                            color: Color(0xFFFF9E37),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x77000000),
                                offset: Offset(1, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/premiumBtnImg.png',
                                width: 20,
                              ),
                              const SizedBox(width: 9),
                              const Text(
                                'Premium',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
