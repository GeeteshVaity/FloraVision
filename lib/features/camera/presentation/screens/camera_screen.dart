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
      appBar: AppBar(
        title: const Text("Identify Flower"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),

              // Main illustration
              Container(
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.local_florist,
                  size: 90,
                  color: Colors.green.shade700,
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                "Identify a Flower",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                "Take a clear photo of a flower or choose an existing image from your gallery.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.grey.shade700,
                ),
              ),

              const Spacer(),

              // Take photo
              SizedBox(
                height: 58,
                child: ElevatedButton.icon(
                  onPressed: _isPickingImage
                      ? null
                      : () => _pickImage(
                            ImageSource.camera,
                          ),
                  icon: const Icon(
                    Icons.camera_alt,
                    size: 24,
                  ),
                  label: const Text(
                    "Take Photo",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Gallery
              SizedBox(
                height: 58,
                child: OutlinedButton.icon(
                  onPressed: _isPickingImage
                      ? null
                      : () => _pickImage(
                            ImageSource.gallery,
                          ),
                  icon: const Icon(
                    Icons.photo_library_outlined,
                    size: 24,
                  ),
                  label: const Text(
                    "Choose from Gallery",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              if (_isPickingImage) ...[
                const SizedBox(height: 24),
                const Center(
                  child: CircularProgressIndicator(),
                ),
              ],

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}