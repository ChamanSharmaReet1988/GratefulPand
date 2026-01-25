import 'package:flutter/material.dart';
import 'package:gratefull_panda/Affirmation/add_affirmations_screen.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/Database/afirmation_db.dart';
import 'package:gratefull_panda/Home/RitualFour/ritual_four_music_screen.dart';
import 'package:gratefull_panda/Models/affirmation.dart';

class MyAffirmationScreen extends StatefulWidget {
  const MyAffirmationScreen({super.key});

  @override
  State<MyAffirmationScreen> createState() => _MyAffirmationScreenState();
}

class _MyAffirmationScreenState extends State<MyAffirmationScreen> {
  List<Affirmation>? myAfirmations;

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Future<void> loadCategories() async {
    final items = await AffirmationDb.instance.getMyAffirmations();
    setState(() {
      myAfirmations = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset("assets/back.png"),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(24, 7, 24, 16),
                    decoration: BoxDecoration(
                      color: AppColors.darkBackgroungColor,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 60),
                        const Text(
                          "My Affirmations",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF342D18),
                            fontSize: 20,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset("assets/healtcare.png"),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Total Affirmations: ${myAfirmations?.length ?? 0}',
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
                  ),

                  Positioned(
                    top: -60,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: SizedBox(
                        height: 120,
                        width: 120,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Image.asset(
                            "assets/noAffirmation.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            (myAfirmations?.length ?? 0) > 0
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(bottom: 120),
                        itemCount: myAfirmations?.length ?? 0,
                        itemBuilder: (context, index) {
                          final item = myAfirmations?[index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 16,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '“ ${item?.description ?? ""} ”',
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
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : _buildNoAffirmationMessage(),
          ],
        ),
      ),

      /// Bottom Buttons
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AffirmationCreateScreen(),
                  ),
                ).then((val) {
                  if (val == true) {
                    loadCategories();
                  }
                });
              },
              child: Container(
                height: 48,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: ShapeDecoration(
                  color: const Color(0xFFF2E3D0),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2, color: Color(0xFFC07021)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Add Affirmation',
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
            if (myAfirmations?.isNotEmpty ?? false)
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RitualFourMusicScreen(
                        affirmations: myAfirmations ?? [],
                        fromAffirmation: true,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 48,
                  width: double.infinity,
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
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Practice',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoAffirmationMessage() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'No Affirmations yet',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF342D18),
                fontSize: 20,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Please add affirmation for a better experience.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF342D18),
                  fontSize: 16,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
