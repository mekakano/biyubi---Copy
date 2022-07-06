import 'package:biyubi/constants.dart';
import 'package:biyubi/enums.dart';
import 'package:biyubi/screens/home_screen/homescreen.dart';
import 'package:biyubi/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  final MenuState selectedMenu;

  const BottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/calendar.svg",
                color: MenuState.home == selectedMenu
                    ? kActiveIconColor
                    : kTextColor,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, HomeScreen.routeName),
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/gym.svg",
                color: MenuState.gym == selectedMenu
                    ? kActiveIconColor
                    : kTextColor,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, LoginScreen.routeName),
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/settings.svg"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgScr;
  final String title;
  final VoidCallback press;
  final MenuState selectedMenu;
  final MenuState selectedMenu2;
  final bool isActive;
  const BottomNavItem({
    Key? key,
    required this.svgScr,
    required this.title,
    required this.press,
    this.isActive = false,
    required this.selectedMenu,
    required this.selectedMenu2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(
            svgScr,
            color:
                selectedMenu2 == selectedMenu ? kActiveIconColor : kTextColor,
          ),
          Text(
            title,
            style: TextStyle(
                color: selectedMenu2 == selectedMenu
                    ? kActiveIconColor
                    : kTextColor),
          )
        ],
      ),
    );
  }
}
