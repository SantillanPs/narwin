import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'theme_provider.dart';

class LoginScreen extends StatefulWidget {
  final ThemeProvider themeProvider;

  const LoginScreen({super.key, required this.themeProvider});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:
                widget.themeProvider.isDarkMode
                    ? [Colors.blue.shade900, Colors.black]
                    : [Colors.blue.shade700, Colors.blue.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "PLAYHAVEN",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Icon(
                    Icons.videogame_asset,
                    size: 80,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  // Email input field
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: "Email"),
                    style: TextStyle(
                      color:
                          widget.themeProvider.isDarkMode
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Password input field
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "Password"),
                    style: TextStyle(
                      color:
                          widget.themeProvider.isDarkMode
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Login button
                  ElevatedButton(
                    onPressed: () {
                      if (emailController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => HomeScreen(
                                  themeProvider: widget.themeProvider,
                                ),
                          ),
                        );
                      } else {
                        // Show an error message if the fields are empty
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Please enter both email and password.",
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text("LOGIN"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
