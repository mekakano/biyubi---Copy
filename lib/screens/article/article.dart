import 'package:biyubi/constants.dart';
import 'package:biyubi/screens/article/components/body.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      // body: Stack(
      //   children: <Widget>[
      //     Container(
      //       height: size.height * .45,
      //       decoration: BoxDecoration(
      //           color: kBlueLightColor,
      //           image: DecorationImage(
      //               fit: BoxFit.fitWidth,
      //               image: AssetImage("assets/images/undraw.png"))),
      //     ),
      //     SafeArea(
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 20),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             SizedBox(
      //               height: size.height * 0.05,
      //             ),
      //             Text(
      //               "Article",
      //               style: Theme.of(context)
      //                   .textTheme
      //                   .displaySmall
      //                   ?.copyWith(fontWeight: FontWeight.w900),
      //             ),
      //             SizedBox(
      //               height: size.height * 0.04,
      //             ),
      //             Container(
      //                 height: size.height * .45,
      //                 decoration: BoxDecoration(
      //                     color: kBlueLightColor,
      //                     image: DecorationImage(
      //                         fit: BoxFit.fill,
      //                         image: AssetImage("assets/images/undraw.png"))))
      //           ],
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        'ARTIKEL',
        style: TextStyle(fontWeight: FontWeight.w800),
      ),
      centerTitle: true,
    );
  }
}
