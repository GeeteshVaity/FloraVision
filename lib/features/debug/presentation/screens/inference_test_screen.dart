import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../models/prediction.dart';
import '../../../../services/plant_classifier.dart';

class InferenceTestScreen extends StatefulWidget {
  const InferenceTestScreen({
    super.key,
    required this.imageFile,
  });

  final File imageFile;

  @override
  State<InferenceTestScreen> createState() =>
      _InferenceTestScreenState();
}

class _InferenceTestScreenState
    extends State<InferenceTestScreen> {

  String status = "Waiting...";

  @override
  void initState() {
    super.initState();
    runInference();
  }

  Future<void> runInference() async {
    try {

      setState(() {
        status = "Running AI...";
      });

      final Prediction prediction =
          await PlantClassifier().classify(widget.imageFile);

      setState(() {
        status =
            "Prediction\n\n"
            "Plant : ${prediction.label}\n"
            "Confidence : ${prediction.confidence}";
      });

    } catch (e) {

      setState(() {
        status = e.toString();
      });

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Inference Test"),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            status,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}