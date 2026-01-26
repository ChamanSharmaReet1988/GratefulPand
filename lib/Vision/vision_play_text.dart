import 'package:flutter/material.dart';
import 'package:gratefull_panda/Constant/constant.dart';
import 'package:gratefull_panda/Database/vision_data_db.dart';
import 'package:gratefull_panda/Models/vision.dart';
import 'package:gratefull_panda/Models/vision_data.dart';
import 'package:gratefull_panda/Vision/vision_settings.dart';
import 'package:gratefull_panda/constant/color_constant.dart';

// ignore: must_be_immutable
class VisionPlayText extends StatefulWidget {
  VisionPlayText({super.key, required this.vision, this.isFromExample});
  final Vision? vision;
  bool? isFromExample = false;
  @override
  State<VisionPlayText> createState() => _VisionPlayTextState();
}

class _VisionPlayTextState extends State<VisionPlayText> {
  late TextEditingController nameController;
  int currentVision = 0;
  List<VisionData> visionDataList = [];

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

  void navigateToRootNoAnimation() {
    Navigator.pop(context);
  }

  void settingsAction() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (context) {
        return const VisionSettings();
      },
    );
  }

  void pauseAction() {}
  void favAction() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(120, 8, 120, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              GestureDetector(
                onTap: () => settingsAction(),
                child: SizedBox(
                  height: 48,
                  width: 48,
                  child: Image.asset(
                    "assets/settings_vision_play.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => pauseAction(),
                child: SizedBox(
                  height: 48,
                  width: 48,
                  child: Image.asset("assets/pause.png", fit: BoxFit.contain),
                ),
              ),
            ],
          ),
        ),
      ),

      body: Scaffold(
        backgroundColor: AppColors.splashBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 54),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(22),
                  child: GestureDetector(
                    onTap: () => navigateToRootNoAnimation(),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset(
                        "assets/crossblack.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            const SizedBox(height: 18),
            Spacer(),
            Center(
              child: Column(
                children: [
                  if (visionDataList.isNotEmpty &&
                      (visionDataList[currentVision].type ?? "") == "image")
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        (widget.isFromExample ?? false)
                            ? imageBaseUrl +
                                  visionDataList[currentVision].value!
                            : visionDataList[currentVision].value!,
                        fit: BoxFit.contain,
                      ),
                    )
                  else
                    Text(
                      visionDataList.isEmpty
                          ? ""
                          : visionDataList[currentVision].value ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF372D17),
                        fontSize: 28,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
            ),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
