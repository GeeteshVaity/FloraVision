# FloraVision 🌿

FloraVision is an advanced, AI-powered botanical identification app built with Flutter. It allows users to instantly identify over 100 species of flowers with a single snap, providing not just the name but also interesting fun facts to deepen their connection with nature.

## ✨ Features

- **Instant AI Identification**: Leverages Google LiteRT (TensorFlow Lite) to classify flowers in real-time with high accuracy.
- **100+ Species Supported**: Specifically tuned to recognize 102 different types of flowers.
- **User-Friendly Results**: Technical botanical labels are simplified into common names that everyone can understand.
- **Nature Education**: Every successful identification comes with a curated "Fun Fact" about the flower.
- **Responsive Design**: Optimized UI that fits perfectly on all mobile devices and adapts seamlessly to both Portrait and Landscape orientations.
- **Minimalist Aesthetic**: A warm, botanical-inspired design language featuring a "no-scroll" fixed UI for a premium app experience.

## 🚀 Tech Stack

- **Framework**: [Flutter](https://flutter.dev)
- **State Management**: [Riverpod](https://riverpod.dev)
- **Navigation**: [GoRouter](https://pub.dev/packages/go_router)
- **AI Engine**: [flutter_litert](https://pub.dev/packages/flutter_litert) (Google LiteRT)
- **Image Processing**: [image_picker](https://pub.dev/packages/image_picker) & [image](https://pub.dev/packages/image)
- **Animations**: [flutter_animate](https://pub.dev/packages/flutter_animate)

## 🛠️ Project Structure

```text
lib/
├── core/            # App-wide constants, themes, and routing
├── features/        # Feature-based modules (Camera, Result, Home, etc.)
│   └── [feature]/   # Presentation (screens/widgets) and logic
├── models/          # Data models for predictions and plants
├── services/        # AI model handling and data repositories
└── utils/           # Image preprocessing and helper functions
```

## 📦 Installation & Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/flora_vision.git
   cd flora_vision
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Asset Setup:**
   Ensure your AI model is placed in:
   `assets/models/flower_model.tflite`
   And your labels are in:
   `assets/labels/labels.txt`

4. **Run the application:**
   ```bash
   flutter run
   ```

## 🧠 AI Model Details

The app uses a quantized MobileNetV2-based transfer learning model trained on a diverse dataset of flowers. The input image is preprocessed to a $224 \times 224$ tensor and normalized before inference to ensure maximum classification stability.

## 🤝 Contributing

Contributions are welcome! Whether it's adding new flower data, improving the UI, or optimizing the AI pipeline, feel free to open a Pull Request.

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

---
*Developed with ❤️ for nature lovers.*
