import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ForgotPasswordScreen(),
    );
  }
}

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordScreen> {
  // TextEditingController for the email input field
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    // Dispose the controller to free up resources
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF3EB), // Light beige background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // mainAxisAlignment:
          // MainAxisAlignment.center, // Center content vertically
          //crossAxisAlignment:CrossAxisAlignment.center, // Center content horizontally
          children: [
            Image.asset(
              'assets/images/logo.png', // Replace with your logo image path
              height: 130,
            ),

            const SizedBox(height: 150),

            // Forgot Password Text
            Center(
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF7E42), // Orange shade
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Email TextField
            TextField(
              controller: emailController, // Use the correct controller here
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFF7E42),
                  ),
                  borderRadius: BorderRadius.circular(30), // Rounder corners
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFF7E42),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30), // Rounder corners
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Send Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Access the email value using emailController.text
                  final email = emailController.text;
                  if (email.isNotEmpty) {
                    print('Sending password reset to: $email');
                  } else {
                    print('Email field is empty');
                  }
                },
                icon: Icon(Icons.email, color: Colors.black),
                label: Text(
                  'Send',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF7E42), // Orange button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  elevation: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
