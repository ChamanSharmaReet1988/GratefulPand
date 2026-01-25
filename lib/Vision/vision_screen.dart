import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/Settings/settings_view.dart';
import 'package:gratefull_panda/Vision/create_new_vision.dart';
import 'package:gratefull_panda/Vision/vision_example_screen.dart';

class VisionScreen extends StatefulWidget {
  const VisionScreen({super.key});

  @override
  State<VisionScreen> createState() => _VisionScreenState();
}

class _VisionScreenState extends State<VisionScreen> {
  bool isBoardPresent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  _buildMenuIcon(),
                  if (isBoardPresent) ...[
                    const Spacer(),
                    createNewBoardButton(context),
                  ],
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: isBoardPresent
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          _buildBoardView(),
                        ],
                      )
                    : Center(child: _buildEmptyState(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBoardView() {
    return _VisionBoardCard(
      title: "Vision Board 2025",
      topLeft: VisionBlock(
        image: "assets/Rectangle1.png",
        backgroundColor: Colors.transparent,
      ),
      topRight: VisionBlock(
        text: "Morning sunlight sets a calm tone for the whole day.",
        backgroundColor: const Color(0xFFCCCEA8),
      ),
      bottomLeft: VisionBlock(
        text: "Gratitude creates peace inside.",
        backgroundColor: const Color(0xFFCCCCFF),
      ),
      bottomRight: VisionBlock(
        image: "assets/Rectangle2.png",
        backgroundColor: Colors.transparent,
      ),
    );
  }

  Widget _VisionBoardCard({
    required String title,
    required VisionBlock topLeft,
    required VisionBlock topRight,
    required VisionBlock bottomLeft,
    required VisionBlock bottomRight,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 7,
              child: _imageBlock(
                topLeft.image!,
                const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
                3,
              ),
            ),
            Expanded(
              flex: 3,
              child: _textBlock(
                topRight,
                const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
                3,
              ),
            ),
          ],
        ),

        Row(
          children: [
            Expanded(
              flex: 3,
              child: _textBlock(
                bottomLeft,
                const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(4),
                ),
                2,
              ),
            ),
            Expanded(
              flex: 7,
              child: _imageBlock(
                bottomRight.image!,
                const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(12),
                ),
                2,
              ),
            ),
          ],
        ),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF342D18),
            fontSize: 18,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _imageBlock(String asset, BorderRadius radius, double borderWidth) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFFF5E0), width: borderWidth),
        borderRadius: radius,
        image: DecorationImage(image: AssetImage(asset), fit: BoxFit.cover),
      ),
    );
  }

  Widget _textBlock(
    VisionBlock block,
    BorderRadius radius,
    double borderWidth,
  ) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: block.backgroundColor,
        border: Border.all(color: const Color(0xFFFFF5E0), width: borderWidth),
        borderRadius: radius,
      ),
      child: Center(
        child: Text(
          block.text ?? '',
          style: const TextStyle(
            color: Color(0xFF372D17),
            fontSize: 12,
            fontFamily: 'Podkova',
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 160),
        Container(
          width: 84,
          height: 84,
          decoration: const BoxDecoration(
            color: Color(0xFFFFF5E0),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset("assets/visions.png", width: 48, height: 48),
          ),
        ),

        const SizedBox(height: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Your Gentle Future',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF2D2511),
                fontSize: 20,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'A vision board that connects what you want with gratitude for what you already have.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF2D2511),
                fontSize: 16,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const VisionExampleScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFC07021),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'See Example',
                    style: TextStyle(
                      color: Color(0xFFC07021),
                      fontSize: 16,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const CreateNewVisionScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFC17C37),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x99000000),
                        offset: Offset(1, 4),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Create New Board',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuIcon() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const SetingsView()),
        );
      },
      child: Image.asset('assets/menuHome.png', height: 40, width: 40),
    );
  }
}

Widget createNewBoardButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const CreateNewVisionScreen()),
      );
    },
    child: Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF2E3D0),
        border: Border.all(width: 1.5, color: const Color(0xFFC07021)),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x99000000),
            offset: Offset(1, 3),
            blurRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: ClipOval(
              child: Image.asset(
                'assets/plus-sign-circle.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'Create New Board',
            style: TextStyle(
              color: Color(0xFFC07021),
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

class VisionBlock {
  final String? image;
  final String? text;
  final Color backgroundColor;

  VisionBlock({this.image, this.text, required this.backgroundColor});
}
