import 'package:flutter/material.dart';

class Alertdialog extends StatelessWidget {
  final String title;
  final String content;
  const Alertdialog({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      titleTextStyle: const TextStyle(
          color: Color.fromARGB(211, 31, 31, 31),
          fontSize: 21,
          fontWeight: FontWeight.w700),
      content: Text(
        content,
      ),
      contentTextStyle: const TextStyle(
        fontStyle: FontStyle.italic,
        color: Color.fromARGB(176, 29, 28, 28),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "OK",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}
