import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_login/flutter_login.dart';

class Authentication extends StatelessWidget {
  final controller = TextEditingController();

  Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void dispose() {
      controller.dispose();
    }

    //void authenticate(String emailAddress, String password) {
    //try {
    //final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //email: emailAddress,
    //password: password,
    //);
//} on FirebaseAuthException catch (e) {
//  if (e.code == 'weak-password') {
//    print('The password provided is too weak.');
//  } else if (e.code == 'email-already-in-use') {
//    print('The account already exists for that email.');
//  }
//} catch (e) {
//  print(e);
//}
//    }

    return Scaffold(
      appBar: AppBar(),
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
                  child: TextField(
                    controller: controller,
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
                  child: TextField(
                    controller: controller,
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
                    onPressed: (() {}),
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
