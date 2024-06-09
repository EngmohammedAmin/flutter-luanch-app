class ImagesItems {
  final String image;
  final String title;
  final String description;
  final String price;

  ImagesItems({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  String toString() {
    return 'ImagesItems{image: $image, title: $title, description: $description, price: $price}';
  }

  static List<ImagesItems> items = [
    ImagesItems(
      image: "assets/food/1.png",
      title: "Pizza",
      description: "With Fries",
      price: "20",
    ),
    ImagesItems(
      image: "assets/food/2.png",
      title: "Fish",
      description: "With Fries",
      price: "25",
    ),
    ImagesItems(
      image: "assets/food/3.png",
      title: "Salad",
      description: "With Fries",
      price: "10",
    ),
    ImagesItems(
      image: "assets/food/4.png",
      title: "Meat with Rice",
      description: "With Fries",
      price: "50",
    ),
    ImagesItems(
      image: "assets/food/5.png",
      title: "Raspberry Drink",
      description: "With Fries",
      price: "15",
    ),
  ];

  static List<ImagesItems> getItems() {
    return items;
  }

  static ImagesItems getItem(int index) {
    return items[index];
  }

  static int getCount() {
    return items.length;
  }

  static String getImage(int index) {
    return items[index].image;
  }

  static String getTitle(int index) {
    return items[index].title;
  }

  static String getDescription(int index) {
    return items[index].description;
  }

  static String getPrice(int index) {
    return items[index].price;
  }

  static int getIndex(String image) {
    return items.indexWhere((element) => element.image == image);
  }

  static int getIndexByTitle(String title) {
    return items.indexWhere((element) => element.title == title);
  }

  static getOldPrice(int i) {
    return int.parse(getPrice(i)) + .1* int.parse(getPrice(i));
  }

  static getImages() {
    // ignore: unused_local_variable
    List<String> images =items.map((e) => e.image).toList();
  }
}
