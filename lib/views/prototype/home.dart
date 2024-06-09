import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lunch_app/views/prototype/widgets/category_selector.dart';
import 'package:lunch_app/views/prototype/widgets/food_lister.dart';
import 'package:lunch_app/views/prototype/widgets/options_selector.dart';
import 'package:lunch_app/views/prototype/widgets/slide_menu/slide_menu2.dart';

import 'bottom_nav/bottom_nav.dart';
import 'side_bar_drawer/side_bar_drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void toggleDrawer() {
    if (_scaffoldKey.currentState != null) {
      if (_scaffoldKey.currentState!.isDrawerOpen) {
        Future.delayed(Duration(milliseconds: 10000), () {
          _scaffoldKey.currentState!.openEndDrawer();
        });
      } else {
        Future.delayed(Duration(milliseconds: 10000), () {
          _scaffoldKey.currentState!.openDrawer();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: IconButton(
            onPressed: toggleDrawer,
            icon: SvgPicture.asset(
              "assets/nav/drawer.svg",
              width: 40,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ),
      ),
      drawer: SideBarDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                OptionsSelector(
                  onChange: (x) {
                    if (x == "Foods") {
                      Navigator.pushNamed(context, "foods");
                    } else if (x == "Drinks") {
                      Navigator.pushNamed(context, "drinks");
                    } else if (x == "Offers") {
                      Navigator.pushNamed(context, "offers");
                    } else if (x == "slide_menu_2") {
                      Navigator.pushNamed(context, SlideMenu2.routeName);
                    } else {
                      Navigator.pushNamed(context, "home");
                    }
                  },
                ),
                CategorySelector(
                  onChange: (cat) {
                    print(cat);
                  },
                ),
                FoodLister(),
              ],
            ),
          ),
          BottomNav(),
        ],
      ),
    );
  }
}
