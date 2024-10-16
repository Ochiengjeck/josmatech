import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  // Override the preferredSize property to specify the app bar's size
  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _CustomAppBarState extends State<CustomAppBar> {
  double searchWidth = 40;
  Color backgroundColor = const Color.fromARGB(0, 255, 255, 255);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("JosmaTech"),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {
            setState(() {
              searchWidth == 40 ? searchWidth = 80 : searchWidth = 40;
              backgroundColor == const Color.fromARGB(0, 255, 255, 255)
                  ? backgroundColor = Colors.grey
                  : backgroundColor = const Color.fromARGB(0, 255, 255, 255);
            });
          },
          child: SizedBox(
            width: searchWidth,
            height: 30,
            child: SearchBar(
              backgroundColor: WidgetStatePropertyAll(backgroundColor),
              leading: const Icon(Icons.search),
              elevation: const WidgetStatePropertyAll(0),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person),
        ),
      ],
    );
  }
}
