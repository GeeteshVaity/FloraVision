import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key, this.imageBytes});

  final Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preview"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: imageBytes == null
                        ? const Center(
                            child: Icon(
                              Icons.image,
                              size: 100,
                              color: Colors.grey,
                            ),
                          )
                        : Image.memory(
                            imageBytes!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Row(
                children: [

                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text("Retake"),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.push("/loading");
                      },
                      child: const Text("Accept"),
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}