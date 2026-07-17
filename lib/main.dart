import 'package:flutter/material.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'services/model_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load AI model before starting the app
  await ModelService.instance.load();

  runApp(const FloraVisionApp());
}

class FloraVisionApp extends StatelessWidget {
  const FloraVisionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Flora Vision",
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}