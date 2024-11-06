import 'package:flutter/material.dart';
import 'dart:math';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<String> imagePaths = [
    'assets/image1.jpeg',
    'assets/image2.jpeg',
    'assets/image3.jpeg',
    'assets/image4.jpeg',
  ];

  String? currentImagePath;
  final TextEditingController _promptController = TextEditingController();

  void generateImageBasedOnPrompt() {
    String prompt = _promptController.text.toLowerCase();
    setState(() {
      if (prompt.contains("lighthouse")) {
        currentImagePath = imagePaths[0];
      } else if (prompt.contains("mountain")) {
        currentImagePath = imagePaths[1];
      } else if (prompt.contains("beach")) {
        currentImagePath = imagePaths[2];
      } else if (prompt.contains("dog")) {
        currentImagePath = imagePaths[3];
      } else {
        currentImagePath = imagePaths[Random().nextInt(imagePaths.length)];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AI Image Generator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal[400],
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal[100]!, Colors.blue[50]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _promptController,
                decoration: InputDecoration(
                  labelText: 'Enter your prompt (e.g., "Lighthouse")',
                  labelStyle: TextStyle(color: Colors.teal[800]),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: generateImageBasedOnPrompt,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
                  backgroundColor: Colors.teal[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadowColor: Colors.black45,
                  elevation: 5,
                ),
                child: const Text(
                  'Generate Image',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20),
              if (currentImagePath != null)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      currentImagePath!,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
