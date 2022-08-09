import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:restaurantapp/homePage.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_login/flutter_login.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    bool success;
    String userEmail;
    String userPassword;

    Future<void> authenticate() async {
      userEmail = emailController.text;
      userPassword = passwordController.text;

      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: userEmail, password: userPassword);
      } on FirebaseAuthException catch (error) {
        if (error.code == 'weak-password') {
          print('The Password is too weak');
        } else if (error.code == 'email-already-in-use') {
          print('The account already exists for that email');
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Business",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w300,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Manager",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 15.0, left: 0, right: 0, bottom: 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 50,
                  child: TextFormField(
                    controller: emailController,
                    obscureText: false,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'example@gmail.com'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 50,
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: ''),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    onPressed: (() {
                      authenticate();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ),
                      );
                    }),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
