import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_game/login_model/login_model.dart';
import 'package:flutter_application_game/ui/splash.dart';
import 'package:provider/provider.dart';

void main() {
runApp(MyApp());
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(initMeth: false)),
      ],
      child:  MyApp(),
    );
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Splash Screen',
theme: ThemeData(
primarySwatch: Colors.green,
),
home: SplashScreen(),
debugShowCheckedModeBanner: false,
);
}
}

