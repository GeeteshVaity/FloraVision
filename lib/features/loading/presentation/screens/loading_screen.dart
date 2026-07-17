import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../models/prediction.dart';
import '../../../../services/plant_classifier.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({
    super.key,
    required this.imageFile,
  });

  final File imageFile;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  static const Color backgroundColor = Color(0xFFF9F4EC);
  static const Color primaryOrange = Color(0xFFC96224);
  static const Color darkBrown = Color(0xFF38251D);
  static const Color textGrey = Color(0xFF8B827B);
  static const Color subtleLine = Color(0xFFE8E0D7);

  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _classifyPlant();
  }

  Future<void> _classifyPlant() async {
    try {
      final Prediction prediction =
          await PlantClassifier().classify(widget.imageFile);

      if (!mounted) return;

      context.go(
        "/result",
        extra: {
          "prediction": prediction,
          "imageFile": widget.imageFile,
        },
      );
    } catch (e) {
      debugPrint("Classification Error: $e");

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Failed to classify plant.\n$e",
          ),
        ),
      );

      context.pop();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Image being analyzed
              Stack(
                alignment: Alignment.center,
                children: [
                  // Outer animated ring
                  RotationTransition(
                    turns: _animationController,
                    child: Container(
                      width: 230,
                      height: 230,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: primaryOrange.withValues(
                            alpha: 0.20,
                          ),
                          width: 2,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: primaryOrange,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Inner image
                  Container(
                    width: 195,
                    height: 195,
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: backgroundColor,
                      border: Border.all(
                        color: subtleLine,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(
                            alpha: 0.06,
                          ),
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.file(
                        widget.imageFile,
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // AI scan icon
                  Positioned(
                    bottom: 5,
                    right: 15,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: primaryOrange,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: backgroundColor,
                          width: 4,
                        ),
                      ),
                      child: const Icon(
                        Icons.auto_awesome,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),

              // Main title
              const Text(
                "Analyzing your bloom",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  height: 1.1,
                  fontWeight: FontWeight.w600,
                  color: darkBrown,
                  fontFamily: "serif",
                ),
              ),

              const SizedBox(height: 18),

              // Subtitle
              const Text(
                "Our AI is studying the unique details\n"
                "of your flower.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  height: 1.6,
                  color: textGrey,
                ),
              ),

              const SizedBox(height: 45),

              // Decorative loading indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 45,
                    height: 1,
                    color: subtleLine,
                  ),

                  const SizedBox(width: 18),

                  const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: primaryOrange,
                    ),
                  ),

                  const SizedBox(width: 18),

                  Container(
                    width: 45,
                    height: 1,
                    color: subtleLine,
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const Text(
                "AI IDENTIFICATION IN PROGRESS",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 2.2,
                  fontWeight: FontWeight.w500,
                  color: textGrey,
                ),
              ),

              const Spacer(flex: 3),

              // Bottom message
              const Text(
                "DISCOVERING NATURE'S DETAILS",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.w500,
                  color: textGrey,
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}