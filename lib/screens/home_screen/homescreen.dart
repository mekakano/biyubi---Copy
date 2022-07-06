import 'package:biyubi/constants.dart';
import 'package:biyubi/enums.dart';
import 'package:biyubi/screens/article/article.dart';
import 'package:biyubi/screens/widgets/bottom_nav_bar.dart';
import 'package:biyubi/screens/widgets/bottom_navigation_bar.dart';
import 'package:biyubi/screens/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _globalKey,
      endDrawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.

        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavScreen2(),
      //     BottomNavigationBar(type: BottomNavigationBarType.fixed, items: [
      //   BottomNavigationBarItem(
      //       icon: SvgPicture.asset("assets/icons/settings.svg"),
      //       label: 'Chats'),
      //   BottomNavigationBarItem(
      //       icon: SvgPicture.asset("assets/icons/settings.svg"),
      //       label: 'Chats'),
      // ]),
      body: Stack(
        children: <Widget>[
          Container(
              height: size.height * 0.45,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  image: DecorationImage(
                      alignment: Alignment.centerLeft,
                      image: AssetImage("assets/images/undraw.png")))),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      _globalKey.currentState?.openEndDrawer();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                ),
                Text(
                  "Halo Apa Kabar, Bun",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.5)),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        icon: SvgPicture.asset("assets/icons/search.svg")),
                  ),
                ),
                Expanded(
                    child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  childAspectRatio: .85,
                  mainAxisSpacing: 20,
                  children: <Widget>[
                    CategoryCard(
                        title: "Milestone",
                        svgSrc: "assets/icons/icon_milestone.svg",
                        press: () {}),
                    CategoryCard(
                      title: "Grow Chart",
                      svgSrc: "assets/icons/icon_grafik.svg",
                      press: () {},
                    ),
                    CategoryCard(
                      title: "Riwayat Periksa dan Vaksin",
                      svgSrc: "assets/icons/icon_riwayat.svg",
                      press: () {},
                    ),
                    CategoryCard(
                      title: "Artikel",
                      svgSrc: "assets/icons/iconartikel.svg",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ArticleScreen();
                          }),
                        );
                      },
                    )
                  ],
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
