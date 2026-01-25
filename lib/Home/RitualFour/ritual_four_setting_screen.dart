import 'package:flutter/material.dart';
import 'package:gratefull_panda/Home/RitualFour/ritual_four_music_list_screen.dart';

class RitualFourSettingsScreen extends StatefulWidget {
  const RitualFourSettingsScreen({super.key});

  @override
  State<RitualFourSettingsScreen> createState() =>
      _RitualFourSettingsScreenState();
}

class _RitualFourSettingsScreenState extends State<RitualFourSettingsScreen> {
  double voiceVolume = 0.4;
  double musicVolume = 0.6;
  double pauseVolume = 2;

  String selectedLoop = "1x";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Color(0xFFF2E3D0),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Settings',
                    style: TextStyle(
                      color: Color(0xFF372D17) /* Dark-500 */,
                      fontSize: 16,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset(
                        "assets/crossblack.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _sliderRow(
                              title: 'Voice Volumn',
                              value: voiceVolume,
                              onChanged: (v) => setState(() => voiceVolume = v),
                              image: "assets/mic_ritual_settings.png",
                              divisions: 10,
                              min: 0,
                              max: 1,
                              showText: false,
                            ),
                            custmDivider(),
                            _voiceTile(
                              rightImage: false,
                              title: 'John',
                              subtitle: 'he/him',
                              trailing: 'Focused & Energetic',
                              image: "assets/unselectedcircle.png",
                            ),
                            custmDivider(),
                            _voiceTile(
                              rightImage: false,
                              title: 'Amanda',
                              subtitle: 'she/her',
                              trailing: 'Calm & Compassionate',
                              image: "assets/unselectedcircle.png",
                            ),
                            custmDivider(),
                            _voiceTile(
                              rightImage: false,
                              title: 'No voice',
                              image: "assets/unselectedcircle.png",
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      _card(
                        child: Column(
                          children: [
                            _voiceTile(
                              rightImage: true,
                              title: 'Background Music',
                              subtitle: 'Ocean and piano',
                              trailing: 'Focused & Energetic',
                              image: "assets/music.png",
                            ),
                            const SizedBox(height: 10),
                            custmDivider(),
                            const SizedBox(height: 8),
                            _sliderRow(
                              title: 'Background Music Volumn',
                              value: musicVolume,
                              onChanged: (v) => setState(() => musicVolume = v),
                              image: "assets/mic_ritual_settings.png",
                              divisions: 10,
                              min: 0,
                              max: 1,
                              showText: false,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      _card(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 0),
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Image.asset(
                                        "assets/repeat.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(width: 4),
                                        Text(
                                          "Loop",
                                          style: TextStyle(
                                            color: const Color(0xFF342D18),
                                            fontSize: 14,
                                            fontFamily: 'Outfit',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          spacing: 8,
                                          children: [
                                            _loopButton(
                                              isSelected: selectedLoop == "1x"
                                                  ? true
                                                  : false,
                                              title: "1x",
                                            ),
                                            _loopButton(
                                              isSelected: selectedLoop == "2x"
                                                  ? true
                                                  : false,
                                              title: "2x",
                                            ),
                                            _loopButton(
                                              isSelected: selectedLoop == "3x"
                                                  ? true
                                                  : false,
                                              title: "3x",
                                            ),
                                            _loopButton(
                                              isSelected: selectedLoop == "4x"
                                                  ? true
                                                  : false,
                                              title: "4x",
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            custmDivider(),
                            const SizedBox(height: 12),
                            _sliderRow(
                              title: 'Pauses',
                              value: pauseVolume,
                              onChanged: (v) => setState(() => pauseVolume = v),
                              image: "assets/ritual_four_settings_pause.png",
                              divisions: 5,
                              min: 1,
                              max: 5,
                              showText: true,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: const Color(0xFFFFF9EF),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: child,
    );
  }

  Widget _sliderRow({
    required String title,
    required double value,
    required String image,
    required ValueChanged<double> onChanged,
    required int divisions,
    required double min,
    required double max,
    required bool showText,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 6),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF342D18),
                    fontSize: 14,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 6,
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 8,
                          ),
                          overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 14,
                          ),
                        ),
                        child: Slider(
                          value: value,
                          min: min,
                          max: max,
                          activeColor: const Color(0xFFFF9F2F),
                          inactiveColor: const Color(0xFFEDEDED),
                          onChanged: onChanged,
                        ),
                      ),
                    ),
                    if (showText)
                      Text(
                        "${pauseVolume.round()} Sec",
                        style: TextStyle(
                          color: const Color(0xFF342D18),
                          fontSize: 14,
                          fontFamily: 'Outfit',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _voiceTile({
    required bool rightImage,
    required String title,
    String? subtitle,
    String? trailing,
    String? image,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (rightImage) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              barrierColor: Colors.black.withOpacity(0.3),
              builder: (context) {
                return const RitualFourMusicListScreen();
              },
            );
          }
        },

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: SizedBox(
                height: 20,
                width: 20,
                child: Image.asset(image ?? "", fit: BoxFit.contain),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 4),
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF342D18),
                      fontSize: 14,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 2),
                  if (subtitle?.isNotEmpty ?? false)
                    Text(
                      subtitle ?? "",
                      style: TextStyle(
                        color: const Color(0xB2342D18),
                        fontSize: 12,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  const SizedBox(width: 4),
                ],
              ),
            ),
            rightImage
                ? SizedBox(
                    height: 24,
                    width: 24,
                    child: Image.asset(
                      "assets/arrow_right_black.png",
                      fit: BoxFit.contain,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Text(
                      trailing ?? "",
                      style: TextStyle(
                        color: const Color(0xFF342D18),
                        fontSize: 12,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _loopButton({required bool isSelected, required String title}) {
    return GestureDetector(
      onTap: () => setState(() => selectedLoop = title),
      child: Container(
        width: 48,
        padding: const EdgeInsets.all(6),
        decoration: isSelected
            ? ShapeDecoration(
                color: const Color(0xFFF2E3D0),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: const Color(0xFFC07021)),
                  borderRadius: BorderRadius.circular(8),
                ),
              )
            : ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: const Color(0xFFB3B6B5)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF342D18),
                  fontSize: 12,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget custmDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Divider(color: Color(0xFFFFF1DE), thickness: 1),
    );
  }
}
