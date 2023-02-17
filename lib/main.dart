import 'dart:ui';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:coarse_final_project/Config/GoogleSignInProvider.dart';
import 'package:coarse_final_project/Screens/OnBoarding1.dart';
import 'package:coarse_final_project/Utilities/Routes/Routs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Config/SharedPrefrences.dart';
import 'ThemeProvider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:coarse_final_project/Config/Model/UserProvider.dart';
import 'Utilities/Routes/Router.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp;
  // await UserSharedPrefrences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final User = UserID.getUser();
  Map<String, dynamic>? _userData;
  String url = 'https://reqres.in/api/users?page=2';
  Dio dio = Dio();


  @override
  Widget build(BuildContext context) {
      return ThemeProvider(
      initTheme: User.isDark ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (themeContext) =>ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: MyThemes.darkTheme,
        themeMode: ThemeMode.system,
        theme: User.isDark ? MyThemes.darkTheme : MyThemes.lightTheme,
        home: AnimatedSplashScreen(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          duration: 3000,
          splashIconSize: 174,
          splash: Center(
            child: Column(
              children: [
                Container(
                ),
                Container(
                  child: Image.asset('assets/Logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  child: Center(
                      child: Container(
                        child: Text(
                            "FoodNinja",
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()
                                  ..shader = LinearGradient(
                                    colors: <Color>[
                                      Color(0xFF53E88B),
                                      Color(0xFF15BE77),
                                    ],
                                  ).createShader(
                                      Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))
                            )
                        ),
                      )
                  ),
                ),
              ],
            ),
          ),
          pageTransitionType: PageTransitionType.rightToLeft,
          nextScreen: OnBoarding1(),
        ),
        onGenerateRoute: onGenerate,
        initialRoute: AppRoutes.splashPageRoute,
      ),
    ),
      ),
    );
}
}