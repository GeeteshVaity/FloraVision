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

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
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
          content: Text("Failed to classify plant.\n$e"),
        ),
      );

      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.search,
                size: 90,
              ),

              const SizedBox(height: 30),

              const Text(
                "Analyzing Plant...",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                "Running AI Model...",
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 40),

              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}