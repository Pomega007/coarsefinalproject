import 'package:coarse_final_project/Screens/Accounts/LoginScreen.dart';
import 'package:coarse_final_project/Screens/OnBoarding2.dart';
import 'package:flutter/material.dart';

class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({Key? key}) : super(key: key);

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            children: [
            Image.asset(
            'assets/Illustartion.png',
            height: 400,
          ),
          Flexible(
          child: Container(
            child: Text('Find your  Comfort Food here',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
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
          child:Container(
            child: Text(
              'Here You Can find a chef or dish for every taste and color. Enjoy!',
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
              alignment: Alignment.bottomCenter,
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
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => OnBoarding2(),));

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
      ),
    );
  }
}
