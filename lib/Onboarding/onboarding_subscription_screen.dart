import 'package:flutter/material.dart';
import 'package:gratefull_panda/Onboarding/reminder_view.dart';
import 'package:gratefull_panda/Subscription/pro_benefits.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

class OnboardingSubscriptionScreen extends StatefulWidget {
  const OnboardingSubscriptionScreen({
    super.key,
    this.isFromOnboarding = false,
  });
  final bool isFromOnboarding;
  @override
  State<OnboardingSubscriptionScreen> createState() =>
      _OnboardingSubscriptionScreenState();
}

class _OnboardingSubscriptionScreenState
    extends State<OnboardingSubscriptionScreen> {
  late bool _isFromOnboarding;

  @override
  void initState() {
    super.initState();
    _isFromOnboarding = widget.isFromOnboarding;
  }

  void navigateToRootNoAnimation() {
    if (_isFromOnboarding) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ReminderViewScreen(isFromOnboarding: _isFromOnboarding),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Image.asset("assets/crossblack.png", height: 24),
                onPressed: navigateToRootNoAnimation,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 90,
                    width: 90,
                    child: Image.asset(
                      'assets/subscriptionImage.png',
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'This journey grows with consistency.',
                    style: TextStyle(
                      color: Color(0xFF342D18),
                      fontSize: 20,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    'Full access to daily rituals and reflections that support gentle long term practice.',
                    style: TextStyle(
                      color: Color(0xB2342D18),
                      fontSize: 14,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Container(
                                width: 20,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF2E3D0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _iconOnBar('assets/access.png'),
                                  _iconOnBar('assets/crown.png'),
                                  _iconOnBar('assets/square-unlock.png'),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(width: 12),

                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Today',
                                  style: TextStyle(
                                    color: Color(0xFF342D18),
                                    fontSize: 16,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'No payment required.',
                                  style: TextStyle(
                                    color: Color(0xB2342D18),
                                    fontSize: 14,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                                SizedBox(height: 16),

                                Text(
                                  'Free Trial (7 Days)',
                                  style: TextStyle(
                                    color: Color(0xFF342D18),
                                    fontSize: 16,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Cancel anytime during your trial.',
                                  style: TextStyle(
                                    color: Color(0xB2342D18),
                                    fontSize: 14,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                                SizedBox(height: 16),

                                Text(
                                  'Day 7',
                                  style: TextStyle(
                                    color: Color(0xFF342D18),
                                    fontSize: 16,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'You will be charged on this day.',
                                  style: TextStyle(
                                    color: Color(0xB2342D18),
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

                  const SizedBox(height: 16),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: '\$3.33 /',
                                style: TextStyle(
                                  color: Color(0xFFC07021),
                                  fontSize: 20,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: 'month',
                                style: TextStyle(
                                  color: Color(0xFFC07021),
                                  fontSize: 12,
                                  fontFamily: 'Metropolis',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '(Includes 7 days free trial)',
                          style: TextStyle(
                            color: Color(0xB2342D18),
                            fontSize: 12,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Center(
                    child: Container(
                      width: 266,
                      height: 18,
                      decoration: const BoxDecoration(
                        color: Color(0xFF342D18),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '\$40.00 billed every year',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 8, 22, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFC07021), width: 2),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProBenefitsScreen(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'See all pro benefits',
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
                  onPressed: navigateToRootNoAnimation,
                  child: const Text(
                    "Start Free Trial",
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconOnBar(String asset) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      width: 16,
      height: 16,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(2),
      child: Image.asset(asset),
    );
  }
}
