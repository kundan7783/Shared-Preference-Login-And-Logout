import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preference_project/provider/my_provider.dart';
import 'package:shared_preference_project/screens/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => MyProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
