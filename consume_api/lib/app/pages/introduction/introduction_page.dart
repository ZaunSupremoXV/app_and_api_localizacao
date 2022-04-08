import 'package:consume_api/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/home_page.dart';
import 'atoms/dots_indicator.dart';
import 'molecules/item.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final controller = PageController();
  bool isLastPage = false;
  static const kDuration = Duration(milliseconds: 300);
  static const kCurve = Curves.ease;
  final kArrowColor = Colors.teal.shade700.withOpacity(0.8);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = index == 2;
            });
          },
          children: [
            ItemPageIntroduction(
              color: Colors.green.shade100,
              urlImage: 'assets/images/page1.webp',
              title: 'REDUCE',
              subtitle:
                  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aligua.',
            ),
            ItemPageIntroduction(
              color: Colors.red.shade100,
              urlImage: 'assets/images/page2.png',
              title: 'REDUCE',
              subtitle:
                  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aligua.',
            ),
            ItemPageIntroduction(
              color: Colors.orange.shade100,
              urlImage: 'assets/images/page3.png',
              title: 'RECYCLE',
              subtitle:
                  'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aligua.',
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                primary: Colors.white,
                backgroundColor: Colors.teal.shade700,
                minimumSize: const Size.fromHeight(80),
              ),
              onPressed: () async {
                //! pra salvar que aceitou o introduction
                await AppController.instance.changeThemeViewModel
                    .changeShowHome(true);
                // final prefs = await SharedPreferences.getInstance();
                // prefs.setBool('showHome', true);

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text(
                'Get Started',
                style: TextStyle(fontSize: 24),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.jumpToPage(2);
                    },
                    child: Text(
                      "SKIP",
                      style: TextStyle(
                        color: Colors.teal.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: DotsIndicator(
                      color: kArrowColor,
                      controller: controller,
                      itemCount: 3,
                      onPageSelected: (int page) {
                        controller.animateToPage(
                          page,
                          duration: kDuration,
                          curve: kCurve,
                        );
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      "NEXT",
                      style: TextStyle(
                        color: Colors.teal.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
