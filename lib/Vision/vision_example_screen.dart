import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/Database/vision_data_db.dart';
import 'package:gratefull_panda/Database/vision_db.dart';
import 'package:gratefull_panda/Models/vision.dart';
import 'package:gratefull_panda/Models/vision_data.dart';

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
                return VisionCollage(vision: item);
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
      future: VisionDataDb.instance.getVisionDataByVisionId(
        vision.id.toString(),
      ),
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
            return _single(items[0]);
          case 2:
            return _two(items);
          case 3:
            return _three(items);
          case 4:
          default:
            return _four(items);
        }
      },
    );
  }

  Widget _single(VisionData item) => _tile(item, height: 200);
  Widget _two(List<VisionData> items) => Row(
    children: [
      Expanded(child: _tile(items[0], height: 160)),
      const SizedBox(width: 8),
      Expanded(child: _tile(items[1], height: 160)),
    ],
  );
  Widget _three(List<VisionData> items) => Column(
    children: [
      Row(
        children: [
          Expanded(child: _tile(items[0], height: 120)),
          const SizedBox(width: 8),
          Expanded(child: _tile(items[1], height: 120)),
        ],
      ),
      const SizedBox(height: 8),
      _tile(items[2], height: 120),
    ],
  );
  Widget _four(List<VisionData> items) => Column(
    children: [
      Row(
        children: [
          Expanded(child: _tile(items[0], height: 120)),
          const SizedBox(width: 8),
          Expanded(child: _tile(items[1], height: 120)),
        ],
      ),
      const SizedBox(height: 8),
      Row(
        children: [
          Expanded(child: _tile(items[2], height: 120)),
          const SizedBox(width: 8),
          Expanded(child: _tile(items[3], height: 120)),
        ],
      ),
    ],
  );

  Widget _tile(VisionData item, {required double height}) {
    return Container(
      height: height,
      padding: item.type == 'text' ? const EdgeInsets.all(12) : EdgeInsets.zero,
      decoration: BoxDecoration(
        color: item.type == 'text'
            ? const Color(0xFFD9D9FF)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        image: item.type == 'image'
            ? DecorationImage(
                image: AssetImage(item.value ?? ""),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: item.type == 'text'
          ? Text(
              item.value ?? "",
              style: const TextStyle(
                fontSize: 13,
                height: 1.3,
                color: Color(0xFF372D17),
                fontFamily: 'Podkova',
              ),
            )
          : null,
    );
  }
}
