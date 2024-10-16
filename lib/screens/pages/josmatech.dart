import 'package:flutter/material.dart';
import 'package:josma_tech/screens/pages/appbar.dart';

class Josmatech extends StatelessWidget {
  const Josmatech({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text("Josmatech"),
      ),
    );
  }
}
