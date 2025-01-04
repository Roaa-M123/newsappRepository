
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'on_boarding_screen.dart';
class ToDosplashScreen extends StatefulWidget {
  const ToDosplashScreen({super.key});

  @override
  State<ToDosplashScreen> createState() => _ToDosplashScreenState();
}

class _ToDosplashScreenState extends State<ToDosplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds:8), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const OnBoardingScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,
        body: Container(
          child:Center(
            child: Lottie.asset("assets/globeSplash.json",
            width: 300),
          ),
        ));
  }
}