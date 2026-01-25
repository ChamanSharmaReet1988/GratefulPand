import 'package:flutter/material.dart';
import 'package:gratefull_panda/Database/afirmation_db.dart';
import 'package:gratefull_panda/Models/affirmation.dart';

class AffirmationCreateScreen extends StatefulWidget {
  const AffirmationCreateScreen({super.key});

  @override
  State<AffirmationCreateScreen> createState() =>
      _AffirmationCreateScreenState();
}

class _AffirmationCreateScreenState extends State<AffirmationCreateScreen> {
  final TextEditingController affirmationText = TextEditingController();
  Future<void> saveAffirmation() async {
    final text = affirmationText.text.trim();
    if (text.isEmpty) {
      return;
    }
    final affirmationObj = Affirmation(
      description: text,
      categoryId: "my",
      isFavorite: "0",
    );
    await AffirmationDb.instance.insertAffirmation(affirmation: affirmationObj);
    affirmationText.clear();
    if (mounted) {
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6E8D5),
      body: Column(
        children: [
          SizedBox(height: 54),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: Image.asset("assets/back.png"),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    affirmationText.text = "";
                  },
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: Image.asset("assets/delete.png"),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 200),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextField(
                  maxLines: 10,
                  controller: affirmationText,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) {
                    FocusScope.of(context).unfocus();
                  },
                  textAlign: TextAlign.center,
                  onEditingComplete: () {
                    FocusScope.of(context).unfocus();
                  },
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(
                    color: Color(0xFF372D17),
                    fontSize: 28,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Write your affirmation here...',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 157, 157, 156),
                      fontSize: 16,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.only(top: 4, bottom: 4),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: Row(
              children: [
                GestureDetector(
                  onTap: saveAffirmation,
                  child: Container(
                    width: 66,

                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Image.asset("assets/mic.png"),
                  ),
                ),

                Spacer(),

                Container(
                  width: 108,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF2E3D0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1.50,
                        color: const Color(0xFFC07021),
                      ),
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
                    onTap: saveAffirmation,
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
                          child: Image.asset("assets/affirmation_save.png"),
                        ),
                        Text(
                          'Save',
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
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
