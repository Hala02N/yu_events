import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactPage(),
    ));

class ContactPage extends StatelessWidget {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Center(
              child: Text(
                "Contact",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF7E42), // Orange shade
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                "If you need help please contact these numbers",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Support Number Card
            ContactCard(
              icon: Icons.support_agent,
              title: "Support number",
              number: "+966547778823",
            ),

            const SizedBox(height: 20),

            // Technical Assistance Card
            ContactCard(
              icon: Icons.engineering,
              title: "Technical Assistance",
              number: "+966788893213",
            ),

            const Spacer(),

            // Illustration Image
            Center(
              child: Image.asset(
                'assets/images/contact.png', // Replace with your image path
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String number;

  const ContactCard({
    required this.icon,
    required this.title,
    required this.number,
  });

  // Function to make a call
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFFFF7E42), // Orange background color
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Icon
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              icon,
              color: Color(0xFFFF7E42), // Match the card background
            ),
          ),
          const SizedBox(width: 15),

          // Title and Number
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  number,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // Call Icon
          IconButton(
            icon: Icon(Icons.phone, color: Colors.blue),
            onPressed: () => _makePhoneCall(number), // Call the number
          ),
        ],
      ),
    );
  }
}
