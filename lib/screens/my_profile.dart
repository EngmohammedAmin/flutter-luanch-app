import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  static const String routeName = "my_profile";

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('My Profile'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  Navigator.pop(context);
                })
          ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Icon(Icons.account_circle, size: 100, color: Colors.green),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/food/4.png'),
            ),
            SizedBox(height: 20),
            Text(
              'Your Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Your Occupation',
              style: TextStyle(fontSize: 18),
            ),
            // Add more profile information as needed
          ],
        ),
      ),
    );
  }
}
