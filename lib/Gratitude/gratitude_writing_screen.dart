import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async'; 
import 'package:gratefull_panda/Constant/color_constant.dart';
import 'package:gratefull_panda/Gratitude/gratitude_guide_screen.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:image_picker/image_picker.dart'; 

class GratitudeWritingScreen extends StatefulWidget {
  final String? category;
  final Map<String, String>? itemData;

  const GratitudeWritingScreen({
    super.key,
    this.category,
    this.itemData,
  });

  @override
  State<GratitudeWritingScreen> createState() =>
      _GratitudeWritingScreenState();
}

class _GratitudeWritingScreenState extends State<GratitudeWritingScreen> {
  bool _showDateMenu = false;
  bool _showMoreMenu = false;
  bool _showEmojiPicker = false;
  String? _selectedEmoji;
  final TextEditingController gratitudeController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  
  List<Uint8List> _selectedImages = []; 
  final ImagePicker _picker = ImagePicker(); 
  
  // Update voice note variables
  bool _hasVoiceNote = false; 
  String _voiceNoteDuration = '00:00'; 
  bool _isRecording = false;
  FocusNode _textFieldFocusNode = FocusNode();

  List<Map<String, String>> gratitudeEntries = [];

  @override
  void initState() {
    super.initState();
    if (widget.itemData != null && widget.itemData!.isNotEmpty) {
      gratitudeEntries.add(widget.itemData!);
    } else {
      gratitudeEntries.add({
        "prompt": "New prompt here...",
        "placeholder": "Type your answer here..."
      });
    }
  }

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  // Method to hide keyboard
  void _hideKeyboard() {
    FocusScope.of(context).unfocus();
    setState(() {
      _showEmojiPicker = false;
    });
  }

  Future<void> _pickImage() async {
    if (_selectedImages.length >= 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Maximum 4 images allowed')),
      );
      return;
    }
    
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() {
        _selectedImages.add(bytes);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  // Updated voice note methods
  void _startRecording() {
    setState(() {
      _isRecording = true;
      _hasVoiceNote = true;
      // Start recording logic here
      // You would integrate with a recording library like record/audioplayers
      _voiceNoteDuration = '00:00';
    });
    
    // Simulate recording time
    int seconds = 0;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_isRecording) {
        setState(() {
          seconds++;
          _voiceNoteDuration = '${(seconds ~/ 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}';
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _stopRecording() {
  setState(() {
    _isRecording = false;
    // For demo purposes, set a sample duration
    _voiceNoteDuration = '1:30';
  });
  // Stop recording logic here
}

  void _removeVoiceNote() {
    setState(() {
      _hasVoiceNote = false;
      _isRecording = false;
      _voiceNoteDuration = '00:00';
    });
  }

  void _playVoiceNote() {
    // Play voice note logic
    // You would integrate with a playback library
  }

  void _insertEmoji(String emoji, TextEditingController controller) {
    final text = controller.text;
    final selection = controller.selection;

    final newText = text.replaceRange(
      selection.start >= 0 ? selection.start : text.length,
      selection.end >= 0 ? selection.end : text.length,
      emoji,
    );

    controller.text = newText;
    controller.selection = TextSelection.collapsed(
      offset: (selection.start >= 0 ? selection.start : text.length) +
          emoji.length,
    );
  }

  @override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: _hideKeyboard,
    behavior: HitTestBehavior.opaque,
    child: Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 0), 
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    _buildHeader(),
                    const SizedBox(height: 24),

                    ...List.generate(gratitudeEntries.length, (index) {
                      final entry = gratitudeEntries[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: buildGratitudePromptCard(
                          category: widget.category ?? '',
                          prompt: entry["prompt"] ?? '',
                          placeholder: entry["placeholder"] ?? '',
                          onNewPrompt: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GratitudeGuideScreen(),
                              ),
                            );
                          },
                          onHowToWrite: () {
                            print('How to Write clicked for card $index');
                          },
                          onClose: () {
                            setState(() {
                              gratitudeEntries.removeAt(index);
                            });
                          },
                        ),
                      );
                    }),

                    const SizedBox(height: 24),
                    buildStartWriteWidget(controller: gratitudeController),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),

            if (_showDateMenu)
              Positioned(
                top: 65,
                left: MediaQuery.of(context).size.width / 2 - 95,
                child: _buildDateMenu(),
              ),
            if (_showMoreMenu)
              Positioned(
                top: 65,
                right: 20,
                child: _buildMoreMenu(),
              ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomButtons()
    ),
  );
}

