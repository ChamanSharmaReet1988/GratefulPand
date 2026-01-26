import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gratefull_panda/Common/common.dart';
import 'package:gratefull_panda/Common/initial_data_sync.dart';
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/Database/vision_data_db.dart';
import 'package:gratefull_panda/Database/vision_db.dart';
import 'package:gratefull_panda/Models/vision.dart';
import 'package:gratefull_panda/Models/vision_data.dart';
import 'package:gratefull_panda/Settings/settings_view.dart';
import 'package:gratefull_panda/Vision/create_new_vision.dart';
import 'package:gratefull_panda/Vision/vision_board.dart';
import 'package:gratefull_panda/Vision/vision_example_screen.dart';

class VisionScreen extends StatefulWidget {
  const VisionScreen({super.key});

  @override
  State<VisionScreen> createState() => _VisionScreenState();
}

class _VisionScreenState extends State<VisionScreen> {
  List<Vision> visionList = [];

  @override
  void initState() {
    super.initState();
    loadVisionData();
  }

  Future<void> loadVisionData() async {
    final items = await VisionDb.instance.getAllVisionsAfterTwo();
    setState(() {
      visionList = items;
    });
  }

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
                  if (visionList.isNotEmpty) ...[
                    Spacer(),
                    createNewBoardButton(context),
                  ],
                ],
              ),
            ),

            if (visionList.isNotEmpty)
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: visionList.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 24),
                  itemBuilder: (context, index) {
                    final item = visionList[index];
                    return InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VisionBoardScreen(
                              vision: item,
                              isFromExample: false,
                            ),
                          ),
                        );
                      },
                      child: VisionCollageForData(vision: item),
                    );
                  },
                ),
              )
            else
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Center(child: _buildEmptyState(context)),
                ),
              ),
          ],
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

class VisionCollageForData extends StatelessWidget {
  final Vision vision;

  const VisionCollageForData({super.key, required this.vision});

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
            return SizedBox();
          case 2:
            return SizedBox();
          case 3:
            return SizedBox();
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
                        fromHex(list[1].color ?? 'D6DDB6'),
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
      child: Image.file(
        File('${AppPaths.documentsDir}/$imageUrl'),
        height: 110,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 110,
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
      height: 110,
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
