import 'package:flutter/material.dart';
import 'package:gratefull_panda/Common/common.dart';
import 'package:gratefull_panda/Constant/constant.dart';
import 'package:gratefull_panda/Database/vision_data_db.dart';
import 'package:gratefull_panda/Models/vision.dart';
import 'package:gratefull_panda/Models/vision_data.dart';
import 'package:gratefull_panda/Vision/vision_play_text.dart';

// ignore: must_be_immutable
class VisionBoardScreen extends StatefulWidget {
  final Vision? vision;
  bool? isFromExample = false;
  VisionBoardScreen({super.key, this.vision, this.isFromExample});
  @override
  State<VisionBoardScreen> createState() => _VisionBoardScreenState();
}

class _VisionBoardScreenState extends State<VisionBoardScreen> {
  List<VisionData>? visionDataList = [];

  @override
  void initState() {
    super.initState();
    loadVisionData();
  }

  Future<void> loadVisionData() async {
    final items = await VisionDataDb.instance.getVisionDataByVisionId(
      widget.vision!.id!.toString(),
    );
    setState(() {
      visionDataList = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7EAD7),
      body: Column(
        children: [
          SizedBox(height: 60),
          Row(
            children: [
              SizedBox(width: 20),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(
                    "assets/arrow-left.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Spacer(),
              Text(
                widget.vision?.name ?? "",
                style: TextStyle(
                  color: Color(0xFF372D17),
                  fontSize: 18,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Icon(Icons.more_horiz, color: Colors.black),
              SizedBox(width: 20),
            ],
          ),
          SizedBox(height: 28),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: GridView.builder(
                padding: EdgeInsets.zero, // 👈 removes top (and all) margin
                shrinkWrap: true,
                itemCount: visionDataList!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return VisionGridItem(
                    item: visionDataList![index],
                    isFromExample: widget.isFromExample,
                  );
                },
              ),
            ),
          ),
          VisionBottomBar(vision: widget.vision),
        ],
      ),
    );
  }
}

class VisionGridItem extends StatelessWidget {
  final VisionData item;
  final bool? isFromExample;

  const VisionGridItem({super.key, required this.item, this.isFromExample});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: item.type == 'text' ? const EdgeInsets.all(6) : EdgeInsets.zero,
      decoration: BoxDecoration(color: fromHex(item.color ?? '#FFFFFF')),
      child: item.type == 'image'
          ? ClipRRect(
              child: Image.network(
                (isFromExample ?? false)
                    ? imageBaseUrl + item.value!
                    : item.value!,

                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.image_not_supported, size: 40),
                  );
                },
              ),
            )
          : Center(
              child: Text(
                item.value!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF372D17),
                  fontSize: 12,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
    );
  }
}

class VisionBottomBar extends StatelessWidget {
  const VisionBottomBar({super.key, this.vision});
  final Vision? vision;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 32),
      decoration: BoxDecoration(color: const Color(0xFFFFF5E0)),
      child: Row(
        children: [
          Container(
            width: 114,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: ShapeDecoration(
              color: const Color(0xFFF2E3D0),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.50, color: const Color(0xFFC07021)),
                borderRadius: BorderRadius.circular(12),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x99000000),
                  blurRadius: 0,
                  offset: Offset(1, 3),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () =>
                  print('Color button tapped'), // Implement color picker
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 18,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Image.asset("assets/folder.png"),
                  ),
                  Container(
                    width: 28,
                    height: 28,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Image.asset("assets/text.png"),
                  ),
                ],
              ),
            ),
          ),

          Spacer(),

          Container(
            width: 108,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: ShapeDecoration(
              color: const Color(0xFFF2E3D0),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.50, color: const Color(0xFFC07021)),
                borderRadius: BorderRadius.circular(12),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x99000000),
                  blurRadius: 0,
                  offset: Offset(1, 3),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VisionPlayText(vision: vision, isFromExample: true),
                  ),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Image.asset("assets/play_brown.png"),
                  ),
                  Text(
                    'play',
                    style: TextStyle(
                      color: const Color(0xFF6F441B),
                      fontSize: 16,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                      height: 1.40,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
