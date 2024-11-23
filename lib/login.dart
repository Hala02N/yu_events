import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'forgotPassword.dart';
import 'layout.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  void loginUser() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Navigate to Home Page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const Layout()), // Replace with your homepage widget
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE2DA),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              "Your one place for all YU events",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 350,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
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
                controller: passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
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
              onPressed: loginUser,
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
      ),
    );
  }
}
