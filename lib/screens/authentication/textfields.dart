import 'package:flutter/material.dart';

class Textfields extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String label;
  const Textfields({
    super.key,
    required this.hint,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            gapPadding: 12,
          ),
          hintText: hint,
          labelText: label,
          hintStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(116, 0, 0, 0)),
        ),
      ),
    );
  }
}
