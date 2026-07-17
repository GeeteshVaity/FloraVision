import 'package:flutter/services.dart';
import 'package:flutter_litert/flutter_litert.dart';

class ModelService {
  ModelService._();

  static final ModelService instance = ModelService._();

  Interpreter? _interpreter;
  List<String> _labels = [];

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  Interpreter get interpreter {
    if (_interpreter == null) {
      throw Exception("Model has not been loaded.");
    }
    return _interpreter!;
  }

  List<String> get labels => _labels;

  Future<void> load() async {
    if (_isLoaded) return;

    try {
      print("Loading AI Model...");

      _interpreter = await Interpreter.fromAsset(
        'assets/models/flower_model.tflite',
      );

      final labelString =
          await rootBundle.loadString(
            'assets/labels/labels.txt',
          );

      _labels = labelString
          .split('\n')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();

      _isLoaded = true;

      print("================================");
      print("Model Loaded Successfully");
      print("Labels Loaded : ${_labels.length}");
      print(_labels);
      print("================================");
    } catch (e) {
      print("Failed to load model.");
      print(e);
    }
  }
}