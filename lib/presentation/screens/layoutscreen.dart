import 'package:flutter/material.dart';
import 'package:newsapp/presentation/screens/news_screens/technology_newsApp_screen.dart';
import 'news_screens/business_newsApp_screen.dart';
import 'news_screens/general_newsApp_screen.dart';

class NewsappLayoutscreen extends StatefulWidget {
  const NewsappLayoutscreen({super.key});

  @override
  State<NewsappLayoutscreen> createState() => _NewsappLayoutscreenState();
}

class _NewsappLayoutscreenState extends State<NewsappLayoutscreen> {
  List<Widget> screensList = [
    GeneralNewsappScreen(),
    BusinessNewsappScreen(),
    TechnologyNewsappScreen(),
  ];

  int currentScreenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("News App"),
      //   //actions:[ThemeSwitchButton(),],
      // ),
      body:
      screensList[currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        mouseCursor: SystemMouseCursors.basic,
         backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        selectedLabelStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(
        fontSize: 12,fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontSize: 12,fontWeight: FontWeight.bold,
        ),
        // selectedItemColor:
        //     Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        // unselectedItemColor:
        //     Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        currentIndex: currentScreenIndex,
        onTap: (index) {
          currentScreenIndex = index;
          setState(() {});
        },

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category,size: 24,), label: "General"),
          BottomNavigationBarItem(icon: Icon(Icons.business,size: 24),label: "Businees",),
          BottomNavigationBarItem(icon: Icon(Icons.account_tree,size: 24), label: "technology",),
        ],
      ),
    );
  }
}
