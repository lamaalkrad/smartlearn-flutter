import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'teacher_home.dart';
import 'student_home.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final url =
        Uri.parse('http://192.168.1.101:8000/api/login'); // عدلي IP حسب جهازك

    try {
      final response = await http.post(
        url,
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final token = data['token'];
        final user = data['user']; // ممكن يكون null
        final role = data['role']; // نفترض السيرفر يرجع role

        debugPrint('✅ تسجيل دخول ناجح');
        debugPrint('🔑 التوكن: $token');
        debugPrint('🎭 الدور: $role');

        if (user != null) {
          if (user['status'] == 'approved') {
            debugPrint('👤 المستخدم: ${user['name']}');

            // التوجيه حسب الدور
            if (role == 'teacher' || role == 'أستاذ') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const TeacherHome()),
              );
            } else if (role == 'student' || role == 'طالب') {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const StudentHome()),
              );
            } else if (role == 'admin' || role == 'مشرف') {
              // لو عندك صفحة للأدمن، استبدلي هنا
              _showError('الدخول كأدمن غير مفعّل في التطبيق حالياً');
            } else {
              _showError('الدور غير معروف: $role');
            }
          } else {
            _showError(
                '🚫 لم تتم الموافقة على حسابك بعد. الرجاء انتظار موافقة الإدارة.');
          }
        } else {
          _showError('⚠️ لم يتم العثور على معلومات المستخدم');
        }
      } else {
        final error = json.decode(response.body);
        _showError(error['message'] ?? 'فشل تسجيل الدخول');
      }
    } catch (e) {
      _showError('تعذر الاتصال بالسيرفر: $e');
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('خطأ'),
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color mainBlue = Color(0xFF0F2D56);

    return Scaffold(
      backgroundColor: mainBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),

              // القبعة + اسم المنصة
              Column(
                children: const [
                  Icon(Icons.school, size: 100, color: Colors.white),
                  SizedBox(height: 12),
                  Text(
                    'SmartLearn',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // البريد الإلكتروني
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  controller: emailController,
                  decoration: _inputDecoration(
                    label: 'البريد الإلكتروني',
                    icon: Icons.email_outlined,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // كلمة المرور
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: _inputDecoration(
                    label: 'كلمة المرور',
                    icon: Icons.lock_outline,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // زر تسجيل الدخول
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: loginUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: mainBlue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'تسجيل الدخول',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // زر التسجيل
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RegisterScreen()),
                  );
                },
                child: const Text('Register'),
              ),

              const SizedBox(height: 20),

              // نسيت كلمة المرور
              TextButton(
                onPressed: () {},
                child: const Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyle(color: Colors.white70),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.grey[600]),
      filled: true,
      fillColor: Colors.white,
      labelStyle: const TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
    );
  }
}
