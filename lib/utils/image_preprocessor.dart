import 'dart:io';

import 'package:image/image.dart' as img;

class ImagePreprocessor {
  static Future<List<List<List<List<double>>>>> process(
    File imageFile,
  ) async {

    // Read image bytes
    final bytes = await imageFile.readAsBytes();

    // Decode image
    img.Image? image = img.decodeImage(bytes);

    if (image == null) {
      throw Exception("Unable to decode image.");
    }

    // Resize image
    image = img.copyResize(
      image,
      width: 224,
      height: 224,
    );

    // Create input tensor
    final input = List.generate(
      1,
      (_) => List.generate(
        224,
        (y) => List.generate(
          224,
          (x) {
            final pixel = image!.getPixel(x, y);

            return [
              pixel.r.toDouble(),
              pixel.g.toDouble(),
              pixel.b.toDouble(),
            ];
          },
        ),
      ),
    );

    return input;
  }
}