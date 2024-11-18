import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'forgotPassword.dart';

void main() => runApp(MaterialApp(
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
      backgroundColor: Color(0xFFEDE2DA),
      body: Column(
        children: [
          SizedBox(height: 30),
          Image.asset('assets/images/logo.png'),
          SizedBox(height: 30),
          Text(
            "Log In ",
            style: TextStyle(
              color: const Color(0xFFF68939),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Log in to your account and rest",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: 350,
            child: TextField(
              controller: usrenamecontrolar,
              decoration: InputDecoration(
                labelText: "Username",
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Color(0xFFF68939),
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Color(0xFFF68939),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: 350,
            child: TextField(
              controller: passwordcontrolar,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Color(0xFFF68939),
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Color(0xFFF68939),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFF68939),
              padding: EdgeInsets.symmetric(horizontal: 150, vertical: 15),
            ),
            child: Text(
              "Log in",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 5),
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
            child: Text(
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
