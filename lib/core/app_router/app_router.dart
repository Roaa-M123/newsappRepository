import 'package:flutter/material.dart';
import 'package:newsapp/core/app_router/screens_name.dart';

import '../../presentation/screens/layoutscreen.dart';
import '../../presentation/screens/splash_and_onboarding_screen/To_do_splashscreen.dart';

class AppRouter{
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch(settings.name){
      case ScreensName.splashScreen:
        return MaterialPageRoute(builder:( context)=> const ToDosplashScreen());
    }
    return null;
  }
}