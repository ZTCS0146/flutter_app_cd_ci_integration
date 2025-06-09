import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_game/login_model/login_model.dart';
import 'package:flutter_application_game/ui/splash.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';

void main() {
 // ✅ Ensure all bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Initialize WorkManager after bindings are ready
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true, // false in production
  );
  runApp(MyApp());
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(initMeth: false)),
      ],
      child:  MyApp(),
    );
 
  // Initialize port for communication between TaskHandler and UI.

}
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // Do background work like syncing
    print("Running background task: $task");
    return Future.value(true);
  });
}
// class MyApp extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
// return MaterialApp(
// title: 'Splash Screen',
// theme: ThemeData(
// primarySwatch: Colors.green,
// ),
// home: SplashScreen(),
// debugShowCheckedModeBanner: false,
// );
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("WorkManager Example")),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Workmanager().registerOneOffTask(
                "uniqueName",
                "simpleTask",
              );
            },
            child: Text("Run Background Task"),
          ),
        ),
      ),
    );
  }
}



