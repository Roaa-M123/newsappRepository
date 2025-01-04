import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/presentation/screens/layoutscreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/cache_helper.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenstate();
}

class _OnBoardingScreenstate extends State<OnBoardingScreen> {
  List<Map<String, dynamic>> onBordingScreenlList = [
    {
      "image": "assets/onboardingOne.png",
      "title": "NewsHub",
      "description":
          "Your gateway to breaking news and trending updates, with content tailored just for you, anytime, anywhere"
    },
    {
      "image": "assets/global-news.png",
      "title": "Global News",
      "description":
          "The app that delivers all categories of news from around the globe"
    },
    {
      "image": "assets/onboardingthree.json",
      "title": "Detailed News",
      "description":
          "Read in-depth news articles seamlessly through an integrated web view. Stay informed with ease!"
    },
  ];
  PageController controller = PageController();
  int currentPageNumber = 0;

  @override
  void dispose() {
    CacheHelper.setDataAll(key: "onBoarding", value: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  currentPageNumber = index;
                });
              },
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Stack(children: [
                  if (currentPageNumber < onBordingScreenlList.length - 1)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const NewsappLayoutscreen();
                            }));
                          },
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                                color: Color(0xff094E7F),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  index == onBordingScreenlList.length - 1
                      ? Lottie.asset(
                          onBordingScreenlList[index]["image"],
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(vertical: 40),
                          child: Image.asset(
                            onBordingScreenlList[index]["image"],
                            height: 300,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                  SizedBox(
                    height: 16,
                  ),
                  Positioned(
                    top: 400,
                    left: 20,
                    right: 20,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.8),
                      child: Text(
                        textAlign: TextAlign.center,
                        onBordingScreenlList[index]["title"],
                        style: const TextStyle(
                            color: Color(0xff094E7F),
                            fontSize: 30,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 450,
                    left: 20,
                    right: 20,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.8),
                      child: Text(
                        textAlign: TextAlign.center,
                        onBordingScreenlList[index]["description"],
                        style: const TextStyle(
                            color: Color(0xff094E7F),
                            fontSize: 20,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ]);
              },
              itemCount: onBordingScreenlList.length,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,

                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (currentPageNumber < onBordingScreenlList.length - 1)
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff094E7F),
                          shape: BoxShape.circle,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff094E7F),
                              shape: const CircleBorder(),
                              side: BorderSide(
                                color: Colors.white,
                                width: 2,
                              )),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: 60,
                  ),
                  if (currentPageNumber < onBordingScreenlList.length - 1)
                    SmoothPageIndicator(
                      controller: controller,
                      count: onBordingScreenlList.length,
                      effect: WormEffect(
                        spacing: 10,
                        dotHeight: 8,
                        dotWidth: 20,
                        // scale: 1,
                        dotColor: const Color(0xff094E7F).withOpacity(0.20),
                        activeDotColor: const Color(0xff094E7F),
                      ),
                    ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
            if (currentPageNumber == onBordingScreenlList.length - 1)
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const NewsappLayoutscreen();
                        },
                      ),
                    );
                  },
                  child: Center(
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade900,
                            Colors.blue.shade600,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        child: Center(
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.pushReplacement(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) {
                      //           return const NewsappLayoutscreen();
                      //         },
                      //       ),
                      //     );
                      //   },
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: const Color(0xff094E7F),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(20),
                      //     ),
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 20, vertical: 10),
                      //   ),
                      //   child: const Text(
                      //     "Get Started",
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 16,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
