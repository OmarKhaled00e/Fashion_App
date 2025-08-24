class ProductModel {
  final String image;
  final String name;
  final int price;
  final String description;

  ProductModel({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });
  static List<ProductModel> product = [
    ProductModel(
      image: 'assets/image/product1.png',
      name: 'October',
      price: 100,
      description: 'reversible angora cardigan',
    ),
    ProductModel(
      image: 'assets/image/product2.png',
      name: 'October',
      price: 120,
      description: 'reversible angora cardigan',
    ),
    ProductModel(
      image: 'assets/image/product3.png',
      name: 'October',
      price: 150,
      description: 'reversible angora cardigan',
    ),
    ProductModel(
      image: 'assets/image/product4.png',
      name: 'October',
      price: 140,
      description: 'reversible angora cardigan',
    ),
    ProductModel(
      image: 'assets/image/product5.png',
      name: 'October',
      price: 200,
      description: 'reversible angora cardigan',
    ),
    ProductModel(
      image: 'assets/image/product6.png',
      name: 'October',
      price: 170,
      description: 'reversible angora cardigan',
    ),
  ];
}
