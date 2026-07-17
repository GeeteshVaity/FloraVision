import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const Color backgroundColor = Color(0xFFF9F4EC);
  static const Color darkBrown = Color(0xFF38251D);
  static const Color accentRed = Color(0xFFA43E3E);
  static const Color textGrey = Color(0xFF8B827B);
  static const Color subtleLine = Color(0xFFE8E0D7);

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 2),
      () {
        if (!mounted) return;

        context.go("/home");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Main centered content
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ==========================================
                  // APP LOGO PLACEHOLDER
                  // ==========================================
                  Container(
                    width: 155,
                    height: 155,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: backgroundColor,
                      border: Border.all(
                        color: subtleLine,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(
                            alpha: 0.025,
                          ),
                          blurRadius: 25,
                          spreadRadius: 3,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/flora_vision_logo.png",
                        width: 155,
                        height: 155,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 42),

                  // App name
                  const Text(
                    "FloraVision",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 44,
                      height: 1,
                      fontWeight: FontWeight.bold,
                      color: darkBrown,
                      fontFamily: "serif",
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Decorative separator
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 40,
                        child: Divider(
                          color: subtleLine,
                          thickness: 1,
                        ),
                      ),

                      SizedBox(width: 24),

                      CircleAvatar(
                        radius: 6,
                        backgroundColor: accentRed,
                      ),

                      SizedBox(width: 24),

                      SizedBox(
                        width: 40,
                        child: Divider(
                          color: subtleLine,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 38),

                  // Tagline
                  const Text(
                    "AI-powered botanical identification\n"
                    "in the palm of your hand.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.7,
                      color: textGrey,
                    ),
                  ),

                  const SizedBox(height: 80),

                  // Subtle loading indicator
                  SizedBox(
                    width: 75,
                    child: LinearProgressIndicator(
                      minHeight: 2,
                      backgroundColor: subtleLine,
                      color: accentRed.withValues(
                        alpha: 0.35,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              )
                  .animate()
                  .fade(
                    duration: 900.ms,
                  )
                  .slideY(
                    begin: 0.08,
                    end: 0,
                    duration: 900.ms,
                  ),
            ),

            // Bottom tagline
            const Positioned(
              left: 0,
              right: 0,
              bottom: 35,
              child: Text(
                "DISCOVER. IDENTIFY. BLOOM.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 3,
                  fontWeight: FontWeight.w500,
                  color: textGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}