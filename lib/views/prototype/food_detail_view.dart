import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lunch_app/views/prototype/widgets/carousel_indicator.dart';

class FoodDetailView extends StatefulWidget {
  static const String routeName = "food_detail_view";
  const FoodDetailView({
    Key? key,
  }) : super(key: key);

  @override
  _FoodDetailViewState createState() => _FoodDetailViewState();
}

class _FoodDetailViewState extends State<FoodDetailView> {
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
  }

  Map<String, String> getRouteArguments() {
    return ModalRoute.of(context)!.settings.arguments as Map<String, String>;
  }

  @override
  Widget build(BuildContext context) {
    final routeArguments = getRouteArguments();

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(routeArguments["title"]!,
            style: TextStyle(
              color: Colors.white,
            )),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],

        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                onPageChanged: (i) {
                  setState(() {
                    _currentPage = i;
                  });
                },
                itemBuilder: (c, i) {
                  return Image.asset(
                    routeArguments["image"]!,
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CarouselIndicator(length: 3, selected: _currentPage),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price : ${routeArguments["price"]!}",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        routeArguments["description"]!,
                        style: TextStyle(color: Colors.grey.shade300, height: 1.5),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}