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
        title: const Text(
          "Identification Result",
          style: TextStyle(
            color: primaryOrange,
            fontSize: 27,
            fontWeight: FontWeight.bold,
            fontFamily: "serif",
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            24,
            30,
            24,
            35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Predicted flower image
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Image.file(
                      imageFile,
                      height: 340,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // AI Prediction badge
                  Positioned(
                    bottom: -27,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 34,
                        vertical: 13,
                      ),
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: const Color(0xFFD9D1C8),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(
                              alpha: 0.05,
                            ),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 11,
                            color: primaryOrange,
                          ),
                          SizedBox(width: 12),
                          Text(
                            "AI\nPREDICTION",
                            style: TextStyle(
                              color: primaryOrange,
                              fontSize: 14,
                              height: 1.25,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 70),

              // Actual AI prediction
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  prediction.label.toUpperCase(),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 52,
                    height: 1,
                    fontWeight: FontWeight.bold,
                    color: darkBrown,
                    fontFamily: "serif",
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Confidence card
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 26,
                ),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: borderColor,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: 0.025,
                      ),
                      blurRadius: 12,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Analytics icon
                    Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4E3D5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.analytics_outlined,
                        color: primaryOrange,
                        size: 31,
                      ),
                    ),

                    const SizedBox(width: 18),

                    // Confidence label
                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Confidence",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w600,
                              color: darkBrown,
                              fontFamily: "serif",
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "AI Model Prediction",
                            style: TextStyle(
                              fontSize: 14,
                              color: textGrey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Real confidence
                    Text(
                      "$confidencePercentage%",
                      style: const TextStyle(
                        fontSize: 31,
                        fontWeight: FontWeight.bold,
                        color: primaryOrange,
                        fontFamily: "serif",
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 55),

              // Only action button
              SizedBox(
                height: 62,
                child: ElevatedButton(
                  onPressed: () {
                    context.go("/home");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryOrange,
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shadowColor: Colors.black26,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Identify Another Plant",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}