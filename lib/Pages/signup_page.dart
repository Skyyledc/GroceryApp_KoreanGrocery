import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:groceryapp/pages/landing.dart';
import 'package:groceryapp/pages/login_page.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorText = '';
  bool _isLoading = false;

  Future<void> registerUser() async {
    setState(() {
      _isLoading = true;
    });

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      User? user = userCredential.user;
      if (userCredential.user != null) {
        // Navigate to the home page
        Navigator.pushReplacementNamed(context, '/landing');
      } else {
        setState(() {
          _errorText = 'An error occurred. Please try again later.';
          _isLoading = false;
        });
      }
    } catch (e) {
      // Handle other login errors, if necessary.
      setState(() {
        _errorText =
            'Sign-up failed. Please check your credentials and try again.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Create New Account',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 35,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already Registered?',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      ' Log in here.',
                      style: GoogleFonts.poppins(
                          color: Colors.pink[200],
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                      controller: _nameController,
                      cursorColor: Colors.grey[100],
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white12,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        labelText: 'Name',
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name.';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                      controller: _emailController,
                      cursorColor: Colors.grey[100],
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white12,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        labelText: 'Email',
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email.';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextFormField(
                      controller: _passwordController,
                      cursorColor: Colors.grey[100],
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white12,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        labelText: 'Password',
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password.';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Text(
                _errorText,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _errorText = ''; // Clear any previous error
                      });
                      setState(() {
                        _isLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 1));

                      registerUser();

                      _isLoading = false;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Signup',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
