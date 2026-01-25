import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gratefull_panda/Common/data_source.dart';
import 'package:gratefull_panda/Home/RitualFive/ritual_five_one.dart';
import 'package:gratefull_panda/Home/RitualThree/ritual_three_opening_screen.dart';
import 'package:gratefull_panda/Home/RitualFour/ritual_four_opening_screen.dart';
import 'package:gratefull_panda/Home/RitualOne/ritual_opening_screen.dart';
import 'package:gratefull_panda/Home/RitualTwo/ritual_two_opening_screen.dart';
import 'package:gratefull_panda/Settings/settings_view.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/utils/user_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.90,
  );
  int _currentPage = 0;
  bool _userInteracted = false;

  final List<String> stateImages = [
    "assets/weight.png",
    "assets/height.png",
    "assets/timer.png",
    "assets/victory-finger.png",
    "assets/energy.png",
  ];

  final List<Map<String, String>> stateData = [
    {"key": "Weight", "value": "2.0 gm"},
    {"key": "Height", "value": "10.0 cm"},
    {"key": "Journey", "value": "7 Days"},
    {"key": "Rituals Completed", "value": "47"},
    {"key": "Energy", "value": "67"},
  ];
  bool showLearnSection = true;


  @override
void initState() {
  super.initState();

  _initData();

  Timer.periodic(const Duration(seconds: 4), (timer) {
    if (_userInteracted) return;
    if (_pageController.hasClients) {
      final currentPage = _pageController.page?.round() ?? 0;
      int nextPage = currentPage + 1;
      if (nextPage >= cardContents.length) nextPage = 0;

      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  });
}

  Future<void> _initData() async {
    await UserPreferences.setOnboardingDone(true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroungColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 55),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 10,
                bottom: 10,
                right: 16,
              ),
              child: Row(
                children: [_buildMenuIcon(), Spacer(), freeTrilButton()],
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 104),
                  child: _buildDailyRitualsContainer(),
                ),
                _buildGoodMorningSection(),
              ],
            ),
            const SizedBox(height: 30),
            _buildReframeYourThoughtsSection(),

            const SizedBox(height: 30),
            _buildWhatScienceSaysSection(),

            const SizedBox(height: 30),
            _buildAppUpdateSection(context),

            const SizedBox(height: 120),
            _buildBabyMochiSection(),

            const SizedBox(height: 20),
            shareGratitudeWithFriends(
              mainImage: 'assets/friends.png',
              title: 'Share Gratitude',
              subTitle:
                  'If Grateful Panda brings you peace, pass that feeling forward.',
              arrowImage: 'assets/RightSideFilledArrow.png',
            ),
            const SizedBox(height: 20),
            lastCenteredSection(
              imagePath: 'assets/panda.png',
              title: 'Your day doesn’t need to be perfect,to be meaningful.!',
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuIcon() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SetingsView()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        child: Image.asset('assets/menuHome.png', height: 40, width: 40),
      ),
    );
  }

  Widget freeTrilButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: ShapeDecoration(
          color: const Color(0xFFB59575),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Text(
              'Free Trial',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoodMorningSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'GOOD MORNING!',
            style: TextStyle(
              color: AppColors.headingTextColor,
              fontSize: 14,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Image.asset(
                'assets/gratefulPanda.png',
                width: 102,
                height: 120,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDailyRitualsContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.darkBackgroungColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daily Rituals (Day 7)',
              style: TextStyle(
                color: Color(0xFF2D2511),
                fontSize: 20,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 14),
            _buildLearnSection(),
            const SizedBox(height: 14),

            Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 27,
                  bottom: 0,
                  child: buildVerticalTimeline(itemCount: 5),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                  ), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      whiteBoxView(
                        mainImage: 'assets/graoundingImg.png',
                        title: 'Grounding Moment',
                        arrowImage: 'assets/arrow-right.png',
                        subTitle: '5 PTS',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => RitualOpeningScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 14),
                      whiteBoxView(
                        mainImage: 'assets/iAm.png',
                        title: 'I Am',
                        arrowImage: 'assets/arrow-right.png',
                        subTitle: '8 PTS',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => RitualTwoOpeningScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 14),
                      whiteBoxView(
                        mainImage: 'assets/todaysGratituideimg.png',
                        title: 'Today’s Gratitude',
                        arrowImage: 'assets/arrow-right.png',
                        subTitle: '10 PTS',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => RitualThreeOpeningScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 14),
                      whiteBoxView(
                        mainImage: 'assets/affirmationFilled.png',
                        title: 'Affirmation',
                        arrowImage: 'assets/arrow-right.png',
                        subTitle: '12 PTS',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => RitualFourOpeningScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 14),
                      whiteBoxView(
                        mainImage: 'assets/thnaksImg.png',
                        title: 'Three Thank-Yous',
                        arrowImage: 'assets/arrow-right.png',
                        subTitle: '15 PTS',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => RitualFiveOne()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildVerticalTimeline({int itemCount = 5}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(itemCount, (index) {
        return Column(
          children: [
            SizedBox(
              width: 22,
              height: 22,
              child: Image.asset('assets/tic.png', height: 22, width: 22),
            ),

            if (index != itemCount - 1)
              Container(width: 3, height: 65, color: const Color(0xFFFFF3DE)),
          ],
        );
      }),
    );
  }

  Widget _buildLearnSection() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.lightOrangeForDarkHeading,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Tap to learn why these rituals matter',
                  style: TextStyle(
                    color: Color(0xFF2D2511),
                    fontSize: 12,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'See how each ritual supports your mood, focus, and emotional balance.',
                  style: TextStyle(
                    color: Color(0xFF60512C),
                    fontSize: 12,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 28,
            height: 28,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Image.asset('assets/cross.png', fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }

  Widget whiteBoxView({
    required String mainImage,
    required String title,
    required String subTitle,
    required String arrowImage,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(mainImage, height: 50, width: 50),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/elements.png',
                              height: 15,
                              width: 15,
                            ),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                subTitle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            buildArrowButton('assets/Union.png', arrowImage, onTap),
          ],
        ),
      ),
    );
  }

  Widget buildArrowButton(
    String shadowImage,
    String arrowImage,
    VoidCallback onTap,
  ) {
    return SizedBox(
      height: 40,
      width: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(shadowImage, height: 40, width: 40),

          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 40,
              width: 40,
              color: Colors.transparent,
              alignment: Alignment.center,
              child: Image.asset(arrowImage, height: 20, width: 20),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReframeYourThoughtsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: ShapeDecoration(
              color: const Color(0xFFB59575),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
            child: Text(
              'Reframe your thoughts',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFFF2E3D0),
                fontSize: 12,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.darkBackgroungColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/ThinkingFromLeft.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 78,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFFF5E0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 0,
                                offset: Offset(3, 4),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 4,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: 8,
                                children: [
                                  Text(
                                    'INSTEAD OF THINKING',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: const Color(
                                        0xFF60512C,
                                      ),
                                      fontSize: 12,
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 225.53,
                                child: Text(
                                  'My life is supposed to look better by now.',
                                  style: TextStyle(
                                    color: const Color(
                                      0xFF60512C,
                                    ),
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
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: 258,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 0,
                                offset: Offset(-3, 4),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 8,
                            children: [
                              Text(
                                'THINK',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: const Color(0xFF60512C),
                                  fontSize: 12,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: 226,
                                child: Text(
                                  'My life is unfolding in ways I\'m only beginning to understand.',
                                  style: TextStyle(
                                    color: const Color(
                                      0xFF2D2511,
                                    ),
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

                      const SizedBox(width: 14),
                      Image.asset(
                        'assets/thinkingFromright.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWhatScienceSaysSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 16,
            ), 
            decoration: BoxDecoration(
              color: AppColors.darkBackgroungColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.darkColorForHeading,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero,
                    ),
                  ),
                  child: const Text(
                    'What science says',
                    style: TextStyle(
                      color: const Color(0xFFF2E3D0) ,
                      fontSize: 16,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.viewBackground,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.zero,
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'People who write three thank-you a day sleep better and feel happier within two weeks.',
                    style: TextStyle(
                      color: const Color(0xFF2D2511) ,
                      fontSize: 14,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                      height: 1.38,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAppUpdateSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollStartNotification &&
                  notification.dragDetails != null) {
                _userInteracted = true;
              }
              if (notification is ScrollEndNotification && _userInteracted) {
                Future.delayed(const Duration(seconds: 5), () {
                  _userInteracted = false;
                });
              }
              return false;
            },
            child: PageView.builder(
              controller: _pageController,
              itemCount: cardContents.length,
              padEnds: true,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 6,
                  ),
                  child: _buildUpdateCard(index),
                );
              },
            ),
          ),
        ),

        const SizedBox(height: 12),

        Center(child: _buildCustomIndicator()),
      ],
    );
  }

  Widget _buildCustomIndicator() {
    const double totalWidth = 84;
    const double indicatorWidth = 20;

    final double step =
        (totalWidth - indicatorWidth) / (cardContents.length - 1);

    return Container(
      width: totalWidth,
      height: 8,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 1,
            child: Container(
              width: totalWidth,
              height: 6,
              decoration: ShapeDecoration(
                color: const Color(0xFFE9D1B5), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            left: step * _currentPage,
            top: 0,
            child: Container(
              width: indicatorWidth,
              height: 8,
              decoration: ShapeDecoration(
                color: const Color(0xFFC17C37), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                shadows: const [
                  BoxShadow(color: Color(0x99000000), offset: Offset(0, 1)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateCard(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: ShapeDecoration(
        color: const Color(0xFFFFF5E0) ,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 0,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardContents[index]['title']!,
                  style: TextStyle(
                    color: const Color(0xFF2D2511) ,
                    fontSize: 16,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),

                Expanded(
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Text(
                      cardContents[index]['description']!,
                      style: TextStyle(
                        color: const Color(0xFF60512C) ,
                        fontSize: 14,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 3, 
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Image.asset(
            cardContents[index]['image']!,
            height: 33,
            width: 33,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  Widget _buildBabyMochiSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 80,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Baby Mochi",
                  style: TextStyle(
                    color: const Color(0xFF2D2511),
                    fontSize: 20,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "She/Her",
                  style: TextStyle(
                    color: const Color(0xFF60512C),
                    fontSize: 12,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Your rituals give Panda the energy to grow a little each day.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF60512C),
                    fontSize: 12,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.lightOrangeForDarkHeading,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: List.generate(stateData.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 14,
                        ),
                        child: _buildStatRow(
                          index: index,
                          keyText: stateData[index]["key"]!,
                          valueText: stateData[index]["value"]!,
                        ),
                      );
                    }),
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
              child: SizedBox(
                height: 120,
                width: 120,
                child: Image.asset(
                  "assets/pandaWithBackground.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatRow({
    required int index,
    required String keyText,
    required String valueText,
  }) {
    return Row(
      children: [
        Container(
          height: 24,
          width: 24,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Image.asset(stateImages[index], fit: BoxFit.cover),
        ),

        const SizedBox(width: 9),

        Expanded(
          child: Text(
            keyText,
            style: TextStyle(
              color: const Color(0xFF60512C),
              fontSize: 12,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),

        Text(
          valueText,
          style: TextStyle(
            color: const Color(0xFF60512C) ,
            fontSize: 12,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget shareGratitudeWithFriends({
    required String mainImage,
    required String title,
    required String subTitle,
    required String arrowImage,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0xFFFFF5E0),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(mainImage, height: 50, width: 50, fit: BoxFit.cover),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF2D2511),
                      fontSize: 14,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subTitle,
                    style: TextStyle(
                      color: const Color(0xFF60512C),
                      fontSize: 12,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                // handle tap
              },
              child: Image.asset(arrowImage, height: 30, width: 30),
            ),
          ],
        ),
      ),
    );
  }

  Widget lastCenteredSection({
    required String imagePath,
    required String title,
  }) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 55, width: 74, fit: BoxFit.contain),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: const Color(0xFF60512C),
                fontSize: 14,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
