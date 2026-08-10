import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_litert/flutter_litert.dart';

import '../models/prediction.dart';
import '../utils/image_preprocessor.dart';
import 'flower_data.dart';
import 'model_service.dart';

class PlantClassifier {   
  Future<Prediction> classify(File imageFile) async {
    debugPrint("Starting Classification...");

    // Convert image to tensor
    final input = await ImagePreprocessor.process(imageFile);

    // Get interpreter
    final Interpreter interpreter = ModelService.instance.interpreter;

    // Create output tensor
    final output = List.generate(
      1,
      (_) => List.filled(
        ModelService.instance.labels.length,
        0.0,
      ),
    );

    // Run inference
    interpreter.run(input, output);

    debugPrint("Raw Output: $output");

    // Find highest confidence
    int bestIndex = 0;
    double bestScore = output[0][0];

    for (int i = 1; i < output[0].length; i++) {
      if (output[0][i] > bestScore) {
        bestScore = output[0][i];
        bestIndex = i;
      }
    }

    final label = ModelService.instance.labels[bestIndex];
    final flowerInfo = FlowerData.flowers[label];

    final prediction = Prediction(
      label: label,
      simplifiedName: flowerInfo?.simplifiedName ?? label,
      funFact: flowerInfo?.funFact ?? "No fun fact available for this flower.",
      confidence: bestScore,
    );

    debugPrint(
      "Prediction : ${prediction.simplifiedName} (${prediction.confidence})",
    );

    return prediction;
  }
}
