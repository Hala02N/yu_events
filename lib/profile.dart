import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isChangePasswordExpanded = false;
  bool isLogoutExpanded = false;

  // Get the current user id
  final user = FirebaseAuth.instance.currentUser;
  // Retrieve user information from firestore
  late Future<DocumentSnapshot> userDoc;

  @override
  void initState() {
    super.initState();
    userDoc =
        FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFFDF3EB), // Background color as per design
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              const Center(
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF7E42), // Orange color for title
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Profile Information Section
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF7E42), // Orange container background
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                child: FutureBuilder<DocumentSnapshot>(
                  future: userDoc,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return const Text('Error loading user data');
                    }
                    if (!snapshot.hasData || !snapshot.data!.exists) {
                      return const Text('User data not found');
                    }
                    var userData =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor:
                              Colors.white, // White background for avatar
                          radius: 30,
                          child: Icon(Icons.person,
                              size: 40,
                              color: Color(0xFFFF7E42)), // Orange icon
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userData['username'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              // get the user email from firebase auth user
                              "Email: ${user!.email!}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black, // Black text
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Change Password Section
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF7E42), // Orange container background
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isChangePasswordExpanded = !isChangePasswordExpanded;
                        });
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.lock,
                              color: Colors.black), // Lock icon
                          const SizedBox(width: 15),
                          const Expanded(
                            child: Text(
                              "Change Password",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black, // Black text
                              ),
                            ),
                          ),
                          Icon(isChangePasswordExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                    if (isChangePasswordExpanded)
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Current Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                labelText: "New Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              decoration: InputDecoration(
                                labelText: "Confirm Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                // Handle change password logic
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.red, // Red confirm button
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text("Confirm",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Logout Section
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF7E42), // Orange container background
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isLogoutExpanded = !isLogoutExpanded;
                        });
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.logout,
                              color: Colors.black), // Logout icon
                          const SizedBox(width: 15),
                          const Expanded(
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black, // Black text
                              ),
                            ),
                          ),
                          Icon(isLogoutExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                    if (isLogoutExpanded)
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          children: [
                            const Text(
                              "Are you sure you want to log out?",
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                // Sign the user out
                                FirebaseAuth.instance.signOut();
                                // Navigate to the login screen
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Login()), // Replace with your homepage widget
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.red, // Red confirm button
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text("Confirm",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
