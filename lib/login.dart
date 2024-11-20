import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'forgotPassword.dart';

void main() => runApp(const MaterialApp(
      home: Login(),
    ));

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usrenamecontrolar = TextEditingController();
  final passwordcontrolar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE2DA),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Image.asset('assets/images/logo.png'),
          const SizedBox(height: 30),
          const Text(
            "Log In ",
            style: TextStyle(
              color: Color(0xFFF68939),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Log in to your account and rest",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 350,
            child: TextField(
              controller: usrenamecontrolar,
              decoration: InputDecoration(
                labelText: "Username",
                labelStyle: const TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Color(0xFFF68939),
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Color(0xFFF68939),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 350,
            child: TextField(
              controller: passwordcontrolar,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: const TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Color(0xFFF68939),
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    color: Color(0xFFF68939),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF68939),
              padding:
                  const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
            ),
            child: const Text(
              "Log in",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ForgotPasswordScreen(), // Navigate to ForgotPassword page
                ),
              );
            },
            child: const Text(
              "Forgot my password",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
