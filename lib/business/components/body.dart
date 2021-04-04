import 'package:flutter/material.dart';
import '../../login/login_screen.dart';
import '../../signup/components/background.dart';
import '../../components/already_have_an_account_check.dart';
import '../../components/business.dart';
import '../../components/date.dart';
import '../../components/image.dart';
import '../../components/number_gst.dart';
import '../../components/rounded_button.dart';
import '../../components/rounded_image.dart';
import 'package:flutter_svg/svg.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:practice/db/retailers.dart';



class Body extends StatelessWidget {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  TextEditingController _businessDetailTextController = TextEditingController();
  TextEditingController _businessNameTextController = TextEditingController();
  TextEditingController _licenceNumberTextController = TextEditingController();
  TextEditingController _gstNumberTextController = TextEditingController();
  TextEditingController _aadharNumberTextController = TextEditingController();
  TextEditingController _businessAddressTextController = TextEditingController();
  bool loading = false;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Business Details",
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
              ],),
            RoundedInputBusiness(
              hintText: "Name of Business",
              onChanged: (value) {},
            ),
            RoundedInputnumbergst(
              hintText: "Licence Number",
              onChanged: (value) {},
            ),
            RoundedInputImage(
              hintText: "Licence Image",
              onChanged: (value) {},
            ),

            RoundedInputnumbergst(
              hintText: "GST Number",
              onChanged: (value) {},
            ),
            RoundedInputnumbergst(
              hintText: "Aadhar Number",
              onChanged: (value) {},
            ),
            RoundedInputImage(
              hintText: "Aadhar Image",
              onChanged: (value) {},
            ),
            RoundedInputBusiness(
              hintText: "Address of Business",
              onChanged: (value) {},
            ),
            RoundedInputDate(
              hintText: "Expiry Date of Licence",
              onChanged: (value) {},
            ),
            RoundedImage(
              onChanged: (value) {},
            ),
            RoundedButton(
                text: "SIGNUP",
                press: () {
                  Navigator.pushNamed(context,"medSupply");
                }
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
}
