class Prediction {
  final String label;
  final String simplifiedName;
  final String funFact;
  final double confidence;

  const Prediction({
    required this.label,
    required this.simplifiedName,
    required this.funFact,
    required this.confidence,
  });
}
