import 'package:coarse_final_project/Screens/Accounts/LoginScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async{
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(
        builder: (context) => LoginScreen()
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
            ),
            Container(
              child: Image.asset('assets/Logo.png'),
            ),
            Container(
              child: Center(
                  child: Container(
                    child: Text(
                        "FoodNinja",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = LinearGradient(
                              colors: <Color>[
                                Color(0xFF53E88B),
                                Color(0xFF15BE77),
                              ],
                            ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))
                        )
                    ),
                  )
              ),
            ),
          ],
        ),
        ),
    );
  }
}
