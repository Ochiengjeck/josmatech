import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:josma_tech/screens/authentication/login.dart';
import 'package:josma_tech/screens/pages/maps.dart';
import 'package:josma_tech/screens/pages/settings.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const Login(),
        ),
      );
      print("User signed out successfully");
    } catch (e) {
      print("Error signing out: $e");
      // Handle error as needed, possibly throw it to handle in the UI
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 2,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipOval(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black45,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/profile.jpg",
                    ),
                  ),
                ),
              ),
            ),
            arrowColor: Colors.black,
            accountName: const Text("Test User"),
            accountEmail: const Text(
              "example@gmail.com",
            ),
            decoration: const BoxDecoration(
              color: Colors.amber,
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage("assets/images/Background.jpg"),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text("Favourite"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text("Maps"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Maps(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text("Chat bot"),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => Chatgpt(),
              //   ),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text("Friends"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text("Share"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Request"),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Settings(),
                ),
              );
            },
          ),
          ListTile(
              leading: const Icon(Icons.edit_document),
              title: const Text("Policies"),
              onTap: () {}),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Log Out"),
            onTap: () {
              signOut();
            },
          ),
        ],
      ),
    );
  }
}
