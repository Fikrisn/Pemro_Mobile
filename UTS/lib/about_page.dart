import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Page'),
      ),
      body: const Center( // Using const here for optimization
        child: SingleChildScrollView( // Using const here for optimization
          child: AboutContent(), // Using AboutContent widget
        ),
      ),
    );
  }
}

class AboutContent extends StatelessWidget {
  const AboutContent({super.key}); // Constructor marked as const

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Logo
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Image.asset(
            'assets/images/logo.png', // Replace with your logo path
            height: 100, // Adjust logo height as needed
          ),
        ),
        // Text in a box
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'This application is designed to provide users with an intuitive platform '
                'for managing their profiles. It allows users to view and update their '
                'personal information seamlessly. With a clean and elegant design, the app '
                'ensures a user-friendly experience while navigating through various features.\n\n'
                'In addition to profile management, the application emphasizes the use of '
                'modern design principles and best practices in Flutter development. Users '
                'can easily navigate through the app, ensuring that they have all the '
                'necessary tools at their fingertips.\n\n'
                'We hope this application enhances your productivity and serves as a valuable '
                'tool for managing your personal information effectively.\n\n'
                '© 2024 Your Company Name. All rights reserved.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16), // Ke const untuk TextStyle
              ),
            ),
          ),
        ),
      ],
    );
  }
}
