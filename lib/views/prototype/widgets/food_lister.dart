import 'package:flutter/material.dart';
import 'package:lunch_app/model/images_items.dart';
import 'package:lunch_app/views/prototype/food_detail_view.dart';
import 'dart:async';

class FoodLister extends StatefulWidget {
  @override
  _FoodListerState createState() => _FoodListerState();
}

class _FoodListerState extends State<FoodLister>
    with SingleTickerProviderStateMixin {
  final PageController controller =
      PageController(initialPage: 2, viewportFraction: 0.9);
  int currentIndex = 0;
  Timer? timer;

  late AnimationController animationController;
  late Animation<Offset> slideAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    )..repeat(reverse: false);
    slideAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(1, 0.0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));
    fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 1.0,
    ).animate(animationController);

    // controller.addListener(() {
    //   setState(() {
    //     currentIndex = controller.page!.round();
    //   });
    // });
  }

  // @override
  // void dispose() {
  //   timer?.cancel();
  //   animationController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.8,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        // itemCount: 5,
        itemCount: ImagesItems.getCount(),
        controller: controller,
        itemBuilder: (c, i) {
          return AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return Opacity(
                opacity: fadeAnimation.value,
                child: SlideTransition(
                  // position: slideAnimation,
                  position: slideAnimation,

                  // child: Text(ImagesItems.getImage(i)),
                  child: _ItemWidget(index: i, context: context),
                ),
              );
            },
          );
        },
        // physics: BouncingScrollPhysics(),
      ),
    );
  }
}

// ignore: must_be_immutable
class _ItemWidget extends StatelessWidget {
  int index;

  final BuildContext context;
  _ItemWidget({Key? key, required this.index, required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.width * 0.8;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, FoodDetailView.routeName, arguments: {
          "image": ImagesItems.getImage(index),
          "title": ImagesItems.getTitle(index),
          "description": ImagesItems.getDescription(index),
          "price": ImagesItems.getPrice(index),
        });
      },
      child: Container(
        constraints: BoxConstraints(maxHeight: containerHeight),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Stack(
          children: [
            _buildBackgroundCard(),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$index : ${ImagesItems.getTitle(index)}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Expanded(
                    child: _buildImage(i: index),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: _buildDetails(i: index),
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

  Widget _buildBackgroundCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.8 * 0.2,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade100,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImage({required int i}) {
    return Center(
      child: Image.asset(
        ImagesItems.getImage(i),
        // images[i % images.length],
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildDetails({required int i}) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              ImagesItems.getDescription(i),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "\$ ${ImagesItems.getPrice(i)}",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.green,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              "\$ ${ImagesItems.getOldPrice(i)}",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.red.shade400,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
