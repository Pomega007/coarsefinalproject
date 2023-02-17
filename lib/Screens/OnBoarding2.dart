import 'package:coarse_final_project/Screens/Accounts/LoginScreen.dart';
import 'package:flutter/material.dart';

class OnBoarding2 extends StatefulWidget {
  const OnBoarding2({Key? key}) : super(key: key);

  @override
  State<OnBoarding2> createState() => _OnBoarding2State();
}

class _OnBoarding2State extends State<OnBoarding2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Positioned(
            child:
            Image.asset(
              'assets/Illustration2.png',
              height: 400,
            ),
          ),
          Flexible(
          child: Container(
            child: Text('Food Ninja is Where Your Comfort Food Lives',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 70,
              vertical: 10,
            ),
          ),
          ),
          Flexible(
          child: Container(
            child: Text(
              'Enjoy a fast and smooth food delivery at your doorstep',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 60,
            ),
          ),
    ),
          Flexible(
            flex: 2,
          child: Center(
            child: Container(
              height: 100,
              width: 300,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color(0xFF53E88B),
                            Color(0xFF15BE77),
                          ]),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 65,vertical: 25,),
                        primary: Colors.transparent,
                        onSurface: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen(),));
                        },
                      child: Text("Next",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                ),
              ),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
