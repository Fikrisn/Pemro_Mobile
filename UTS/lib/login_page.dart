import 'dart:ui'; // Import for ImageFilter
import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;
  bool _isLoading = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    await Future.delayed(const Duration(seconds: 2)); // Simulate login process

    if (_usernameController.text == 'admin' && _passwordController.text == 'admin123') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(username: _usernameController.text),
        ),
      );
    } else {
      setState(() {
        _errorMessage = 'Username atau password tidak valid';
        _animationController.forward(from: 0); // Run shake animation
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image with blur effect
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/trip3.jpg'), // Ensure correct image path
                fit: BoxFit.cover, // Cover the entire area
              ),
            ),
          ),
          // Apply blur effect to the background
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5), // Apply blur effect
            child: Container(
              color: Colors.black.withOpacity(0.3), // Add a semi-transparent overlay
            ),
          ),
          // Login page content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Change logo to "MyTrip" text
                  const Text(
                    "MyTrip",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Page title
                  const Text(
                    "Login to Your Adventure",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Form input username
                  SlideTransition(
                    position: _animationController.drive(
                      Tween<Offset>(
                        begin: Offset.zero,
                        end: const Offset(0.1, 0),
                      ),
                    ),
                    child: TextField(
                      controller: _usernameController,
                      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: const TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
                        prefixIcon: const Icon(Icons.person, color: Color.fromARGB(179, 0, 0, 0)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(color: Color.fromARGB(179, 0, 0, 0)),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Form input password
                  TextField(
                    controller: _passwordController,
                    style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Color.fromARGB(179, 0, 0, 0)),
                      prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(179, 0, 0, 0)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(color: Color.fromARGB(179, 0, 0, 0)),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255).withOpacity(0.50),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  // Login button with gradient effect
                  _isLoading
                      ? const CircularProgressIndicator() // Loader during login processing
                      : ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            backgroundColor: Colors.blueAccent, // Use appropriate color
                            elevation: 5,
                          ),
                          child: const Text('Login', style: TextStyle(fontSize: 18, color: Colors.white)),
                        ),
                  // Error message
                  if (_errorMessage != null) ...[
                    const SizedBox(height: 20),
                    Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
