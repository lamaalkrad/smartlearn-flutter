import 'package:flutter/material.dart';

class StudentHome extends StatelessWidget {
  const StudentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('لوحة الطالب')),
      body: const Center(
        child: Text(
          'مرحباً طالب 🎓',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
