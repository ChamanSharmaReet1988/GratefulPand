import 'package:flutter/material.dart';
import 'package:gratefull_panda/Database/afirmation_db.dart';
import 'package:gratefull_panda/Home/RitualFour/ritual_four_setting_screen.dart';
import 'package:gratefull_panda/Models/affirmation.dart';
import 'package:gratefull_panda/Tabbar/tabbar_screen.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

// ignore: must_be_immutable
class RitualFourMusicScreen extends StatefulWidget {
  RitualFourMusicScreen({
    super.key,
    required this.affirmations,
    this.fromAffirmation,
  });
  List<Affirmation> affirmations = [];
  bool? fromAffirmation;
  @override
  State<RitualFourMusicScreen> createState() => _RitualFourMusicScreenState();
}

class _RitualFourMusicScreenState extends State<RitualFourMusicScreen> {
  late TextEditingController nameController;
  int currentAffirmation = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void navigateToRootNoAnimation() {
    if (widget.fromAffirmation ?? false) {
      Navigator.pop(context);
      return;
    }
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

  void micAction() {}
  void pauseAction() {}
  void favAction() {
    String fav = "";
    if (widget.affirmations[currentAffirmation].isFavorite == "1") {
      fav = "0";
    } else {
      fav = "1";
    }
    AffirmationDb.instance.updateFavorite(
      widget.affirmations[currentAffirmation].id!,
      fav,
    );
    setState(() {
      widget.affirmations[currentAffirmation].isFavorite = fav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(120, 8, 120, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              GestureDetector(
                onTap: () => micAction(),
                child: SizedBox(
                  height: 48,
                  width: 48,
                  child: Image.asset("assets/mic.png", fit: BoxFit.contain),
                ),
              ),
              GestureDetector(
                onTap: () => pauseAction(),
                child: SizedBox(
                  height: 48,
                  width: 48,
                  child: Image.asset("assets/pause.png", fit: BoxFit.contain),
                ),
              ),
            ],
          ),
        ),
      ),

      body: Scaffold(
        backgroundColor: AppColors.splashBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 54),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(22),
                  child: GestureDetector(
                    onTap: () => navigateToRootNoAnimation(),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset(
                        "assets/crossblack.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(22),
                  child: GestureDetector(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      barrierColor: Colors.black.withOpacity(0.3),
                      builder: (context) {
                        return const RitualFourSettingsScreen();
                      },
                    ),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset(
                        "assets/settings_ritual_four.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
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
            const SizedBox(height: 14),
            Center(
              child: Text(
                '${currentAffirmation + 1} of ${widget.affirmations.length} affirmations',
                style: TextStyle(
                  color: const Color(0xFF342D18),
                  fontSize: 12,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Spacer(),
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      widget.affirmations[0].description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF372D17),
                        fontSize: 28,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 14),
                    GestureDetector(
                      onTap: () => favAction(),
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          (widget.affirmations[currentAffirmation].isFavorite ??
                                      "") ==
                                  "1"
                              ? "assets/favselected.png"
                              : "assets/fav.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
