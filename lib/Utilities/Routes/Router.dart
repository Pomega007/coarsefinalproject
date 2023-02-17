import 'package:coarse_final_project/Screens/Accounts/LoginScreen.dart';
import 'package:coarse_final_project/Screens/OnBoarding2.dart';
import 'package:flutter/material.dart';
import '../../Screens/Accounts/RegisterScreen.dart';
import '../../Screens/SplashScreen.dart';
import 'Routs.dart';
import 'package:coarse_final_project/Screens/OnBoarding1.dart';


Route<dynamic> onGenerate(RouteSettings routeSettings){

  switch(routeSettings.name){
    case AppRoutes.splashPageRoute:
      return MaterialPageRoute(builder: (_)=>const SplashScreen(),
          settings:  routeSettings
      );
    case AppRoutes.onBoarding1Route:
      return MaterialPageRoute(builder: (_)=>
      const OnBoarding1(),
          settings: routeSettings
      );
    case AppRoutes.onBoarding2Route:
      return MaterialPageRoute(builder: (_) =>
      const OnBoarding2(),
        settings: routeSettings
      );
    case AppRoutes.loginRoute:
      return MaterialPageRoute(builder: (_)=> LoginScreen(),
          settings: routeSettings
      );
    case AppRoutes.registerPageRoute:
    default:return MaterialPageRoute(builder: (_)=> RegisterScreen(),
        settings: routeSettings
    );

  }

}