import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Import secure storage
import 'dart:convert';
import '../home/homePage.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  // Create an instance of FlutterSecureStorage
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<void> loginUser(BuildContext context, String email, String password) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['token'];

      // Store token securely
      await secureStorage.write(key: 'auth_token', value: token);

      // Navigate to home page or dashboard
      Navigator.pushNamed(context, HomePage.name);
    } else {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed please enter correct email or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: 'E-Mail',
                hintText: '123@example.com',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint),
                labelText: 'Password',
                hintText: '12345',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  loginUser(context, emailController.text, passwordController.text);
                },
                child: Text('Login'.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
