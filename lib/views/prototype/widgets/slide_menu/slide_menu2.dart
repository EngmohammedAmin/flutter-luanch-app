import 'package:flutter/material.dart';

import '../../side_bar_drawer/side_bar_drawer.dart';

class SlideMenu2 extends StatefulWidget {
  static const String routeName = "slide_menu_2";

  @override
  State<SlideMenu2> createState() => _SlideMenu2State();
}

class _SlideMenu2State extends State<SlideMenu2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  // void togleDrawer(BuildContext context) {
  //   setState(() {
  //     isDrawer = !isDrawer;
  //   });
  //   if (isDrawer) {
  //     Scaffold.of(context).openDrawer();
  //   } else {
  //     Scaffold.of(context).closeDrawer();
  //   }
  // }

  void toggleDrawer() {
    if (_scaffoldKey.currentState != null) {
      if (_scaffoldKey.currentState!.isDrawerOpen) {
        _scaffoldKey.currentState!.openEndDrawer();
      } else {
        _scaffoldKey.currentState!.openDrawer();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Slide Menu'),
          centerTitle: true,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: toggleDrawer,
                // onPressed: () => togleDrawer(context),
              );
            },
          ),
          // elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ]),
      drawer: SideBarDrawer(),
      body: SafeArea(
        child: Builder(
          builder: (BuildContext context) {
            return Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  "Slide Menu",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: "Times New Roman",
                    letterSpacing: 10,
                    wordSpacing: 20,
                    height: 2,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                    decorationStyle: TextDecorationStyle.dotted,
                    decorationThickness: 5,
                    fontSize: 50,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
