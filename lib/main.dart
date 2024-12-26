// ignore_for_file: library_private_types_in_public_api

import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ColorChanger(),
    );
  }
}

class ColorChanger extends StatefulWidget {
  const ColorChanger({super.key});

  @override
  _ColorChangerState createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  Color _currentColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    debugPrint("initState called: Initializing the color.");
    _currentColor = Colors.blue; // Initial color
  }

  void _changeColor() {
    setState(() {
      // Generate a random color
      _currentColor = Color(Random().nextInt(0xffffffff));
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build called: Rebuilding the UI.");
    return Scaffold(
      appBar: AppBar(title: const Text("Color Changer App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              color: _currentColor,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeColor,
              child: const Text("Change Color"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    debugPrint("dispose called: Cleaning up resources.");
    super.dispose();
  }
}
