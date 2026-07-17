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

  @override
  Widget build(BuildContext context) {
    final confidencePercentage =
        (prediction.confidence * 100).toStringAsFixed(1);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Identification Result"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // Original flower image
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.file(
                  imageFile,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "AI Prediction",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                prediction.label.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Card(
                child: ListTile(
                  leading: const Icon(
                    Icons.analytics,
                  ),
                  title: const Text("Confidence"),
                  subtitle: Text(
                    "$confidencePercentage%",
                  ),
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  context.go("/home");
                },
                child: const Text(
                  "Identify Another Plant",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}