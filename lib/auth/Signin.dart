import 'package:flutter/material.dart';
import 'package:midterm/auth/Signup.dart';
import 'package:midterm/staff/staff_browse_room_list.dart';
import 'package:midterm/staff/staff_logout.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();

  // State variables for error messages
  String _usernameError = '';
  String _passwordError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Sign in',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "Poppins-Bold",
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Login into the Booking Room App...',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(179, 22, 21, 21),
                  fontFamily: "Poppins",
                ),
                textAlign: TextAlign.center,
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
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                      color: Colors.black, fontFamily: "Poppins", fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 10),
              if (_usernameError.isNotEmpty)
                Text(
                  _usernameError,
                  style:
                      const TextStyle(color: Colors.red, fontFamily: "Poppins"),
                ),
              if (_passwordError.isNotEmpty)
                Text(
                  _passwordError,
                  style:
                      const TextStyle(color: Colors.red, fontFamily: "Poppins"),
                ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: const Text(
                      'Create an account?',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: "Poppins"),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    onPressed: () {
                      setState(() {
                        _usernameError = '';
                        _passwordError = '';

                        // Validate inputs
                        if (_idController.text.isEmpty) {
                          _usernameError = 'Input your username';
                        } else if (_passwordController.text.isEmpty) {
                          _passwordError = 'Input your password';
                        } else if (_idController.text == 'student' &&
                            _passwordController.text == '1111') {
                          //go to student module
                        } else if (_idController.text == 'admin' &&
                            _passwordController.text == '2222') {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const StaffBrowseRoomList()),
                          );
                        } else if (_idController.text == 'approver' &&
                            _passwordController.text == '3333') {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StaffLogout()),
                          );
                        } else {
                          _passwordError = 'Username or Password wrong';
                        }
                      });
                    },
                    child: const Text(
                      'Sign in',
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
    );
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
