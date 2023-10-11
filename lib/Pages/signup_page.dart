import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            Text(
              'Already Registered? Log in here.',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                'NAME',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
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
                ),
              ),
              Text(
                'EMAIL',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
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
              Text(
                'PASSWORD',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
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
                ),
              ),
            ])
          ],
        ),
      ),
    ));
  }
}
