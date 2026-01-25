import 'package:flutter/material.dart';
import 'package:gratefull_panda/Common/data_source.dart';
import 'package:gratefull_panda/Database/afirmation_db.dart';
import 'package:gratefull_panda/Home/RitualFour/ritual_four_music_screen.dart';
import 'package:gratefull_panda/Models/category.dart';
import 'package:gratefull_panda/Tabbar/tabbar_screen.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

class RitualFourIntroScreen extends StatefulWidget {
  const RitualFourIntroScreen({super.key, required this.category});
  final Category category;
  @override
  State<RitualFourIntroScreen> createState() => _RitualFourIntroScreen();
}

class _RitualFourIntroScreen extends State<RitualFourIntroScreen> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(120, 8, 120, 8),
          child: GestureDetector(
            onTap: () async {
              final items = await AffirmationDb.instance
                  .getAffirmationsByCategoryId(widget.category.id!);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RitualFourMusicScreen(affirmations: items),
                ),
              );
            },
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: ShapeDecoration(
                color: const Color(0xFFF2E3D0),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.50, color: const Color(0xFFC07021)),
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x99000000),
                    blurRadius: 0,
                    offset: Offset(1, 3),
                    spreadRadius: 0,
                  ),
                ],
              ),

              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8,
                children: [
                  Text(
                    'Skip Intro',
                    style: TextStyle(
                      color: const Color(0xFFC07021),
                      fontSize: 16,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                      height: 1.40,
                    ),
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: SizedBox(
                      height: 28,
                      width: 28,
                      child: Image.asset(
                        "assets/doublearrow.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: Scaffold(
        backgroundColor: AppColors.splashBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 54),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Image.asset("assets/crossblack.png", height: 24),
                onPressed: () async {
                  navigateToRootNoAnimation();
                },
              ),
            ),
            const SizedBox(height: 18),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 0),
              child: Stack(
                children: [
                  Container(
                    height: 4,
                    padding: const EdgeInsets.symmetric(horizontal: 104),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF3F3F3),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: const Color(0x35ADB1B0),
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.05,
                    height: 4,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 4,
                    ),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFFA23F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: [
                        BoxShadow(
                          color: const Color(0x99FF9E37),
                          blurRadius: 8,
                          offset: const Offset(5, 0),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  introTextArray[0]["text"] ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF372D17),
                    fontSize: 28,
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
}
