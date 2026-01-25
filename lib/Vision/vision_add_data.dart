import 'package:flutter/material.dart';
import 'package:gratefull_panda/Models/vision.dart';
import 'package:gratefull_panda/Vision/add_text.dart';

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
                    onTap: () => Navigator.pop(context),
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
}
