import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../widgets/primary_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flora Vision"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [

              const Spacer(),

              const Icon(
                Icons.local_florist,
                size: 140,
              ),

              const SizedBox(height: 30),

              const Text(
                AppStrings.identifyPlants,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                AppStrings.homeSubtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),

              const Spacer(),

              PrimaryButton(
                text: AppStrings.takePicture,
                onPressed: () {
                  context.push("/camera");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}