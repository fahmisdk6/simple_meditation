import 'package:flutter/material.dart';
import 'widgets/breathing_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMeditationStarted = false;

  void _toggleMeditation() {
    setState(() {
      isMeditationStarted = !isMeditationStarted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: const Icon(Icons.close, color: Colors.orange, size: 24),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Center(
        child: BreathingButton(
          onPressed: _toggleMeditation,
          isActive: isMeditationStarted,
        ),
      ),
    );
  }
}
