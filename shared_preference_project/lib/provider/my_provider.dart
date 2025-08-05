import 'package:flutter/material.dart';
import 'package:shared_preference_project/screens/login_screen.dart';
import 'package:shared_preference_project/utils/share_pre.dart';

import '../screens/profile_screen.dart';

class MyProvider extends ChangeNotifier {

  // make an object of shared preference
  final SharePre sharePre=SharePre();

  // this code is used to validate the form
  var globalKey=GlobalKey<FormState>();

  // get text from textEditingController
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController phoneController=TextEditingController();

  // show data in profile page
  String name="";
  String email="";
  String password="";
  String phone="";

  // set data in shared preference
  Future<void> setMyData() async {
    await sharePre.setData(nameController.text.trim(), emailController.text.trim(), passwordController.text.trim(), phoneController.text.trim());
    await  getMyData();
    notifyListeners();
  }

  //get data in shared preference
  getMyData() async {
    var result= await sharePre.getData();
    name=result["getName"];
    email=result["getEmail"];
    password=result["getPassword"];
    phone=result["getPhone"];
    notifyListeners();
  }

  // The user can login or logout
  loginAndLogout(bool status) async {
    await sharePre.checkLogAndLogout(status);
    notifyListeners();
  }

  // check user fill email and password is correct or not after that login or not
  checkLoginAndLogout(BuildContext context) async {
    await getMyData();
    if (email == emailController.text.trim() &&
        password == passwordController.text.trim()) {
      loginAndLogout(true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    } else if (email != emailController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid Email"))
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid Password")));
    }
  }

  // check application is login or not
  loginAndLogoutStatus(BuildContext context) async {
    bool success = await sharePre.isLoggedIn();
     if (success) {
       Navigator.pushAndRemoveUntil(
         context, MaterialPageRoute(builder: (context) => ProfileScreen()), (
           route) => false,
       );
     } else {
       Navigator.pushAndRemoveUntil(
         context, MaterialPageRoute(builder: (context) => LoginScreen()), (
           route) => false,);
     }
  }

  void clearController(){
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
  }

}