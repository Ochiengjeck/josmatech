import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height / 2,
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/Group Chat-bro.png",
                  ),
                ),
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
