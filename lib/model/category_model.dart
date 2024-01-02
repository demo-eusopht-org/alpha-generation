class CategoryItem {
  final String imageName;
  final String name;
  final int price;
  CategoryItem({
    required this.imageName,
    required this.name,
    required this.price,
  });
}

class ItemList {
  static List<CategoryItem> items = [
    CategoryItem(
      imageName: 'assets/images/tshirt.png',
      name: 'Arrow',
      price: 300,
    ),
    CategoryItem(
      imageName: 'assets/images/Guccie.png',
      name: 'Gucci',
      price: 100,
    ),
    CategoryItem(
      imageName: 'assets/images/tshirt.png',
      name: 'Arrow',
      price: 300,
    ),
    CategoryItem(
      imageName: 'assets/images/Guccie.png',
      name: 'Gucci',
      price: 100,
    ),
    CategoryItem(
      imageName: 'assets/images/tshirt.png',
      name: 'Arrow',
      price: 300,
    ),
    CategoryItem(
      imageName: 'assets/images/Guccie.png',
      name: 'Gucci',
      price: 100,
    ),
  ];
}
