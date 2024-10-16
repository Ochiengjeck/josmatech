import 'package:flutter/material.dart';
import 'package:josma_tech/screens/authentication/firebase_functions.dart';
import 'package:josma_tech/screens/authentication/login.dart';
import 'package:josma_tech/screens/authentication/user.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool pushvalue = false;
  bool darkmode = false;
  final FirebaseAuthService _auth = FirebaseAuthService();

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const Login(),
        ),
      );
    } catch (e) {
      print("Error signing out: $e");
      // Handle error as needed, possibly throw it to handle in the UI
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 50, 50, 50),
        // appBar: AppBar(
        //   title: const Text("Account settings"),
        //   centerTitle: true,
        // ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(229, 56, 109, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 80.0,
                  left: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          size: 50,
                          color: Colors.white,
                        ),
                        Text(
                          "Settings",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 120.0,
                left: 20,
                right: 20,
              ),
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    currentAccountPicture: ClipOval(
                      child: Image.asset("assets/images/profile.jpg"),
                    ),
                    accountName: Text(
                        current_user!.displayName.toString() == "null"
                            ? "Username"
                            : current_user!.displayName.toString()),
                    accountEmail: Text(
                      current_user!.email.toString(),
                    ),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Account settings",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text(
                            "Edit Profile",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.navigate_next),
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            "Change Password",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.navigate_next),
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            "Add Payment Method",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            "Push Notification",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Switch(
                            value: pushvalue,
                            onChanged: (value) {
                              setState(() {
                                pushvalue = !pushvalue;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            "Dark Mode",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Switch(
                            value: darkmode,
                            onChanged: (value) {
                              setState(() {
                                darkmode = !darkmode;
                              });
                            },
                          ),
                        ),
                        const Divider(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "More",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text(
                            "About Us",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.navigate_next),
                          ),
                        ),
                        ListTile(
                          title: const Text(
                            "Privacy Policy",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.navigate_next),
                          ),
                        ),
                        const Divider(
                          height: 20,
                        ),
                        ListTile(
                          title: const Text(
                            "Log Out",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              signOut();
                            },
                            icon: const Icon(Icons.logout),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
