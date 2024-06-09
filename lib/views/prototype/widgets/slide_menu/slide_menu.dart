import 'package:flutter/material.dart';

class SlideMenu extends StatefulWidget {
  @override
  _SlideMenuState createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000), // Set the slide animation duration
    );

//the bellow code is for Repeat the animation automatically with a period of 1000 milliseconds

    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 500), // Set the slide animation duration
    // )..repeat(reverse: true, period: Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
      if (_isMenuOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: _toggleMenu,
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              // Navigator.pushNamed(context, "notifications");
              Navigator.pop(context);
            },
          ),
        ],
        backgroundColor: Colors.blue,
        title: Text('Slide Menu'),
      ),
      body: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
          ),
          SlideTransition(
            position: Tween<Offset>(
              begin: Offset(-1.0, 0.0),
              end: Offset(0.0, 0.0),
            ).animate(_animationController),
            child: Container(
              color: Colors.blue,
              width: 200,
              height: double.infinity,
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: _isMenuOpen ? 200 : 0,
            child: GestureDetector(
              onTap: _toggleMenu,
              child: Container(
                color: Colors.transparent,
                width: _isMenuOpen
                    ? MediaQuery.of(context).size.width - 200
                    : double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
