import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseTest extends StatefulWidget {
  @override
  _FirebaseTestState createState() => _FirebaseTestState();
}

class _FirebaseTestState extends State<FirebaseTest> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("firebase test"),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text("Save Data"),
            onPressed: () {
              try {
                // firebaseAuth
                //     .createUserWithEmailAndPassword(
                //         email: "rohit@yopmail.com", password: "123456")
                //     .then((value) {
                //       print(value);
                // });
                firebaseAuth
                    .signInWithEmailAndPassword(
                        email: "rohit@yopmail.com", password: "123456")
                    .then((value) {
                  print(value);
                });
                firestore.collection("login").add({'name': "Rohit", 'id': 1});
              } catch (e) {
                print(e);
              }
            },
          ),
        ),
      ),
    );
  }
}
