import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongUserPassword,
  invalidEmail,

  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  undefined,
}

class AuthExceptionHandler {
  static AuthResultStatus handleException(e) {
    AuthResultStatus status;
    switch (e.code) {
      case "ERROR_INVALID_EMAIL":
        status = AuthResultStatus.invalidEmail;
        break;
      case "INVALID_LOGIN_CREDENTIALS":
        status = AuthResultStatus.wrongUserPassword;
        break;

      case "ERROR_USER_DISABLED":
        status = AuthResultStatus.userDisabled;
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "EMAIL_BADLY_FORMATTED":
        status = AuthResultStatus.invalidEmail;
        break;
      default:
        status = AuthResultStatus.undefined;
    }
    return status;
  }

  static String generateExceptionMessage(AuthResultStatus exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage = "Invalid email address. Please check and try again.";
        break;
      case AuthResultStatus.wrongUserPassword:
        errorMessage = "Incorrect user/password. Please try again.";
        break;

      case AuthResultStatus.userDisabled:
        errorMessage =
            "User account is disabled. Contact support for assistance.";
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage = "Too many login attempts. Try again later.";
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = "Sign-in with email and password is not allowed.";
        break;
      default:
        errorMessage = "An error occurred. Please try again.";
    }
    return errorMessage;
  }
}

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
  String _errorText = '';

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

  Future<void> _login() async {
    setState(() {
      _errorText = '';
    });
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await Future<void>.delayed(const Duration(seconds: 2));

      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        if (userCredential.user != null) {
          Navigator.pushReplacementNamed(context, '/landing');
        } else {
          final status = AuthExceptionHandler.handleException('ERROR_UNKNOWN');
          final errorMsg =
              AuthExceptionHandler.generateExceptionMessage(status);
          setState(() {
            _errorText = errorMsg;
          });
        }
      } catch (e) {
        final status = AuthExceptionHandler.handleException(e);
        final errorMsg = AuthExceptionHandler.generateExceptionMessage(status);
        setState(() {
          _errorText = errorMsg;
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
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

                // Email Text Field
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
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                // Password Text Field
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextFormField(
                    controller: _passwordController,
                    cursorColor: Colors.black,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    obscureText: !_passwordVisible,
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
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                Text(
                  _errorText,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),

                // Login Button and Loading Indicator
                SizedBox(
                  width: 250,
                  height: 50,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: _login,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: _isLoading
                                ? Colors.transparent
                                : Colors.pink.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: _isLoading
                                ? 0
                                : 2, // Set elevation to 0 when loading
                          ),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            alignment:
                                Alignment.center, // Center the button content
                            child: _isLoading
                                ? CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.pink.shade200),
                                  )
                                : const Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
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
