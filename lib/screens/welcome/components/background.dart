import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          child,
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top1.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/main_bottom1.png",
              width: size.width * 0.2,
            ),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            child: Image.asset(
              "assets/images/middle_left.png",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            top: 230,
            left: 20,
            child: SvgPicture.asset(
              "assets/icons/child1.svg",
              width: size.width * 0.3,
            ),
          ),
          Positioned(
            bottom: 200,
            right: 20,
            child: SvgPicture.asset(
              "assets/icons/child2.svg",
              width: size.width * 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
