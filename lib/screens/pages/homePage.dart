import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:josma_tech/screens/pages/appbar.dart';
import 'package:josma_tech/screens/pages/assets.dart';
import 'package:josma_tech/screens/pages/cart.dart';
import 'package:josma_tech/screens/pages/josmatech.dart';
import 'package:josma_tech/screens/pages/sidebar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Color backgroundColor = const Color.fromARGB(0, 255, 255, 255);
  double search_width = 40;
  String category = '';

  final CarouselSliderController _carouselController =
      CarouselSliderController();

  final List<String> imagepaths = [
    "assets/images/Premium Vector _ Laptop or gadget for sale social media instagram post banner template.jpg",
    "assets/images/Home Appliance Banner Post Design.jpg",
  ];

  final List pages = [
    Homepage(),
    Josmatech(),
    Cart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: double.infinity,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: imagepaths.map((imagePath) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: double.infinity,
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 10, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Categories 🔥🔥",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "See more..",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: icons.length,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: icons.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      category = labels[index];
                    });
                  },
                  child: Column(
                    children: [
                      icons[index],
                      Expanded(
                        child: Text(labels[index]),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
