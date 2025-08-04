import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preference_project/provider/my_provider.dart';
import 'package:shared_preference_project/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
     Provider.of<MyProvider>(context,listen: false).loginAndLogoutStatus(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircleAvatar(radius: 70)));
  }
}
