import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorText = ''; // Initialize error message as an empty string.

  InputDecoration _inputDecoration(String labelText) {
    return InputDecoration(
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
      labelText: labelText,
      labelStyle: GoogleFonts.poppins(
        fontSize: 14,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 55,
                  ),
                ),
                Text(
                  'Sign in to Continue',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //Email Text Field
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextFormField(
                    controller: _emailController,
                    cursorColor: Colors.black,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    decoration: _inputDecoration('Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email.';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                //Password Text Field
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
                    obscureText:
                        !_passwordVisible, // Password visibility toggle
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
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        child: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                          size: 16,
                        ),
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

                const SizedBox(
                  height: 25,
                ),

                Text(
                  _errorText, // Display the error message here.
                  style: const TextStyle(
                    color: Colors
                        .red, // Use a different color for the error message.
                  ),
                ),

                //Login Button
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      await Future<void>.delayed(const Duration(seconds: 1));

                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        // Check if sign-in is successful
                        if (userCredential.user != null) {
                          // Navigate to the home page
                          Navigator.pushReplacementNamed(context, '/landing');
                        } else {
                          // Handle unsuccessful sign-in
                          setState(() {
                            _errorText =
                                'Sign-in failed. Please check your credentials and try again.';
                          });
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      } catch (e) {
                        // Handle other login errors, if necessary.
                        setState(() {
                          _errorText =
                              'An error occurred. Please try again later.';
                        });
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Login',
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

                Text(
                  'Forgot Password?',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),

                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/signupscreen');
                  },
                  child: Text(
                    'Signup!',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
