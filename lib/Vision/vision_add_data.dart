import 'package:flutter/material.dart';
import 'package:gratefull_panda/Models/vision.dart';
import 'package:gratefull_panda/Vision/add_text.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class VisionAddDataScreen extends StatefulWidget {
  final Vision? initialVision;
  const VisionAddDataScreen({super.key, required this.initialVision});

  @override
  State<VisionAddDataScreen> createState() => _VisionAddDataScreenState();
}

class _VisionAddDataScreenState extends State<VisionAddDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6E9D7),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            SizedBox(height: 70),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: GestureDetector(
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
                ),
                Spacer(),
                Text(
                  widget.initialVision?.name ?? "",
                  style: TextStyle(
                    color: const Color(0xFF372D17) /* Dark-500 */,
                    fontSize: 18,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                SizedBox(width: 34),
              ],
            ),
            Spacer(),
            SizedBox(
              height: 84,
              width: 84,
              child: Image.asset("assets/camera.png", fit: BoxFit.contain),
            ),

            const SizedBox(height: 22),

            const Text(
              'Every dream starts with\none small step.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF2D2511) /* Dark-600 */,
                fontSize: 20,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Add your first image or thought, and let\nyour vision grow from there.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF2D2511) /* Dark-600 */,
                fontSize: 16,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(height: 40),

            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AddTextScreen(initialVision: widget.initialVision),
                      ),
                    ),
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 2,
                            color: const Color(0xFFC07021),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Add Text',
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
                ),
                const SizedBox(width: 22),
                Expanded(
                  child: GestureDetector(
                    onTap: () => showAddImageBottomSheet(context),
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      child: const Center(
                        child: Text(
                          'Add Image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                            height: 1.40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  void showAddImageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) {
      return Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 40,
        ),
        decoration: const BoxDecoration(
          color: Color(0xFFFFF0DE),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Add Image',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF342D18),
                fontSize: 20,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 24),

            _imageOptionButton(
              title: "Upload from Gallery",
              imagePath: "assets/addImage.png",
              onTap: () {
                pickImageFromGallery(context);
              },
            ),

            const SizedBox(height: 12),

            _imageOptionButton(
              title: "Upload from Gallery",
              imagePath: "assets/addImage.png",
              onTap: () {
                pickImageFromGallery(context);
              },
            ),
          ],
        ),
      );
    },
  );
}

Widget _imageOptionButton({
  required String title,
  required String imagePath,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: ShapeDecoration(
        color: const Color(0xFFF2E3D0),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1.5,
            color: Color(0xFFC07021),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x99000000),
            offset: Offset(1, 3),
          )
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF342D18),
              fontSize: 14,
              fontFamily: 'Outfit',
            ),
          ),
        ],
      ),
    ),
  );
}

Future<void> pickImageFromGallery(BuildContext context) async {
  final ImagePicker picker = ImagePicker();

  final XFile? image = await picker.pickImage(
    source: ImageSource.gallery,
  );

  if (image != null) {
    print("Selected image path: ${image.path}");
    // saveImagePathToDB(image.path);
    Navigator.pop(context); 

  } else {
    print("No image selected");
  }
}
}
