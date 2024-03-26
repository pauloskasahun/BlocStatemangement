import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
              
              },
              icon: const Icon(Icons.login))
        ],
      ),
      backgroundColor: Colors.red,
    );
  }
}
