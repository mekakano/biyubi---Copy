import 'package:biyubi/constants.dart';
import 'package:biyubi/screens/profile/components/info.dart';
import 'package:biyubi/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Info(
            image: "assets/images/pic.png",
            name: "Rane Gea",
            email: "gea.mekakano@gmail.com",
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 2,
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/bookmark.svg",
            title: "Saved Recipe",
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/bowl.svg",
            title: "Koki",
            press: () {},
          )
        ],
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key? key,
    required this.iconSrc,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String iconSrc, title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: defaultSize * 2, vertical: defaultSize * 3),
        child: SafeArea(
          child: Row(
            children: <Widget>[
              SvgPicture.asset(iconSrc),
              SizedBox(width: defaultSize * 2),
              Text(
                title,
                style:
                    TextStyle(fontSize: defaultSize * 1.6, color: kTextColor),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: defaultSize * 1.6,
                color: kTextColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
