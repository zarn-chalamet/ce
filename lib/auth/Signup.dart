import 'package:flutter/material.dart';
import 'package:midterm/auth/Signin.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignUpScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool isSignUpComplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign up',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 34, 34, 34),
                    fontFamily: "Poppins-Bold"),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Create the Account for The Booking Room App..',
                style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(179, 29, 29, 29),
                    fontFamily: "Poppins"),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _idController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  labelText: 'ID',
                  labelStyle: const TextStyle(
                      color: Colors.black, fontFamily: "Poppins", fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Colors.black), // Set the border color to black
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color:
                            Colors.black), // Set focused border color to black
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color:
                            Colors.black), // Set enabled border color to black
                  ),
                ),
                cursorColor: Colors.black,
                style: const TextStyle(
                    color: Colors.black), // Set cursor color to black
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Name',
                  labelStyle: const TextStyle(
                      color: Colors.black, fontFamily: "Poppins", fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Colors.black), // Set the border color to black
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color:
                            Colors.black), // Set focused border color to black
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color:
                            Colors.black), // Set enabled border color to black
                  ),
                ),
                cursorColor: Colors.black,
                style: const TextStyle(
                    color: Colors.black), // Set cursor color to black
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                      color: Colors.black, fontFamily: "Poppins", fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Colors.black), // Set the border color to black
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color:
                            Colors.black), // Set focused border color to black
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color:
                            Colors.black), // Set enabled border color to black
                  ),
                ),
                cursorColor: Colors.black, // Set cursor color to black
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Confirm Password',
                  labelStyle: const TextStyle(
                      color: Colors.black, fontFamily: "Poppins", fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Colors.black), // Set the border color to black
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color:
                            Colors.black), // Set focused border color to black
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color:
                            Colors.black), // Set enabled border color to black
                  ),
                ),
                cursorColor: Colors.black, // Set cursor color to black
                style: const TextStyle(color: Colors.black),
              ),

              const SizedBox(height: 10),
              // Error messages
              if (_idError.isNotEmpty)
                Text(
                  _idError,
                  style: const TextStyle(color: Colors.red),
                ),
              if (_nameError.isNotEmpty)
                Text(
                  _nameError,
                  style: const TextStyle(color: Colors.red),
                ),
              if (_passwordError.isNotEmpty)
                Text(
                  _passwordError,
                  style: const TextStyle(color: Colors.red),
                ),
              if (_confirmPasswordError.isNotEmpty)
                Text(
                  _confirmPasswordError,
                  style: const TextStyle(color: Colors.red),
                ),
              if (isSignUpComplete)
                const Text(
                  'Sign Up Complete',
                  style: TextStyle(color: Colors.green),
                  textAlign: TextAlign.left,
                ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigate to the SignInScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()),
                      );
                    },
                    child: const Text(
                      'Already an account?',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Poppins"),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 15), // Smaller padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(
                          color: Colors.black, fontFamily: "Poppins"),
                    ),
                    onPressed: () {
                      setState(() {
                        // Reset error messages
                        _idError = '';
                        _nameError = '';
                        _passwordError = '';
                        _confirmPasswordError = '';

                        // Validate inputs
                        if (_idController.text.isEmpty) {
                          _idError = 'Input your ID';
                        }
                        if (_nameController.text.isEmpty) {
                          _nameError = 'Input your Name';
                        }
                        if (_passwordController.text.isEmpty) {
                          _passwordError = 'Input your password';
                        }
                        if (_confirmPasswordController.text.isEmpty) {
                          _confirmPasswordError = 'Input your password';
                        }
                        if (_passwordController.text !=
                            _confirmPasswordController.text) {
                          _confirmPasswordError = 'Passwords do not match';
                        }

                        if (_idError.isEmpty &&
                            _nameError.isEmpty &&
                            _passwordError.isEmpty &&
                            _confirmPasswordError.isEmpty) {
                          isSignUpComplete = true;
                        } else {
                          isSignUpComplete = false;
                        }
                      });
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: "Poppins"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  // Declare state variables for error messages
  String _idError = '';
  String _nameError = '';
  String _passwordError = '';
  String _confirmPasswordError = '';

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
