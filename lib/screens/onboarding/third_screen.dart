import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
            ),
            child: Container(
              height: MediaQuery.sizeOf(context).height / 2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/Service 24_7-bro.png",
                  ),
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
