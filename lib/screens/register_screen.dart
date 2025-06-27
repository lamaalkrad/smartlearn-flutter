import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const Color mainBlue = Color(0xFF0F2D56);

    return Scaffold(
      backgroundColor: mainBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 40),

                // الأيقونة والعنوان
                Column(
                  children: const [
                    Icon(Icons.school, size: 100, color: Colors.white),
                    SizedBox(height: 12),
                    Text(
                      'إنشاء حساب جديد',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // الحقول
                _buildTextField(
                    controller: firstNameController,
                    label: 'الاسم الأول',
                    icon: Icons.person),
                const SizedBox(height: 16),
                _buildTextField(
                    controller: lastNameController,
                    label: 'الاسم الأخير',
                    icon: Icons.person_outline),
                const SizedBox(height: 16),
                _buildTextField(
                    controller: addressController,
                    label: 'العنوان',
                    icon: Icons.home),
                const SizedBox(height: 16),
                _buildTextField(
                    controller: phoneController,
                    label: 'رقم الهاتف',
                    icon: Icons.phone),
                const SizedBox(height: 16),
                _buildTextField(
                    controller: emailController,
                    label: 'البريد الإلكتروني',
                    icon: Icons.email),
                const SizedBox(height: 16),
                _buildTextField(
                    controller: passwordController,
                    label: 'كلمة المرور',
                    icon: Icons.lock,
                    obscure: true),

                const SizedBox(height: 30),

                // زر التسجيل
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: mainBlue,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      // TODO: ربط API هنا
                    },
                    child: const Text(
                      'تسجيل',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // زر العودة لتسجيل الدخول
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'لديك حساب؟ سجل الدخول',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey[600]),
        filled: true,
        fillColor: Colors.white,
        labelStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
