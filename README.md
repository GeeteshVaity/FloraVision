# 🌸 FloraVision - Offline AI Flower Identifier

FloraVision is an AI-powered Flutter application that identifies flowers using an embedded TensorFlow Lite model. The app works entirely offline by performing on-device image classification, allowing users to instantly recognize flowers without requiring an internet connection.

Users simply capture a flower using their device's camera, and the application processes the image locally to identify the flower species, display the prediction confidence, and provide additional botanical information.

---

## 📱 Features

- 📷 Capture flower images using the device camera
- 🤖 Offline flower recognition using TensorFlow Lite
- 🌸 Identifies flower species instantly
- 📊 Displays prediction confidence
- 🌿 Shows scientific name and flower description
- ⚡ Fast on-device AI inference
- 🔒 100% Offline – No internet or cloud APIs required
- 🎨 Clean Material 3 user interface

---

## 📸 App Flow

Home Screen

⬇️

Camera Screen

⬇️

Capture Flower Image

⬇️

Preview Screen

⬇️

AI Analysis (TensorFlow Lite)

⬇️

Result Screen

---

## 🧠 AI Model

The application uses an embedded TensorFlow Lite image classification model trained to recognize the following flower categories:

- 🌼 Daisy
- 🌼 Dandelion
- 🌹 Rose
- 🌻 Sunflower
- 🌷 Tulip

### Model Details

- Framework: TensorFlow Lite
- Input Size: **224 × 224 × 3**
- Inference: Fully Offline
- Output: Flower Class + Confidence Score

---

## 🛠 Tech Stack

### Framework

- Flutter

### Language

- Dart

### Machine Learning

- TensorFlow Lite

### Packages

- camera
- tflite_flutter
- image

### UI

- Material 3

---

## 📂 Project Structure

```
lib/
│
├── app.dart
├── main.dart
│
├── features/
│   ├── home/
│   ├── camera/
│   ├── preview/
│   └── result/
│
├── services/
│   ├── camera_service.dart
│   ├── image_processor.dart
│   ├── tflite_service.dart
│   └── flower_info.dart
│
├── widgets/
│
assets/
│
├── models/
│   └── flower_model.tflite
│
└── labels/
    └── labels.txt
```

---

## 🚀 Getting Started

### Clone Repository

```bash
git clone https://github.com/yourusername/floravision.git
```

### Navigate to Project

```bash
cd floravision
```

### Install Dependencies

```bash
flutter pub get
```

### Run Application

```bash
flutter run
```

---

## 📦 Dependencies

```yaml
camera:
tflite_flutter:
image:
```

---

## 📸 Screens

- Home Screen
- Camera Screen
- Preview Screen
- Result Screen

---

## 🔍 How It Works

1. User opens the application.
2. Camera captures a flower image.
3. The image is resized and preprocessed.
4. TensorFlow Lite loads the embedded model.
5. The model performs on-device inference.
6. The highest confidence prediction is selected.
7. The application displays:
   - Flower Name
   - Confidence Score
   - Scientific Name
   - Flower Description

---

## 🎯 Future Improvements

- Support 100+ flower species
- Gallery image selection
- Plant disease detection
- Save scan history
- Favorite flowers
- Offline flower encyclopedia
- Multi-language support
- Dark mode
- Plant care recommendations
- AI confidence visualization

---
