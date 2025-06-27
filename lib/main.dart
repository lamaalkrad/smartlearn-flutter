import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'منصة تعليمية',
      theme: ThemeData(
        fontFamily: 'Cairo', // يمكنك تغيير الخط لاحقًا
        primarySwatch: Colors.indigo,
      ),
      home: const LoginScreen(),
    );
  }
}
