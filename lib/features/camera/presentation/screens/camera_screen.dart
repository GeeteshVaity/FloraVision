import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ImagePicker _picker = ImagePicker();

  bool _isPickingImage = false;

  static const Color backgroundColor = Color(0xFFF9F4EC);
  static const Color primaryOrange = Color(0xFFC96224);
  static const Color darkBrown = Color(0xFF38251D);
  static const Color textGrey = Color(0xFF756D65);
  static const Color borderColor = Color(0xFFE4DDD4);

  Future<void> _pickImage(ImageSource source) async {
    final supportedPlatform = !kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS);

    if (!supportedPlatform) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Image selection is available only on Android and iOS.",
          ),
        ),
      );
      return;
    }

    if (_isPickingImage) return;

    setState(() {
      _isPickingImage = true;
    });

    try {
      final XFile? pickedImage = await _picker.pickImage(
        source: source,
        imageQuality: 90,
      );

      if (pickedImage == null || !mounted) {
        return;
      }

      final File imageFile = File(pickedImage.path);

      context.push(
        "/preview",
        extra: imageFile,
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Failed to select image.\n$e",
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isPickingImage = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Identify Flower",
          style: TextStyle(
            color: primaryOrange,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            fontFamily: "serif",
          ),
        ),
      ),

      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            final isLandscape = orientation == Orientation.landscape;

            if (isLandscape) {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.06),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.local_florist_outlined, size: 60, color: primaryOrange),
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            "Identify a Flower",
                            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: darkBrown, fontFamily: "serif"),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Take a photo or choose an image to identify.",
                            style: TextStyle(fontSize: 14, color: textGrey),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton.icon(
                              onPressed: _isPickingImage ? null : () => _pickImage(ImageSource.camera),
                              icon: const Icon(Icons.camera_alt_outlined, size: 20),
                              label: const Text("Take Photo", style: TextStyle(fontWeight: FontWeight.w600)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryOrange,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 50,
                            child: OutlinedButton.icon(
                              onPressed: _isPickingImage ? null : () => _pickImage(ImageSource.gallery),
                              icon: const Icon(Icons.photo_library_outlined, size: 20),
                              label: const Text("Choose from Gallery", style: TextStyle(fontWeight: FontWeight.w500)),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: primaryOrange,
                                side: const BorderSide(color: borderColor, width: 2),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(flex: 1),
                  // Flower illustration circle
                  Center(
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.local_florist_outlined,
                        size: 60,
                        color: primaryOrange,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Heading
                  const Text(
                    "Identify a Flower",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      height: 1.1,
                      fontWeight: FontWeight.w600,
                      color: darkBrown,
                      fontFamily: "serif",
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Description
                  const Text(
                    "Take a photo or choose\nan image to identify.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.4,
                      color: textGrey,
                    ),
                  ),

                  const Spacer(flex: 2),

                  // Action Buttons
                  Column(
                    children: [
                      // Take Photo button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton.icon(
                          onPressed: _isPickingImage
                              ? null
                              : () => _pickImage(ImageSource.camera),
                          icon: const Icon(Icons.camera_alt_outlined, size: 22),
                          label: const Text(
                            "Take Photo",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryOrange,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14)),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Gallery button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: OutlinedButton.icon(
                          onPressed: _isPickingImage
                              ? null
                              : () => _pickImage(ImageSource.gallery),
                          icon: const Icon(Icons.photo_library_outlined, size: 22),
                          label: const Text(
                            "Choose from Gallery",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: primaryOrange,
                            side:
                                const BorderSide(color: borderColor, width: 2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14)),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Loading indicator
                  if (_isPickingImage) ...[
                    const SizedBox(height: 16),
                    const Center(
                      child: CircularProgressIndicator(color: primaryOrange),
                    ),
                  ],
                  const Spacer(flex: 1),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
