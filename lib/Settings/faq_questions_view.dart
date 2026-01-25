import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/Common/data_source.dart';

class FaqQuestionsView extends StatefulWidget {
  const FaqQuestionsView({super.key});

  @override
  State<FaqQuestionsView> createState() => _FaqQuestionsViewState();
}
class _FaqQuestionsViewState extends State<FaqQuestionsView> {
  int expandedIndex = -1;
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
                      'FAQ',
                      style: TextStyle(
                        color: Color(0xFF372D17),
                        fontSize: 18,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
              ],
            ),

            const SizedBox(height: 24),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: FAQDict.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                bool isExpanded = expandedIndex == index;
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          expandedIndex = isExpanded ? -1 : index;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                FAQDict[index]['question']!,
                                style: const TextStyle(
                                  color: Color(0xFF372D17),
                                  fontSize: 14,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Image.asset(
                              isExpanded
                                  ? 'assets/dropUp.png'
                                  : 'assets/dropDown.png',
                              width: 22,
                              height: 22,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (isExpanded) ...[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF8F1E9),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          FAQDict[index]['answer']!,
                          style: const TextStyle(
                            color: Color(0xFF60512C),
                            fontSize: 14,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],

                    if (index != FAQDict.length - 1) ...[
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: const Color(0xFFE9D1B5),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ]
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}