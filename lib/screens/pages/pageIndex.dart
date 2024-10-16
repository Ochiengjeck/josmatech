import 'package:flutter/material.dart';
import 'package:josma_tech/screens/pages/cart.dart';
import 'package:josma_tech/screens/pages/homePage.dart';
import 'package:josma_tech/screens/pages/josmatech.dart';

class pageIndex extends StatefulWidget {
  const pageIndex({super.key});

  @override
  State<pageIndex> createState() => _pageIndexState();
}

class _pageIndexState extends State<pageIndex> {
  int _selectedpageIndex = 1;
  final List pages = [
    Josmatech(),
    Homepage(),
    Cart(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedpageIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (pageIndex) {
            setState(() {
              _selectedpageIndex = pageIndex;
            });
          },
          currentIndex: _selectedpageIndex,
          fixedColor: Colors.amber,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.join_full_sharp,
              ),
              label: "JosmaTech",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_basket,
              ),
              label: "Cart",
            ),
          ]),
    );
  }
}
