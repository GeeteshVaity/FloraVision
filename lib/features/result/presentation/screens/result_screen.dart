import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../models/prediction.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.prediction,
    required this.imageFile,
  });

  final Prediction prediction;
  final File imageFile;

  static const Color backgroundColor = Color(0xFFF9F4EC);
  static const Color primaryOrange = Color(0xFFC96224);
  static const Color darkBrown = Color(0xFF38251D);
  static const Color textGrey = Color(0xFF756D65);
  static const Color cardColor = Color(0xFFFAF6F0);
  static const Color borderColor = Color(0xFFECE4DA);

  @override
  Widget build(BuildContext context) {
    final confidencePercentage =
        (prediction.confidence * 100).toStringAsFixed(1);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 40,
        title: const Text(
          "Identification Result",
          style: TextStyle(
            color: primaryOrange,
            fontSize: 20,
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
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Left: Image
                    Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          imageFile,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Right: Details
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              prediction.simplifiedName.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: darkBrown,
                                fontFamily: "serif",
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Confidence row
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: cardColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: borderColor),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.analytics_outlined, color: primaryOrange, size: 20),
                                const SizedBox(width: 8),
                                const Expanded(child: Text("Confidence", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
                                Text("$confidencePercentage%", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryOrange)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Fun Fact
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF9F0),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: const Color(0xFFFFEAD0)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Icon(Icons.lightbulb_outline, color: Color(0xFFE67E22), size: 18),
                                      SizedBox(width: 6),
                                      Text("Fun Fact", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFE67E22))),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Text(
                                        prediction.funFact,
                                        style: const TextStyle(fontSize: 13, fontStyle: FontStyle.italic),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () => context.go("/home"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryOrange,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              child: const Text("Identify Another", style: TextStyle(fontSize: 14)),
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Predicted flower image
                  Expanded(
                    flex: 4,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.file(
                              imageFile,
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // AI Prediction badge
                        Positioned(
                          bottom: -18,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color(0xFFD9D1C8),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.05),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 8,
                                  color: primaryOrange,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "AI PREDICTION",
                                  style: TextStyle(
                                    color: primaryOrange,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  // Actual AI prediction
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      prediction.simplifiedName.toUpperCase(),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 40,
                        height: 1,
                        fontWeight: FontWeight.bold,
                        color: darkBrown,
                        fontFamily: "serif",
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Info Section (Confidence & Fun Fact)
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        // Confidence Row
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: borderColor),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.analytics_outlined, color: primaryOrange, size: 24),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  "Confidence",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: darkBrown,
                                    fontFamily: "serif",
                                  ),
                                ),
                              ),
                              Text(
                                "$confidencePercentage%",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: primaryOrange,
                                  fontFamily: "serif",
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Fun Fact Card
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF9F0),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: const Color(0xFFFFEAD0)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Icon(Icons.lightbulb_outline, color: Color(0xFFE67E22), size: 20),
                                    SizedBox(width: 8),
                                    Text(
                                      "Fun Fact",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFE67E22),
                                        fontFamily: "serif",
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Text(
                                      prediction.funFact,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: darkBrown,
                                        height: 1.4,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Action button
                  SizedBox(
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () => context.go("/home"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryOrange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "Identify Another Plant",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}