import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/Database/afirmation_db.dart';
import 'package:gratefull_panda/Home/RitualFour/ritual_four_music_screen.dart';
import 'package:gratefull_panda/Models/affirmation.dart';

class AffirmationFavoriteScreen extends StatefulWidget {
  const AffirmationFavoriteScreen({super.key});

  @override
  State<AffirmationFavoriteScreen> createState() =>
      _AffirmationFavoriteScreenState();
}

class _AffirmationFavoriteScreenState extends State<AffirmationFavoriteScreen> {
  List<Affirmation>? affirmations;

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Future<void> loadCategories() async {
    final items = await AffirmationDb.instance.getFavAffirmations();
    setState(() {
      affirmations = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: SafeArea(
        child: Column(
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
                      children: const [
                        SizedBox(height: 60),
                        Text(
                          "My Favourites",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF342D18),
                            fontSize: 20,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                            height: 0.90,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    top: -60,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            "assets/favorite_image.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            (affirmations?.length ?? 0) > 0
                ? _buildFavoritesContent()
                : _buildNoFavoritesMessage(),

            if ((affirmations?.length ?? 0) > 0)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RitualFourMusicScreen(
                          affirmations: affirmations ?? [],
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
              ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoritesContent() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
        itemCount: affirmations?.length ?? 0,
        itemBuilder: (context, index) {
          return AffirmationCard(text: affirmations?[index].description ?? "");
        },
      ),
    );
  }

  Widget _buildNoFavoritesMessage() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'No favourites yet',
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

class AffirmationCard extends StatelessWidget {
  final String text;
  final VoidCallback? onFavoriteTap;

  const AffirmationCard({super.key, required this.text, this.onFavoriteTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8ED),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              '“ $text ”',
              style: TextStyle(
                color: const Color(0xFF342D18),
                fontSize: 14,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: onFavoriteTap,
            child: SizedBox(
              height: 24,
              width: 24,
              child: Image.asset(
                "assets/fav_affirmation.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
