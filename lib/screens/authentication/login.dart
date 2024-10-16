import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the HTTP package
import 'package:josma_tech/screens/authentication/firebase_functions.dart';
import 'dart:convert'; // Import to use jsonEncode
import 'package:josma_tech/screens/authentication/forgot_password.dart';
import 'package:josma_tech/screens/authentication/user.dart';
import 'package:josma_tech/screens/pages/homePage.dart';
import 'package:josma_tech/screens/pages/pageIndex.dart';
import 'package:josma_tech/utils/alertdialog.dart';
import 'package:josma_tech/utils/authentication_controllers.dart';
import 'package:josma_tech/screens/authentication/signup.dart';
import 'package:josma_tech/screens/authentication/textfields.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool conceal = true;
  bool isLoading = false;

  final FirebaseAuthService _auth = FirebaseAuthService();

  // Function to handle login
  Future login() async {
    // Send the HTTP POST request
    // final response = await http.post(
    //   // Uri.parse('http://localhost/josmatech/login.php'),
    //   Uri.parse('http://192.168.51.14/josmatech/login.php'),

    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode({
    //     'email': email.text,
    //     'password': pass1.text,
    //   }
    //   ),
    // );

    // // Handle the response

    // if (response.statusCode == 200) {
    //   final data = jsonDecode(response.body);
    //   if (data['success']) {
    //     // If login is successful, navigate to the homepage
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (_) => const pageIndex()),
    //     );
    //   } else {
    //     // If login fails, show an alert dialog with the message
    //     showDialog(
    //       context: context,
    //       builder: (context) {
    //         return Alertdialog(
    //           title: "Warning !!",
    //           content: data['message'], // Use the message from the API
    //         );
    //       },
    //     );
    //   }
    // } else {
    //   // Handle other status codes
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //       return const Alertdialog(
    //         title: "Error !!",
    //         content: "An error occurred. Please try again.",
    //       );
    //     },
    //   );
    // }
    try {
      User? user =
          await _auth.signInWithEmailAndPassword(email.text, pass1.text);

      if (user != null) {
        print("SignIn Successful $user");
        current_user = user;

        // Clear the fields after successful signup
        pass1.clear();
        email.clear();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const pageIndex(),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const Alertdialog(
                  title: "Warning", content: "Wrong Email or password");
            },
          ),
        );
      }
    } catch (e) {
      return AlertDialog(
        title: Text("$e"),
      );
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 80.0,
              bottom: 8,
            ),
            child: Center(
              child: Text(
                "Welcome Back",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 4,
                  wordSpacing: 4,
                ),
              ),
            ),
          ),
          const Center(
            child: Text(
              "Please enter your sign in details now",
              style: TextStyle(
                color: Color.fromARGB(255, 95, 95, 95),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                Textfields(
                  hint: "example@gmail.com",
                  controller: email,
                  label: 'Email',
                ),
                const SizedBox(
                  height: 12,
                ),
                TextField(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ForgotPassword(),
                          ),
                        );
                      },
                      child: const Text(
                        "Forgot Password ?",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 20,
              right: 20,
            ),
            child: Container(
              width: MediaQuery.sizeOf(context).width - 10,
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
                  setState(() {
                    isLoading = !isLoading;
                  });

                  login();
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: !isLoading
                      ? Text(
                          "Login",
                          textAlign: TextAlign.center,
                        )
                      : CircularProgressIndicator(),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Signup(),
                    ),
                  );
                },
                child: const Text("Sign Up"),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Divider(),
                  Text(
                    "OR",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Divider()
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const Alertdialog(
                        title: 'Email Verification',
                        content: 'This option is under maintenance',
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.mail_rounded,
                  fill: .3,
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const Alertdialog(
                        title: 'Facebook Verification',
                        content: 'This option is under maintenance',
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.facebook,
                  fill: .3,
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const Alertdialog(
                        title: 'Apple Verification',
                        content: 'This option is under maintenance',
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.apple,
                  fill: .3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
