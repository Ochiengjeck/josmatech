import 'package:flutter/material.dart';
import 'package:josma_tech/screens/authentication/login.dart';
import 'package:josma_tech/screens/onboarding/first_screen.dart';
import 'package:josma_tech/screens/onboarding/second_screen.dart';
import 'package:josma_tech/screens/onboarding/third_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _pageController = PageController();
  bool onLastPage = false;
  int currentPage = 0;
  String label = "Skip";
  final pages = [
    const FirstScreen(),
    const SecondScreen(),
    const ThirdScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          children: pages,
          onPageChanged: (index) {
            setState(
              () {
                currentPage = index;
                onLastPage = (currentPage == 2);
                onLastPage ? label = "Get Started" : label = "Skip";
              },
            );
          },
        ),
        Container(
          alignment: const Alignment(0, .6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear);
                  },
                  icon: const Icon(Icons.arrow_back)),
              SmoothPageIndicator(
                controller: _pageController,
                count: pages.length,
                effect: const WormEffect(
                  dotHeight: 4,
                  dotWidth: 30,
                ),
              ),
              if (!onLastPage)
                IconButton(
                    onPressed: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    icon: const Icon(Icons.arrow_forward))
              else
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 0,
                  ),
                ),
            ],
          ),
        ),
        Container(
          alignment: const Alignment(0, .8),
          child: TextButton(
            onPressed: () {
              if (onLastPage) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              } else {
                _pageController.animateToPage(2,
                    duration: const Duration(seconds: 1), curve: Curves.linear);
              }
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width - 20,
              height: 40,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 11, 229, 237),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
