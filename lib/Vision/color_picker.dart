import 'package:flutter/material.dart';
import 'package:gratefull_panda/Common/data_source.dart';

class ColorPickerScreen extends StatefulWidget {
  const ColorPickerScreen({super.key});

  @override
  State<ColorPickerScreen> createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Color(0xFFF2E3D0),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Background Color',
                style: TextStyle(
                  color: Color(0xFF372D17) /* Dark-500 */,
                  fontSize: 16,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                ),
              ),

              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(
                    "assets/crossblack.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFFFF9EF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(
              height: 180,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: visionColors.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final isSelected = index == selectedIndex;
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() => selectedIndex = index);
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: visionColors[index],
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        if (isSelected)
                          Positioned(
                            right: 10,
                            top: 10,
                            child: SizedBox(
                              height: 16,
                              width: 16,
                              child: Image.asset(
                                "assets/tic_black.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 24),

          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context, selectedIndex);
              },
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: ShapeDecoration(
                  color: const Color(0xFFC17C37) /* Orange-500 */,
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
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Text(
                            'Select Background Color',
                            style: TextStyle(
                              color: Colors.white /* Grey-50 */,
                              fontSize: 16,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
