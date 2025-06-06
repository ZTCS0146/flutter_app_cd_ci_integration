import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_game/login_model/login.dart';
import 'package:flutter_application_game/widgets/custom_loader.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
void initState() {
super.initState();
Timer(Duration(seconds: 5), () => Navigator.pushReplacement(
context, MaterialPageRoute(builder: (context) =>PhoneScreen())));
}
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold( 
      
   
        body:Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assests/images/bg.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.teal.withOpacity(0.9), // Colored overlay
                  BlendMode.srcATop,
                ),
              ),
            ),
          ),
 Positioned.fill(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // SizedBox(height: MediaQuery.of(context).size.height / ),
      Column(
        children: [
          Image.asset(
            'assests/images/snakeup.png',
            width: 180,
          ),
          Image.asset(
            'assests/images/snake.png',
            width: 180,
          ),
                 
        ],

      ),
   
     
    ],
  ),
),
Positioned(
  bottom: 40, // Distance from bottom
  left: 0,
  right: 0,
  child: Center(
    child: CustomLoader(),
  ),
),


      ]));
  
}}


  