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
        child: OrientationBuilder(
          builder: (context, orientation) {
            final isLandscape = orientation == Orientation.landscape;
            
            if (isLandscape) {
              return Row(
                children: [
                  // Left side: Illustration
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  primaryOrange.withValues(alpha: 0.09),
                                  primaryOrange.withValues(alpha: 0.03),
                                  Colors.transparent,
                                ],
                                stops: const [0.0, 0.55, 1.0],
                              ),
                            ),
                          ),
                          Image.asset(
                            "assets/images/flower.png",
                            height: 180,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.local_florist, size: 80, color: primaryOrange);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Right side: Content
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "FloraVision",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: primaryOrange,
                              fontFamily: "serif",
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Identify species in a\nsingle glance.",
                            style: TextStyle(
                              fontSize: 28,
                              height: 1.1,
                              fontWeight: FontWeight.w500,
                              color: darkBrown,
                              fontFamily: "serif",
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Discover flowers instantly with AI identification.",
                            style: TextStyle(fontSize: 14, color: textGrey),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton.icon(
                              onPressed: () => context.push("/camera"),
                              icon: const Icon(Icons.camera_alt_outlined, size: 20),
                              label: const Text("Start Scanning", style: TextStyle(fontWeight: FontWeight.bold)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryOrange,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            return Column(
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
                      compact ? 8 : 12,
                      20,
                      compact ? 12 : 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Botanical Illustration
                        Expanded(
                          flex: 6,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Soft background glow
                              Container(
                                width: compact ? 200 : 260,
                                height: compact ? 200 : 260,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: RadialGradient(
                                    colors: [
                                      primaryOrange.withValues(alpha: 0.09),
                                      primaryOrange.withValues(alpha: 0.03),
                                      Colors.transparent,
                                    ],
                                    stops: const [0.0, 0.55, 1.0],
                                  ),
                                ),
                              ),
                              // Flower illustration
                              Image.asset(
                                "assets/images/flower.png",
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(
                                    Icons.local_florist,
                                    size: compact ? 80 : 100,
                                    color: primaryOrange,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: compact ? 8 : 14),

                        // Main Heading
                        Text(
                          "Identify species in a",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: compact ? 24 : 32,
                            height: 1.1,
                            fontWeight: FontWeight.w500,
                            color: darkBrown,
                            fontFamily: "serif",
                          ),
                        ),
                        Text(
                          "single glance.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: compact ? 28 : 37,
                            height: 1.05,
                            fontStyle: FontStyle.italic,
                            color: primaryOrange,
                            fontFamily: "serif",
                          ),
                        ),

                        SizedBox(height: compact ? 8 : 12),

                        // Description
                        Text(
                          "Discover flowers instantly with AI-powered identification. Simply snap a photo to recognize the bloom.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: compact ? 12 : 14,
                            height: 1.4,
                            color: textGrey,
                          ),
                        ),

                        const Spacer(flex: 1),

                        // Scan Button
                        SizedBox(
                          height: compact ? 50 : 56,
                          child: ElevatedButton.icon(
                            onPressed: () => context.push("/camera"),
                            icon: Icon(Icons.camera_alt_outlined, size: compact ? 18 : 22),
                            label: Text(
                              "Start Scanning",
                              style: TextStyle(
                                fontSize: compact ? 15 : 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryOrange,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}