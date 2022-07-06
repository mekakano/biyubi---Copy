import 'package:biyubi/screens/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/Welcome/welcomingscreen.dart';
import 'constants.dart';

void main() {
  runApp(new MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LayoutBasic',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          fontFamily: "Cairo",
          appBarTheme: AppBarTheme(
              color: kPrimaryColor,
              elevation: 0,
              foregroundColor: kTextColor,
              systemOverlayStyle:
                  SystemUiOverlayStyle(statusBarBrightness: Brightness.dark)),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Color(0xFFF8F8F8),
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: kTextColor)),
      home: SplashScreen(),
    );
  }
}

class LayoutBasics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            color: Colors.lightBlue,
            width: 300,
            height: 200,
            child: Center(
              child: Text('Subscribe'),
            ),
          ),
          Container(
            color: Colors.yellow,
            width: 300,
            height: 200,
            child: Center(
              child: Text('Do it'),
            ),
          ),
          Container(
            color: Colors.lightGreen,
            width: 300,
            height: 200,
            child: Center(
              child: Text('Yiha'),
            ),
          )
        ],
      ),
    );
  }
}
