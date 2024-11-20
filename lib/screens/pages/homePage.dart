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
    const Homepage(),
    const Josmatech(),
    const Cart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: const CustomAppBar(),
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
                  enlargeFactor: 1,
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
          SizedBox(
            height: 80,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 1),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 60.0,
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
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 20,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: const BoxDecoration(
                                color: Colors.amber,
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/MacBook Air 13 (2018-2019) Skins - Custom _ Body + Keyboard Surround.jpg",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 160,
                                child: const Text(
                                  "MacBook Air 13 (2018-2019) Skins - Custom _ Body + Keyboard Surround",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 160,
                                child: const Text(
                                  "Several solutions have been developed to address urban mobility challenges.",
                                  overflow: TextOverflow.visible,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 160,
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("Price"),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text("Ksh.23,000"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
