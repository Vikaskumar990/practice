import 'package:flutter/material.dart';
import 'package:practice/Login/login_screen.dart';
import 'package:practice/components/email.dart';
import 'package:practice/components/mobile_number.dart';
import 'package:practice/components/already_have_an_account_check.dart';
import 'package:practice/components/rounded_button.dart';
import 'package:practice/components/rounded_input_field.dart';
import 'package:practice/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

import 'background.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practice/db/retailers.dart';


class Body extends StatelessWidget {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _mobilenumberTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  bool loading = false;
  bool hidePass = true;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Create New Account",
              style: TextStyle(fontWeight: FontWeight.bold,),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg", // main head image
              height: size.height * 0.18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedInputField(
                  controller : _nameTextController,
                  hintText: "Full Name",
                 // onChanged: (value) {},
                  validator: (value) {
                    if(value.isEmpty){
                      return "The name field can't be empty";
                    }
                    return null;
                  },
                ),
              ],),

            RoundedInputEmail(
              controller: _nameTextController;
              hintText: "Your Email",
              onChanged: (value) {},
              validator: (value) {
                if(value.isEmpty){
                  Pattern pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(value))
                    return 'Please make sure your email address is valid';
                  else
                    return null;
                }
              },
            ),
            RoundedInputMob(
              controller: _mobilenumberTextController,
              hintText: "Mobile Number",
              onChanged: (value) {},
              validator: (value) {
                if(value.isEmpty){
                  return "Mobile number field can't be empty";
                }
                return null;
              },
            ),
            RoundedPasswordField(
              controller: _passwordTextController,
              //obscureText: hidePass,
              //onChanged: (value) {},
              validator: (value) {
                if (value.isEmpty) {
                  return "The password field cannot be empty";
                } else if (value.length < 6) {
                  return "the password has to be at least 6 characters long";
                }
                return null;
              },
            ),

            RoundedButton(
                text: "NEXT",
                onPressed: () {
                  validateForm();
                  Navigator.pushNamed(context,"medSupply");
                },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            /* OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            ) */ //social Site icon

          ],
        ),

      ),
    );
  }

  Future validateForm() {
    FormState formState = _formKey.currentState;

    if (formState.validate()) {
      formState.reset();
      FirebaseUser user = await firebaseAuth.currentUser();
      if (user == null) {
        firebaseAuth
            .createUserWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordTextController.text)
            .then((user) => {
          _userServices.createUser(
              {
                "username": _nameTextController.text,
                "email": _emailTextController.text,
                "userId": retailers.uid,
                "mobileNumber": _mobilenumberTextController
              }
          )
        }).catchError((err) => {print(err.toString())});

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));

      }
    }

  }
}
