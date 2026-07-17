import 'dart:io';

import 'package:go_router/go_router.dart';

import '../../features/camera/presentation/screens/camera_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/loading/presentation/screens/loading_screen.dart';
import '../../features/preview/presentation/screens/preview_screen.dart';
import '../../features/result/presentation/screens/result_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/debug/presentation/screens/inference_test_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashScreen(),
    ),

    GoRoute(
      path: "/home",
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: "/camera",
      builder: (context, state) => const CameraScreen(),
    ),

    GoRoute(
      path: "/preview",
      builder: (context, state) {
        final imageFile = state.extra as File;

        return PreviewScreen(
          imageFile: imageFile,
        );
      },
    ),

    GoRoute(
  path: "/debug",
  builder: (context, state) {

      final imageFile = state.extra as File;

      return InferenceTestScreen(
        imageFile: imageFile,
      );
    },
  ),

    GoRoute(
      path: "/loading",
      builder: (context, state) {
        final imageFile = state.extra as File;

        return LoadingScreen(
          imageFile: imageFile,
        );
      },
    ),

    GoRoute(
      path: "/result",
      builder: (context, state) => const ResultScreen(),
    ),
  ],
);