Widget _buildBottomButtons() {
  return SafeArea(
    bottom: false, 
    child: Container(
      padding: const EdgeInsets.only(
        top: 16,
        left: 24,
        right: 24,
        bottom: 32,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFFFF5E0), 
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: ShapeDecoration(
              color: const Color(0xFFF2E3D0),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1.5, color: Color(0xFFC07021)),
                borderRadius: BorderRadius.circular(12),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x99000000),
                  blurRadius: 0,
                  offset: Offset(1, 3),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Add Image Button
                GestureDetector(
                  onTap: _pickImage,
                  child: Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: Image.asset("assets/addImage.png", fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 20), 
                
                // Voice Note Button
                GestureDetector(
                  onTap: () {
                    if (_isRecording) {
                      _stopRecording();
                    } else if (_hasVoiceNote) {
                      _playVoiceNote();
                    } else {
                      _startRecording();
                    }
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: Image.asset(
                          "assets/mic_ritual_settings.png",
                          color: _isRecording ? Colors.red : (_hasVoiceNote ? Colors.green : null),
                        ),
                      ),                      
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Spacer(), 
          Container(
            width: 108, 
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: ShapeDecoration(
              color: const Color(0xFFF2E3D0),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1.5, color: Color(0xFFC07021)),
                borderRadius: BorderRadius.circular(12),
              ),
              shadows: const [
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
                // Save functionality
               },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: Image.asset("assets/affirmation_save.png"),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Save',
                    style: TextStyle(
                      color: Color(0xFF6F441B),
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
  );
}

Widget buildStartWriteWidget({
  required TextEditingController controller,
}) {
  return GestureDetector(
    onTap: () {}, 
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF2E3D0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. EMOJI SECTION (at top)
          if (_selectedEmoji != null)
            GestureDetector(
              onTap: () {
                setState(() {
                  _showEmojiPicker = true;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  _selectedEmoji!,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            )
          else
            GestureDetector(
              onTap: () {
                setState(() {
                  _showEmojiPicker = !_showEmojiPicker;
                });
              },
              child: Container(
                height: 36,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9D1B5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/smile.png',
                      width: 14,
                      height: 14,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'Add emoji',
                      style: TextStyle(
                        color: Color(0xFF8E7743),
                        fontSize: 12,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Emoji Picker
          if (_showEmojiPicker)
            SizedBox(
              height: 250,
              child: EmojiPicker(
                onEmojiSelected: (category, emoji) {
                  setState(() {
                    _selectedEmoji = emoji.emoji;
                    _showEmojiPicker = false;
                  });
                },
                config: const Config(
                  columns: 7,
                  emojiSizeMax: 32,
                  bgColor: Color(0xFFF2E3D0),
                  indicatorColor: Color(0xFF8E7743),
                  iconColorSelected: Color(0xFF8E7743),
                ),
              ),
            ),

          const SizedBox(height: 8),

          // 2. TEXT FIELD (after emoji)
          TextField(
            focusNode: _textFieldFocusNode,
            controller: controller,
            maxLines: null,
            minLines: 3,
            keyboardType: TextInputType.multiline,
            style: const TextStyle(
              color: Color(0xFF372D17),
              fontSize: 16,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
            ),
            decoration: const InputDecoration(
              hintText: 'Start writing here...',
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),

          // 3. IMAGES GRID DISPLAY (after text field)
          if (_selectedImages.isNotEmpty) ...[
            const SizedBox(height: 10),
            _buildImagesGrid(),
          ],

          // 4. VOICE NOTE DISPLAY (below images)
          if (_hasVoiceNote) ...[
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFE9D1B5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  // Play/Pause button
                  GestureDetector(
                    onTap: _playVoiceNote,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: const Color(0xFF8E7743),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: 12),
                  
                  // Voice note info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Voice Note',
                          style: TextStyle(
                            color: Color(0xFF8E7743),
                            fontSize: 14,
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _voiceNoteDuration,
                          style: TextStyle(
                            color: Color(0xFF8E7743).withOpacity(0.7),
                            fontSize: 12,
                            fontFamily: 'Outfit',
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Recording indicator (if recording)
                  if (_isRecording)
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.red,
                          size: 12,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Recording...',
                          style: TextStyle(
                            color: Color(0xFF8E7743),
                            fontSize: 12,
                            fontFamily: 'Outfit',
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  
                  // Delete button
                  GestureDetector(
                    onTap: _removeVoiceNote,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Color(0xFF8E7743).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Icon(
                        Icons.close,
                        size: 16,
                        color: Color(0xFF8E7743),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    ),
  );
}

// Widget to build images grid with 4 formats as per screenshot
Widget _buildImagesGrid() {
  final imageCount = _selectedImages.length;
  
  if (imageCount == 1) {
    // Single image - full width
    return _buildImageContainer(_selectedImages[0], 0, isSingle: true);
  } else if (imageCount == 2) {
    // Two images side by side
    return Row(
      children: [
        Expanded(
          child: _buildImageContainer(_selectedImages[0], 0),
        ),
        SizedBox(width: 8),
        Expanded(
          child: _buildImageContainer(_selectedImages[1], 1),
        ),
      ],
    );
  } else if (imageCount == 3) {
    // First image full width, next two below
    return Column(
      children: [
        _buildImageContainer(_selectedImages[0], 0, isSingle: true),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildImageContainer(_selectedImages[1], 1),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _buildImageContainer(_selectedImages[2], 2),
            ),
          ],
        ),
      ],
    );
  } else if (imageCount == 4) {
    // 2x2 grid
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildImageContainer(_selectedImages[0], 0),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _buildImageContainer(_selectedImages[1], 1),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildImageContainer(_selectedImages[2], 2),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _buildImageContainer(_selectedImages[3], 3),
            ),
          ],
        ),
      ],
    );
  }
  
  return Container();
}

// Widget for individual image container with remove button
Widget _buildImageContainer(Uint8List imageBytes, int index, {bool isSingle = false}) {
  return Container(
    width: double.infinity,
    height: isSingle ? 200 : 150,
    decoration: ShapeDecoration(
      image: DecorationImage(
        image: MemoryImage(imageBytes),
        fit: BoxFit.cover,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    child: Stack(
      children: [
        Positioned(
          right: 8,
          top: 8,
          child: GestureDetector(
            onTap: () => _removeImage(index),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: ShapeDecoration(
                color: const Color(0xFFE9D1B5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Icon(
                Icons.close,
                size: 16,
                color: Color(0xFF8E7743),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


  Widget buildGratitudePromptCard({
    String? category,
    required String prompt,
    required String placeholder,
    required VoidCallback onNewPrompt,
    required VoidCallback onHowToWrite,
    required VoidCallback onClose,
  }) {
    final bool showCloseButton = (category ?? '').isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: ShapeDecoration(
              color: const Color(0xFFFFF5E0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if ((category ?? '').isNotEmpty) ...[
                  Text(
                    category ?? '',
                    style: const TextStyle(
                      color: Color(0xFF994E00),
                      fontSize: 12,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    prompt,
                    style: const TextStyle(
                      color: Color(0xFF60512C),
                      fontSize: 14,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF2E3D0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      placeholder,
                      style: const TextStyle(
                        color: Color(0xFF60512C),
                        fontSize: 16,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: onNewPrompt,
                        child: Container(
                          height: 36,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1,
                                color: Color(0xFFBE752B),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/new_prompt.png',
                                width: 14,
                                height: 14,
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                'New Prompt',
                                style: TextStyle(
                                  color: Color(0xFFBE752B),
                                  fontSize: 12,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: GestureDetector(
                        onTap: onHowToWrite,
                        child: Container(
                          height: 36,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1,
                                color: Color(0xFFBE752B),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/how-to-write-bubble.png',
                                width: 14,
                                height: 14,
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                'How to Write',
                                style: TextStyle(
                                  color: Color(0xFFBE752B),
                                  fontSize: 12,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (showCloseButton)
            Positioned(
              top: -8,
              right: -8,
              child: GestureDetector(
                onTap: onClose,
                child: Container(
                  width: 36,
                  height: 36,
                  child: Center(
                    child: Image.asset(
                      'assets/remove-gratitude-card.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 50,
      // padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              "assets/arrow-left.png",
              width: 24,
              height: 24,
            ),
          ),
          Expanded(
            child: Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  setState(() {
                    _showDateMenu = !_showDateMenu;
                    _showMoreMenu = false;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Today",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Outfit',
                            color: Color(0xFF372D17),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          DateFormat('dd MMM,yyyy').format(_selectedDate),
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Outfit',
                            color: Color(0xFF372D17),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 6),
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        "assets/dropDown.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _showMoreMenu = !_showMoreMenu;
                _showDateMenu = false;
              });
            },
            child: Image.asset(
              "assets/horizontal-dot.png",
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateMenu() {
    return Container(
      width: 190,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE9D1B5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFF5E0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _dateItem("Today", 0),
          _dateItem("Tomorrow", 1),
          _dateItem("Day Before", -1),
          _pickDateItem(),
        ],
      ),
    );
  }

  Widget _dateItem(String label, int offset) {
    final date = DateTime.now().add(Duration(days: offset));
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDate = date;
          _showDateMenu = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          "$label, ${DateFormat('dd MMM, yyyy').format(date)}",
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Outfit',
            color: Color(0xFF372D17),
          ),
        ),
      ),
    );
  }

  Widget _pickDateItem() {
    return GestureDetector(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: DateTime(2020),
          lastDate: DateTime(2035),
        );
        if (picked != null) {
          setState(() {
            _selectedDate = picked;
            _showDateMenu = false;
          });
        }
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 6),
        child: Text(
          "Pick a date",
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Outfit',
            color: Color(0xFF372D17),
          ),
        ),
      ),
    );
  }

  Widget _buildMoreMenu() {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE9D1B5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFF5E0)),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() => _showMoreMenu = false);
          _deleteEntry();
        },
        child: Row(
          children: [
            Image.asset("assets/delete.png", width: 16),
            const SizedBox(width: 8),
            const Text(
              "Delete Entry",
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Outfit',
                color: Color(0xFF372D17),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteEntry() {
    // Implement delete all entries logic or selected entry
  }
}



