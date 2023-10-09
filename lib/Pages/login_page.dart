import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;

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
                  cursorColor: Colors.black,
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
                  cursorColor: Colors.grey[100],
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  obscureText: !_passwordVisible, // Password visibility toggle
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
                      color:
                          Colors.black, // Change label text color when focused
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
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              //Login Button
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
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

              Text(
                'Signup!',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
