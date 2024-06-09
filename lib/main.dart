import 'package:flutter/material.dart';
import 'package:lunch_app/screens/my_profile.dart';
import 'package:lunch_app/views/prototype/food_detail_view.dart';
import 'package:lunch_app/views/prototype/widgets/slide_menu/slide_menu.dart';
import 'package:lunch_app/views/prototype/widgets/slide_menu/slide_menu2.dart';
// import 'package:lunch_app/views/prototype/widgets/food_lister.dart';

import 'views/prototype/home.dart';

void main() => runApp(LunchApp());

class LunchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      home: Home(),
      routes: {
        "foods": (context) => SlideMenu(),
        "home": (context) => Home(),
        "offers": (context) => Home(),
        FoodDetailView.routeName: (context) => FoodDetailView(),
        SlideMenu2.routeName: (context) => SlideMenu2(),
        MyProfile.routeName: (context) => MyProfile(),
      },
      // home: FoodDetailView(),
    );
  }
}
