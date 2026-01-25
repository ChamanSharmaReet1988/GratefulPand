import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/constant.dart';
import 'package:gratefull_panda/Database/vision_data_db.dart';
import 'package:gratefull_panda/Models/vision.dart';
import 'package:gratefull_panda/Models/vision_data.dart';

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
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7EAD7),
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          'Vision board 2026',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.more_horiz, color: Colors.black),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                itemCount: visionDataList!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.78,
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
          const VisionBottomBar(),
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
      padding: item.type == 'text' ? const EdgeInsets.all(12) : EdgeInsets.zero,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: item.type == 'image'
          ? ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                (isFromExample ?? false)
                    ? imageBaseUrl + item.value!
                    : item.value!,
                fit: BoxFit.cover,
              ),
            )
          : Center(
              child: Text(
                item.value!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.4,
                  color: Colors.black,
                ),
              ),
            ),
    );
  }
}

class VisionBottomBar extends StatelessWidget {
  const VisionBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFFFFF3DE),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.brown),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: const [
                Icon(Icons.image_outlined, size: 20),
                SizedBox(width: 12),
                Icon(Icons.text_fields, size: 20),
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.brown),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: const [
                Icon(Icons.play_arrow),
                SizedBox(width: 6),
                Text('Play'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
