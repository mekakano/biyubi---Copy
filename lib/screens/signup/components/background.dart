import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset("assets/images/signup_topp.png",
                  width: size.width * 0.5)),
          Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset("assets/images/signup_bottomm.png",
                  width: size.width * 0.4)),
          child
        ],
      ),
    );
  }
}
