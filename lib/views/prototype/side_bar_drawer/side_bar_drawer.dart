import 'package:flutter/material.dart';

import '../../../screens/my_profile.dart';

class SideBarDrawer extends StatefulWidget {
  const SideBarDrawer({Key? key}) : super(key: key);

  @override
  State<SideBarDrawer> createState() => _SideBarDrawerState();
}

class _SideBarDrawerState extends State<SideBarDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Define the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
          milliseconds: 500), // Set the animation duration (in milliseconds: ),
    )..repeat(reverse: true);

    // Define the animation
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void closeDrawer(BuildContext context) {
    Scaffold.of(context).closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Drawer(
          semanticLabel: 'Navigation Drawer',
          width: MediaQuery.of(context).size.width / 2.5,
          backgroundColor: Colors.blue,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: DrawerHeader(
                  padding: EdgeInsets.only(bottom: 5, top: 5),
                  child: Text(
                    "Drawer Header",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Times New Roman",
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                trailing: Builder(
                  builder: (context) {
                    return IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () => closeDrawer(context),
                    );
                  },
                ),
              ),
              UserAccountsDrawerHeader(
                currentAccountPicture: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      foregroundImage: AssetImage("assets/food/3.png"),
                    ),
                    Positioned(
                      bottom: 3,
                      right: 7,
                      child: Container(
                        width: 10.0,
                        height: 10.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                          border: Border.all(
                            color: Colors.white,
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withOpacity(1),
                              blurRadius: 5.0 * _animation.value,
                              spreadRadius: 3.0 * _animation.value,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                accountName: Text("Mohammed Amin"),
                accountEmail: Text("M@m.com"),
                onDetailsPressed: () {
                  Navigator.pushNamed(context, MyProfile.routeName);
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "home");
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
