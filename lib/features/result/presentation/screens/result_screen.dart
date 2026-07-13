import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  Widget buildInfoTile(
      String title,
      String value,
      IconData icon,
      ) {
    return Card(
      elevation: 1,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Plant Details"),
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(20),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [

              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Icon(
                    Icons.local_florist,
                    size: 120,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Center(
                child: Text(
                  "Rose",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              const Center(
                child: Text(
                  "Rosa rubiginosa",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              buildInfoTile(
                "Confidence",
                "96%",
                Icons.analytics,
              ),

              buildInfoTile(
                "Description",
                "A flowering shrub belonging to the rose family.",
                Icons.description,
              ),

              buildInfoTile(
                "Water",
                "Medium",
                Icons.water_drop,
              ),

              buildInfoTile(
                "Sunlight",
                "Full Sun",
                Icons.wb_sunny,
              ),

              buildInfoTile(
                "Difficulty",
                "Easy",
                Icons.star,
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {

                  context.go("/home");

                },
                child: const Text(
                  "Identify Another Plant",
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}