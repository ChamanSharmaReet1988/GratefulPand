import 'package:flutter/material.dart';
import 'package:gratefull_panda/Tabbar/tabbar_screen.dart';

import 'package:gratefull_panda/Constant/color_constant.dart';

class DopamineSparkScreen extends StatelessWidget {
  const DopamineSparkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroungColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  child: Column(
                    children: [
                      _buildTopSection(),
                      const SizedBox(height: 24),

                      Row(children: [_buildScienceLabel()]),

                      _buildMainContentBox(),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
            _buildPandaEnergySection(),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: _buildStartTodayButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return Column(
      children: [
        const SizedBox(height: 50),
        Text(
          'DAY #3',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.headingTextColor,
            fontFamily: 'Outfit',
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Good Morning!',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Outfit',
            color: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildScienceLabel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                  fontFamily: 'Outfit',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMainContentBox() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: ShapeDecoration(
          color: const Color(0xFFFFF5E0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          shadows: const [
            BoxShadow(color: Color(0x3F000000), offset: Offset(0, 2)),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Dopamine Spark',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 16,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Each time you feel grateful, your brain releases dopamine, a natural reward chemical.\n'
              'It’s your mind’s way of saying, “This matters. Remember it.”',
              style: TextStyle(
                color: AppColors.headingTextColor,
                fontSize: 16,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPandaEnergySection() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              // color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Image.asset(
                'assets/elements.png',
                width: 28,
                height: 28,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Text below
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Help your Panda gain today’s energy by completing your rituals.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartTodayButton(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
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
      },
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: const ShapeDecoration(
          color: AppColors.primaryButtonsColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          shadows: [BoxShadow(color: Color(0x77000000), offset: Offset(0, 3))],
        ),
        child: const Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Start Today',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_rounded,
                size: 20,
                color: AppColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
