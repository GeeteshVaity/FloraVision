import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({
    super.key,
    required this.imageFile,
  });

  final File imageFile;

  static const Color backgroundColor = Color(0xFFF9F4EC);
  static const Color primaryOrange = Color(0xFFC96224);
  static const Color darkBrown = Color(0xFF38251D);
  static const Color textGrey = Color(0xFF756D65);
  static const Color borderColor = Color(0xFFD9D1C8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: primaryOrange,
            size: 30,
          ),
        ),

        title: const Text(
          "Preview",
          style: TextStyle(
            color: primaryOrange,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: "serif",
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            24,
            30,
            24,
            28,
          ),
          child: Column(
            children: [
              const Spacer(),

              // Selected flower image
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(
                  maxHeight: 500,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(
                        alpha: 0.08,
                      ),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: AspectRatio(
                    aspectRatio: 0.82,
                    child: Image.file(
                      imageFile,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Decorative quote
              const Text(
                "“Every petal tells a story of the sun.”",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.4,
                  fontStyle: FontStyle.italic,
                  color: textGrey,
                  fontFamily: "serif",
                ),
              ),

              const SizedBox(height: 12),

              // Scan label
              const Text(
                "BOTANICAL SCAN",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 3,
                  fontWeight: FontWeight.w500,
                  color: textGrey,
                ),
              ),

              const Spacer(),

              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 62,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(
                          Icons.refresh,
                          size: 25,
                        ),
                        label: const Text(
                          "RETAKE",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: darkBrown,
                          side: const BorderSide(
                            color: borderColor,
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: SizedBox(
                      height: 62,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          context.push(
                            "/loading",
                            extra: imageFile,
                          );
                        },
                        icon: const Icon(
                          Icons.check_circle_outline,
                          size: 24,
                        ),
                        label: const Text(
                          "ACCEPT",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryOrange,
                          foregroundColor: Colors.white,
                          elevation: 4,
                          shadowColor: Colors.black26,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}