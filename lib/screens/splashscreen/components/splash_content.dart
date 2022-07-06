import 'package:biyubi/constants.dart';
import 'package:biyubi/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Spacer(),
        SvgPicture.asset(
          "assets/icons/logobiyubiv2.svg",
          width: size.width * 0.35,
        ),
        // Spacer(),
        // Text(
        //   "BIYUBI Land",
        //   style: TextStyle(
        //       fontSize: getProportionateScreenWidth(36),
        //       color: kPrimaryColor,
        //       fontWeight: FontWeight.bold),
        // ),
        Spacer(),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        )
      ],
    );
  }
}
