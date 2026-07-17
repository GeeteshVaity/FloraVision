import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color backgroundColor = Color(0xFFF9F4EC);
  static const Color primaryOrange = Color(0xFFC96224);
  static const Color darkBrown = Color(0xFF38251D);
  static const Color textGrey = Color(0xFF6F675F);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final compact = height < 750;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "FloraVision",
                  style: TextStyle(
                    fontSize: compact ? 26 : 30,
                    fontWeight: FontWeight.bold,
                    color: primaryOrange,
                    fontFamily: "serif",
                  ),
                ),
              ),
            ),

            Divider(
              height: 1,
              thickness: 0.5,
              color: darkBrown.withValues(
                alpha: 0.12,
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  20,
                  compact ? 10 : 16,
                  20,
                  20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Botanical Illustration
                    // Transparent flower integrated directly
                    // into the app background.
                    Expanded(
                      flex: 5,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Soft background glow
                          Container(
                            width: compact ? 230 : 280,
                            height: compact ? 230 : 280,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  primaryOrange.withValues(
                                    alpha: 0.09,
                                  ),
                                  primaryOrange.withValues(
                                    alpha: 0.03,
                                  ),
                                  Colors.transparent,
                                ],
                                stops: const [
                                  0.0,
                                  0.55,
                                  1.0,
                                ],
                              ),
                            ),
                          ),

                          // Flower illustration
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: compact ? 4 : 8,
                            ),
                            child: Image.asset(
                              "assets/images/flower.png",
                              fit: BoxFit.contain,
                              errorBuilder: (
                                context,
                                error,
                                stackTrace,
                              ) {
                                return const Center(
                                  child: Icon(
                                    Icons.local_florist,
                                    size: 100,
                                    color: primaryOrange,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: compact ? 10 : 18,
                    ),

                    // Main Heading
                    Text(
                      "Identify species in a",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: compact ? 28 : 32,
                        height: 1.1,
                        fontWeight: FontWeight.w500,
                        color: darkBrown,
                        fontFamily: "serif",
                      ),
                    ),

                    const SizedBox(height: 3),

                    // Highlight Heading
                    Text(
                      "single glance.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: compact ? 32 : 37,
                        height: 1.05,
                        fontStyle: FontStyle.italic,
                        color: primaryOrange,
                        fontFamily: "serif",
                      ),
                    ),

                    SizedBox(
                      height: compact ? 10 : 16,
                    ),

                    // Description
                    Text(
                      "Discover flowers instantly with AI-powered identification. "
                      "Simply snap a photo and let FloraVision recognize the bloom.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: compact ? 13 : 14,
                        height: 1.5,
                        color: textGrey,
                      ),
                    ),

                    SizedBox(
                      height: compact ? 16 : 22,
                    ),

                    // Scan Button
                    SizedBox(
                      height: compact ? 52 : 56,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          context.push("/camera");
                        },
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          size: compact ? 20 : 22,
                        ),
                        label: Text(
                          "Start Scanning",
                          style: TextStyle(
                            fontSize: compact ? 16 : 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryOrange,
                          foregroundColor: Colors.white,
                          elevation: 3,
                          shadowColor: primaryOrange.withValues(
                            alpha: 0.25,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
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
    );
  }
}