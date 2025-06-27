import 'package:flutter/material.dart';

class TeacherHome extends StatelessWidget {
  const TeacherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('لوحة الأستاذ')),
      body: const Center(
        child: Text(
          'مرحباً أستاذ 👨‍🏫',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
