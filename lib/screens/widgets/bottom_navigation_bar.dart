import 'package:biyubi/constants.dart';
import 'package:biyubi/screens/home_screen/homescreen.dart';
import 'package:biyubi/screens/profile/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavScreen2 extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen2> {
  final List _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    ProfileScreen(),
    Scaffold(),
  ];
  int _currentIndex = 0;
  var words = ['Home', 'fi', 'fo', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      floatingActionButton: buildNavigateButton(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [
          "assets/icons/home.svg",
          "assets/icons/calendar.svg",
          "assets/icons/gym.svg",
          "assets/icons/user.svg"
        ]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    label: words[key].toString(),
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      // decoration: BoxDecoration(
                      //   color: _currentIndex == key
                      //       ? kActiveIconColor
                      //       : Colors.transparent,
                      //   borderRadius: BorderRadius.circular(20.0),
                      // ),
                      child: SvgPicture.asset(value,
                          color: _currentIndex == key
                              ? kPrimaryColor
                              : kTextColor),
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }

  Widget buildNavigateButton() => FloatingActionButton(
        child: Image.asset("assets/images/whatsapp.png"),
        backgroundColor: kPrimaryColor,
        onPressed: () {
          print("Pressed");
        },
      );
}
