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
        child: OrientationBuilder(
          builder: (context, orientation) {
            final isLandscape = orientation == Orientation.landscape;

            if (isLandscape) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            RotationTransition(
                              turns: _animationController,
                              child: Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: primaryOrange.withValues(alpha: 0.20), width: 2),
                                ),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(width: 6, height: 6, decoration: const BoxDecoration(color: primaryOrange, shape: BoxShape.circle)),
                                ),
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 120,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: backgroundColor,
                                border: Border.all(color: subtleLine),
                              ),
                              child: ClipOval(child: Image.file(widget.imageFile, fit: BoxFit.cover)),
                            ),
                          ],
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
                            "Analyzing bloom...",
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: darkBrown, fontFamily: "serif"),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Our AI is studying the unique details.",
                            style: TextStyle(fontSize: 14, color: textGrey),
                          ),
                          const SizedBox(height: 24),
                          const LinearProgressIndicator(color: primaryOrange, backgroundColor: subtleLine),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Column(
                children: [
                  const Spacer(flex: 1),
                  // Image being analyzed
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outer animated ring
                      RotationTransition(
                        turns: _animationController,
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: primaryOrange.withValues(alpha: 0.20),
                              width: 2,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                  color: primaryOrange, shape: BoxShape.circle),
                            ),
                          ),
                        ),
                      ),
                      // Inner image
                      Container(
                        width: 150,
                        height: 150,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: backgroundColor,
                          border: Border.all(color: subtleLine),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.file(
                            widget.imageFile,
                            width: 140,
                            height: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Main title
                  const Text(
                    "Analyzing your bloom",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      height: 1.1,
                      fontWeight: FontWeight.w600,
                      color: darkBrown,
                      fontFamily: "serif",
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Subtitle
                  const Text(
                    "Our AI is studying the unique\ndetails of your flower.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, height: 1.4, color: textGrey),
                  ),

                  const Spacer(flex: 1),

                  // Decorative loading indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 40, height: 1, color: subtleLine),
                      const SizedBox(width: 16),
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: primaryOrange),
                      ),
                      const SizedBox(width: 16),
                      Container(width: 40, height: 1, color: subtleLine),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "AI IDENTIFICATION IN PROGRESS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w500,
                      color: textGrey,
                    ),
                  ),
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
