import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/camera/presentation/screens/camera_screen.dart';
import '../../features/preview/presentation/screens/preview_screen.dart';
import '../../features/loading/presentation/screens/loading_screen.dart';
import '../../features/result/presentation/screens/result_screen.dart';


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
      builder: (context, state) => const PreviewScreen(),
    ),

    GoRoute(
      path: "/loading",
      builder: (context, state) => const LoadingScreen(),
    ),

    GoRoute(
      path: "/result",
      builder: (context, state) => const ResultScreen(),
    ),
  ],
);