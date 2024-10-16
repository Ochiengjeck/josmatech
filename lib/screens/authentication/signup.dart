import 'dart:convert'; // Import for jsonEncode
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import http package
import 'package:josma_tech/screens/authentication/firebase_functions.dart';
import 'package:josma_tech/screens/authentication/login.dart';
import 'package:josma_tech/screens/authentication/textfields.dart';
import 'package:josma_tech/screens/authentication/user.dart';
import 'package:josma_tech/screens/pages/homePage.dart';
import 'package:josma_tech/screens/pages/pageIndex.dart';
import 'package:josma_tech/utils/alertdialog.dart';
import 'package:josma_tech/utils/authentication_controllers.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool conceal = true;
  bool conceal2 = true;
  final FirebaseAuthService _auth = FirebaseAuthService();

  Future<void> signUp() async {
    if (pass1.text == pass2.text) {
      try {
        // Attempt to create the user with email and password
        User? user =
            await _auth.signupWithEmailAndpassword(email.text, pass1.text);

        if (user != null) {
          print("Signup Successful");
          current_user = user;

          // Clear the fields after successful signup
          pass1.clear();
          pass2.clear();
          mobile.clear();
          name.clear();
          email.clear();

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const pageIndex(),
            ),
          );
        }
      } on FirebaseAuthException catch (e) {
        // Handle Firebase signup errors
        String errorMessage;

        switch (e.code) {
          case 'email-already-in-use':
            errorMessage =
                'This email is already registered. Please try logging in.';
            break;
          case 'invalid-email':
            errorMessage =
                'The email address entered is invalid. Please check the format.';
            break;
          case 'weak-password':
            errorMessage =
                'The password is too weak. Please choose a stronger password.';
            break;
          case 'operation-not-allowed':
            errorMessage =
                'Email/password accounts are not enabled. Contact support.';
            break;
          default:
            errorMessage = 'An unknown error occurred.';
        }

        // Show error dialog with the specific error message
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Signup Error"),
              content: Text(errorMessage),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      } catch (e) {
        // Catch any other unexpected exceptions
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Signup Error"),
              content:
                  const Text("An unexpected error occurred. Please try again."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } else {
      // If passwords do not match, show a warning dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Warning !!"),
            content: const Text("The passwords entered do not match."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Hey, Welcome !!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 4,
                  wordSpacing: 4,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Please enter your registration details",
                  style: TextStyle(
                    color: Color.fromARGB(255, 95, 95, 95),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Textfields(
                      hint: "Enter full names",
                      controller: name,
                      label: "Name",
                    ),
                    Textfields(
                      hint: "Enter phone number",
                      controller: mobile,
                      label: "Phone",
                    ),
                    Textfields(
                      hint: "example@gmail.com",
                      controller: email,
                      label: "Email",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: TextField(
                        obscureText: conceal,
                        controller: pass1,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                conceal = !conceal;
                              });
                            },
                            icon: conceal
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                          border: const OutlineInputBorder(
                            gapPadding: 12,
                          ),
                          hintText: "Enter Password",
                          labelText: "Password",
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                            color: Color.fromARGB(116, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: TextField(
                        obscureText: conceal2,
                        controller: pass2,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                conceal2 = !conceal2;
                              });
                            },
                            icon: conceal2
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                          border: const OutlineInputBorder(
                            gapPadding: 12,
                          ),
                          hintText: "Confirm Password",
                          labelText: "Confirm",
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                            color: Color.fromARGB(116, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                  left: 10,
                  right: 10,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width - 10,
                  height: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: RadialGradient(colors: [
                      Colors.blue,
                      Colors.white,
                      Colors.blue,
                    ], radius: 20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      signUp(); // Corrected function call
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Have an account?",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    child: const Text("Login here"),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "OR",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              // Social media buttons can be added here...
            ],
          ),
        ),
      ),
    );
  }
}
