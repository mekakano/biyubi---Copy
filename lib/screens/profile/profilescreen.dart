import 'package:biyubi/constants.dart';
import 'package:biyubi/screens/profile/components/body.dart';
import 'package:biyubi/size_config.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      leading: SizedBox(),
      centerTitle: true,
      title: Text("Profile"),
      actions: <Widget>[
        TextButton(
          onPressed: () {},
          child: Text(
            "Edit",
            style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.defaultSize! * 1.6,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
