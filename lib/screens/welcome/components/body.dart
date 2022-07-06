import 'package:biyubi/components/rounded_button.dart';
import 'package:biyubi/constants.dart';
import 'package:biyubi/screens/login/login_screen.dart';
import 'package:biyubi/screens/signup/%60signup_screen.dart';
import 'package:biyubi/screens/welcome/components/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "WELCOME TO EDUKASIiddasd",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            Container(
              color: Colors.lightBlue,
              width: 300,
              height: 200,
              child: Center(
                child: Text('Subscribe'),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              color: kPrimaryColor,
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
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
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
}
