import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preference_project/provider/my_provider.dart';
import 'package:shared_preference_project/screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    Provider.of<MyProvider>(context, listen: false).getMyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Screen"),
        backgroundColor: Colors.blue,
      ),
      body: Consumer<MyProvider>(builder: (context, value, child) {
        return Column(
          children: [
            Text(value.name),
            Text(value.email),
            Text(value.password),
            Text(value.phone),
            ElevatedButton(onPressed: () {
              value.loginAndLogout(false);
              Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => LoginScreen(),));
            }, child: Text("Logout"))
          ],
        );
      },),
    );
  }
}
