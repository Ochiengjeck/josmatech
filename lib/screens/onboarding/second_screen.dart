import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Container(
              height: MediaQuery.sizeOf(context).height / 2,
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Refer a friend-pana.png"),
                ),
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
