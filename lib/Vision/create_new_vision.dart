import 'package:flutter/material.dart';
import 'package:gratefull_panda/Database/vision_db.dart';
import 'package:gratefull_panda/Models/vision.dart';
import 'package:gratefull_panda/Vision/vision_add_data.dart';

import 'package:gratefull_panda/constant/color_constant.dart';
import 'package:gratefull_panda/Utils/user_preferences.dart';

class CreateNewVisionScreen extends StatefulWidget {
  const CreateNewVisionScreen({super.key});

  @override
  State<CreateNewVisionScreen> createState() => _CreateNewVisionScreenState();
}

class _CreateNewVisionScreenState extends State<CreateNewVisionScreen> {
  late TextEditingController nameController;
  String userName = "";
  Vision initialVision = Vision(name: "");

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    _loadUserName();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Future<void> _loadUserName() async {
  final savedUserName = await UserPreferences.getUserName();

  if (!mounted) return;

  setState(() {
    userName = savedUserName ?? "";
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Container(
            width: double.infinity,
            height: 48,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(color: Color(0x77000000), offset: Offset(0, 3)),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryButtonsColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () async {
                final name = nameController.text.trim();

                if (name.isEmpty) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please enter board")),
                  );
                  return;
                }
                initialVision.name = name;
                if (initialVision.id != null) {
                  await VisionDb.instance.updateVision(initialVision);
                } else {
                  initialVision = await VisionDb.instance.insertVision(
                    vision: initialVision,
                  );
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VisionAddDataScreen(initialVision: initialVision),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Next",
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Hello $userName",
                          style: TextStyle(
                            color: const Color(0xFF342D18),
                            fontSize: 20,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Name your goal and vision here",
                          style: TextStyle(
                            color: const Color(0xFF342D18),
                            fontSize: 16,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 16, 8),
              child: Text(
                'Name of your board',
                style: TextStyle(
                  color: Color(0xFF60512C),
                  fontSize: 12,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 64,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: ShapeDecoration(
                  color: const Color(0xFFF8F1E9),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Center(
                  child: TextField(
                    style: TextStyle(
                      color: Color(0xFF342D18),
                      fontSize: 14,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your board',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 157, 157, 156),
                        fontSize: 14,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
