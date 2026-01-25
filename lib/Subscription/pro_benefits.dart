import 'package:flutter/material.dart';
import 'package:gratefull_panda/Common/data_source.dart';
import 'package:gratefull_panda/Subscription/pro_user.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

class ProBenefitsScreen extends StatelessWidget {
  const ProBenefitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            SizedBox(height: 10),
            _buildBenefitsList(),
            _buildBottomButton(context),
          ],
        ),
      ),
    );
  }

  // 🔹 Header
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      child: Row(
        children: [
          IconButton(
            icon: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset("assets/arrow30.png", fit: BoxFit.contain),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          const Expanded(
            child: Text(
              'Pro Benefits',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF372D17) /* Dark-500 */,
                fontSize: 18,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildBenefitsList() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
        itemCount: proBenefits.length,
        itemBuilder: (context, index) {
          final item = proBenefits[index];
          return _benefitTile(
            icon: item['icon'],
            title: item['title'],
            description: item['description'],
          );
        },
      ),
    );
  }

  Widget _benefitTile({
    required String icon,
    required String title,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9EC),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // ✅ Center icon vertically
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: Image.asset(icon, fit: BoxFit.contain),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center, // ✅ Center text vertically if needed
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF342D18),
                    fontSize: 18,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    color: const Color(0xB2342D18),
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
    );
  }
  
  Widget _buildBottomButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      child: GestureDetector(
        onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProUserScreen(),
              ),
            );
          },
          child: Container(
          width: double.infinity,
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: ShapeDecoration(
            color: const Color(0xFFC17C37),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x99000000),
                blurRadius: 0,
                offset: Offset(1, 4),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
