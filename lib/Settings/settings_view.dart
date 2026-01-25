import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gratefull_panda/Common/data_source.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/Settings/data_backup_view.dart';
import 'package:gratefull_panda/Settings/edit_username_view.dart';
import 'package:gratefull_panda/Settings/faq_questions_view.dart';
import 'package:gratefull_panda/Settings/reminder_setting_view.dart';
import 'package:gratefull_panda/Settings/ritual_view.dart';
import 'package:gratefull_panda/Settings/science_behind_view.dart';
import 'package:gratefull_panda/utils/user_preferences.dart';

class SetingsView extends StatefulWidget {
  const SetingsView({super.key});

  @override
  State<SetingsView> createState() => _SetingsViewState();
}

class _SetingsViewState extends State<SetingsView> {
  List<bool> selectedItems = [];
  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.90,
  );
  int _currentPage = 0;
  bool _userInteracted = false;
  bool isPremium = false;
  bool isLoggedIn = false;
  bool isFacelock = false;
  String userName = "";
  String pandaName = "";
  @override
  void initState() {
    super.initState();
    selectedItems = List.generate(struggleData.length, (index) => false);
    _startAutoScroll();
    _loadPremiumStatus();
    loadUserData();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadPremiumStatus() async {
    final value = await UserPreferences.getIsPremium();
    final loggedInValue = await UserPreferences.getIsLogedIn();
    final facelockValue = await UserPreferences.getIsLogedIn();
    setState(() {
      isPremium = value;
      isLoggedIn = loggedInValue;
      isFacelock = facelockValue;
    });
  }

  Future<void> loadUserData() async {
    final name = await UserPreferences.getUserName();
    final pandaNameValue = await UserPreferences.getPandaName();
    setState(() {
      userName = name ?? "";
      pandaName = pandaNameValue ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24, top: 66),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                      'Settings',
                      style: TextStyle(
                        color: Color(0xFF372D17),
                        fontSize: 18,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 56),
              ],
            ),

            const SizedBox(height: 24),
            isLoggedIn
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFE9D1B5),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1.5,
                            color: Color(0xFFC07021),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x99000000),
                            offset: Offset(1, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFBE752B),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: Image.asset(
                                        "assets/premiumColor.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Text(
                                      'Premium',
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
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: _infoBox("Your Name", "Tanmoy Roy"),
                              ),
                              const SizedBox(width: 12),
                              Expanded(child: _infoBox("Your Panda", "Mochi")),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF2E3D0),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1.5,
                            color: Color(0xFFC07021),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x99000000),
                            offset: Offset(1, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _premiumRow(
                            "Your Name",
                            userName,
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const EditUsernameView(),
                                ),
                              );

                              setState(() {});
                            },
                          ),

                          const SizedBox(height: 8),
                          _premiumRow("Your Panda", pandaName),
                          const SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
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
                            child: Column(
                              children: const [
                                Text(
                                  'Pro users grow faster',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF342D18),
                                    fontSize: 14,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Start with free trial (7 Days)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFFB59575),
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
                  ),

            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'PERSONALISED SETTINGS',
                style: TextStyle(
                  color: const Color(0xFF60512C),
                  fontSize: 14,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  settingsItem(
                    "Data backup",
                    Image.asset("assets/dataBackup.png", fit: BoxFit.contain),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => DataBackupView()),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  settingsItem(
                    "Rituals",
                    Image.asset("assets/yoga.png", fit: BoxFit.contain),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => RitualView()),
                      );
                    },
                  ),

                  const SizedBox(height: 12),
                  settingsItem(
                    "Science Behind",
                    Image.asset(
                      "assets/scienceBehind.png",
                      fit: BoxFit.contain,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ScienceBehindView()),
                      );
                    },
                  ),

                  const SizedBox(height: 12),
                  settingsItem(
                    "Reminder",
                    Image.asset("assets/reminder.png", fit: BoxFit.contain),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ReminderSettingView(isFromOnboarding: false),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 12),
                  settingsItem(
                    "Facelock",
                    Image.asset("assets/facelock.png", fit: BoxFit.contain),
                    isButton: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildAppUpdateSection(context),

            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'APP INFORMATION',
                style: TextStyle(
                  color: const Color(0xFF60512C),
                  fontSize: 14,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  settingsItem(
                    "FAQ",
                    Image.asset("assets/FAQ.png", fit: BoxFit.contain),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => FaqQuestionsView()),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  settingsItem(
                    "Review on Play store/app store",
                    Image.asset("assets/star.png", fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 12),
                  settingsItem(
                    "Privacy Policy",
                    Image.asset("assets/policy.png", fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 12),
                  settingsItem(
                    "Terms & Conditions",
                    Image.asset(
                      "assets/termsAndCondition.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'SHARE',
                style: TextStyle(
                  color: const Color(0xFF60512C),
                  fontSize: 14,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            const SizedBox(height: 12),
            shareGratitudeWithFriends(
              mainImage: 'assets/friends.png',
              title: 'Share Gratitude with Friends',
              subTitle:
                  'If Grateful Panda brings you peace, pass that feeling forward.',
              arrowImage: 'assets/RightSideFilledArrow.png',
            ),

            const SizedBox(height: 24),
            isLoggedIn
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: FutureBuilder<String?>(
                      future: UserPreferences.getUserEmail(),
                      builder: (context, snapshot) {
                        final email = snapshot.data ?? "Not available";

                        return logoutItem(
                          title: "Logout",
                          subtitle: "You are logged in as $email",
                          icon: Image.asset("assets/logout.png"),
                        );
                      },
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SIGN IN TO GRATEFUL PANDA',
                          style: TextStyle(
                            color: const Color(0xFF60512C),
                            fontSize: 14,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          height: 48,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF2E3D0),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1.5,
                                color: Color(0xFFC07021),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x99000000),
                                offset: Offset(1, 3),
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isLoggedIn = true;
                              });
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset("assets/googleIcon.png"),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Sign in with Google',
                                  style: TextStyle(
                                    color: Color(0xFF342D18),
                                    fontSize: 14,
                                    fontFamily: 'Outfit',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          height: 48,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF2E3D0),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1.5,
                                color: Color(0xFFC07021),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x99000000),
                                offset: Offset(1, 3),
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isLoggedIn = true;
                              });
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset("assets/appleIcon.png"),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Sign in with Apple',
                                  style: TextStyle(
                                    color: Color(0xFF342D18),
                                    fontSize: 14,
                                    fontFamily: 'Outfit',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                width: 360,
                child: Text(
                  'grateful panda_v1',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF342D18),
                    fontSize: 14,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget shareGratitudeWithFriends({
    required String mainImage,
    required String title,
    required String subTitle,
    required String arrowImage,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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

  Widget _premiumRow(String title, String value, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap, // only works if provided
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: ShapeDecoration(
          color: const Color(0xFFFFF9EF),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFFB59575),
                fontSize: 14,
                fontFamily: 'Outfit',
              ),
            ),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(
                color: Color(0xFF342D18),
                fontSize: 14,
                fontFamily: 'Outfit',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingsItem(
    String title,
    Image imagesString, {
    bool isButton = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: const Color(0xFFFFF9EF),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 20, height: 20, child: imagesString),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF342D18),
                        fontSize: 14,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  isButton
                      ? Container(
                          width: 36,
                          height: 20,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isFacelock = !isFacelock;
                              });
                            },
                            child: Image.asset(
                              isFacelock
                                  ? "assets/switchon.png"
                                  : "assets/switchoff.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoBox(String title, String value) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: ShapeDecoration(
        color: const Color(0xFFF2E3D0),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2, color: Color(0xFFFFF5E0)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF60512C),
              fontSize: 12,
              fontFamily: 'Outfit',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF342D18),
              fontSize: 14,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
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

  Widget logoutItem({
    required String title,
    required String subtitle,
    required Image icon,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isLoggedIn = false;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: ShapeDecoration(
          color: const Color(0xFFFFF9EF),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 20, height: 20, child: icon),

            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF342D18),
                      fontSize: 14,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xFF8E7743),
                      fontSize: 12,
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
        color: const Color(0xFFFFF5E0),
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
                    color: const Color(0xFF2D2511),
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
                        color: const Color(0xFF60512C),
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

  void _startAutoScroll() {
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
}
