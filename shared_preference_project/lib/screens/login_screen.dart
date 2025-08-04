import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preference_project/provider/my_provider.dart';
import 'package:shared_preference_project/screens/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: provider.globalKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            children: [
              TextFormField(
                controller: provider.emailController,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: "Enter your email..",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: provider.passwordController,
                decoration: InputDecoration(
                  labelText: "Enter your password..",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (provider.globalKey.currentState!.validate()) {
                      provider.checkLoginAndLogout(context);
                    }
                  },
                  child: Text("Login"),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("you don't have any account ? "),
                  GestureDetector( onTap: () {
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationScreen(),));
                  }, child: Text("Signup",style: TextStyle(fontWeight: FontWeight.bold),))
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}
