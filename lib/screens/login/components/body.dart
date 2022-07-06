import 'dart:ui';

import 'package:biyubi/components/already_have_an_account.dart';
import 'package:biyubi/components/rounded_button.dart';
import 'package:biyubi/components/rounded_input_field.dart';
import 'package:biyubi/components/rounded_password_field.dart';
import 'package:biyubi/components/text_field_container.dart';
import 'package:biyubi/constants.dart';
import 'package:biyubi/screens/home_screen/homescreen.dart';
import 'package:biyubi/screens/login/components/background.dart';
import 'package:biyubi/screens/signup/%60signup_screen.dart';
import 'package:biyubi/screens/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:email_validator/email_validator.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyLoginPageState createState() => _BodyLoginPageState();
}

class _BodyLoginPageState extends State<Body> {
  var passwordLoginController = TextEditingController();
  var usernameLoginController = TextEditingController();
  bool isValidEmail = false;
  bool visible = false;
  final String sUrl = "https://mysimrs.com/api/";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/momv1.svg",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              controller: usernameLoginController,
              icon2: Icons.email,
              validatorwoi: (value) {
                isValidEmail =
                    EmailValidator.validate(usernameLoginController.text);
                if (!isValidEmail) {
                  return "salaaah format";
                }
                return null;
              },
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Password",
              controller: passwordLoginController,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BottomNavScreen2();
                    },
                  ),
                );
              },
              color: kPrimaryColor,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    if (usernameLoginController.text.isNotEmpty &&
        usernameLoginController.text.isNotEmpty) {
      var payload = {
        "payload": {
          "username": usernameLoginController,
          "endDate": passwordLoginController
        }
      };

      var responseLogin = await http.post(
          Uri.parse(
              "https://biyubi-clinic-backend.herokuapp.com/clinic/admin/login"),
          body: ({payload}));

      if (responseLogin.statusCode == 200) {}
    }
  }
}
