import 'package:flutter/material.dart';
import 'package:gratefull_panda/Common/common.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/Constant/constant.dart';
import 'package:gratefull_panda/Database/vision_data_db.dart';
import 'package:gratefull_panda/Database/vision_db.dart';
import 'package:gratefull_panda/Models/vision.dart';
import 'package:gratefull_panda/Models/vision_data.dart';
import 'package:gratefull_panda/Vision/vision_board.dart';

class VisionExampleScreen extends StatefulWidget {
  const VisionExampleScreen({super.key});

  @override
  State<VisionExampleScreen> createState() => _VisionExampleScreenState();
}

class _VisionExampleScreenState extends State<VisionExampleScreen> {
  List<Vision> visionExamples = [];

  @override
  void initState() {
    super.initState();
    loadVisionData();
  }

  Future<void> loadVisionData() async {
    final items = await VisionDb.instance.getFirstTwoVisions();
    setState(() {
      visionExamples = items;
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset("assets/back.png"),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.only(left: 24, right: 16),
              child: Column(
                children: [
                  Text(
                    'What is a Vision Board?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF342D18),
                      fontSize: 18,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'A vision board is a visual reminder of the life you’re gently growing toward. Each tile represents a calm desire, a personal intention, or a moment you’re grateful for. It doesn’t pressure you. It guides you.',
                    textAlign: TextAlign.center,
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

            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'EXAMPLES',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: visionExamples.length,
              separatorBuilder: (_, __) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                final item = visionExamples[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VisionBoardScreen(
                          vision: item,
                          isFromExample: true,
                        ),
                      ),
                    );
                  },
                  child: VisionCollage(vision: item),
                );
              },
            ),
            const SizedBox(height: 52),
          ],
        ),
      ),
    );
  }
}

class VisionCollage extends StatelessWidget {
  final Vision vision;
  const VisionCollage({super.key, required this.vision});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<VisionData>>(
      future: VisionDataDb.instance.getVisionCollageItems(vision.id.toString()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final items = snapshot.data ?? [];

        if (items.isEmpty) {
          return const SizedBox();
        }

        final count = items.length;
        switch (count) {
          case 1:
          //return _single(items[0]);
          case 2:
          //return _two(items);
          case 3:
          //return _three(items);
          case 4:
          default:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FourCollageCard(list: items),
                const SizedBox(height: 10),
                Text(
                  vision.name,
                  style: TextStyle(
                    color: Color(0xFF342D18),
                    fontSize: 16,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  vision.name == "Home & Cozy Lifestyle"
                      ? 'Dream home, decor, cozy routines, environment you want'
                      : "Identity, confidence, self-love, inner strength.",
                  style: TextStyle(
                    color: Color(0xB2342D18),
                    fontSize: 14,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            );
        }
      },
    );
  }
}

// ignore: must_be_immutable
class FourCollageCard extends StatelessWidget {
  const FourCollageCard({super.key, required this.list});
  final List<VisionData> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Color(0xFFFFF5E0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: list[0].type == 'image'
                    ? _imageCard(list[0].value ?? '', 12, 0, 0, 0)
                    : _textCard(
                        list[0].value ?? '',
                        fromHex(list[0].color ?? 'D6DDB6'),
                        12,
                        0,
                        0,
                        0,
                      ),
              ),
              const SizedBox(width: 4),

              Expanded(
                flex: 1,
                child: list[1].type == 'image'
                    ? _imageCard(list[1].value ?? '', 0, 12, 0, 0)
                    : _textCard(
                        list[1].value ?? '',
                        fromHex(list[0].color ?? 'D6DDB6'),
                        0,
                        12,
                        0,
                        0,
                      ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: list[2].type == 'image'
                    ? _imageCard(list[2].value ?? '', 0, 0, 12, 0)
                    : _textCard(
                        list[2].value ?? '',
                        fromHex(list[2].color ?? 'D6DDB6'),
                        0,
                        0,
                        12,
                        0,
                      ),
              ),
              const SizedBox(width: 4),

              Expanded(
                flex: 2,
                child: list[3].type == 'image'
                    ? _imageCard(list[3].value ?? '', 0, 0, 0, 12)
                    : _textCard(
                        list[3].value ?? '',
                        fromHex(list[3].color ?? 'D6DDB6'),
                        0,
                        0,
                        0,
                        12,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _imageCard(
    String imageUrl,
    double topLeft,
    double topRight,
    double bottomLeft,
    double bottomRight,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
      child: Image.network(
        imageBaseUrl + imageUrl,
        height: 120,
        width: double.infinity,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            height: 120,
            color: Colors.grey.shade200,
            child: const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 120,
            color: Colors.grey.shade300,
            child: const Icon(Icons.image_not_supported, size: 40),
          );
        },
      ),
    );
  }

  Widget _textCard(
    String text,
    Color bgColor,
    double topLeft,
    double topRight,
    double bottomLeft,
    double bottomRight,
  ) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
        ),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: const Color(0xFF372D17),
            fontSize: 12,
            fontFamily: 'Podkova',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
