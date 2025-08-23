class CoverModel {
  final String image;
  final String name;

  CoverModel({required this.image, required this.name});

  static List<CoverModel> covers = [
    CoverModel(image: 'assets/image/cover3.png', name: 'Black collection'),
    CoverModel(image: 'assets/image/cover2.png', name: 'HAE By HAEKIM'),
    CoverModel(image: 'assets/image/cover1.png', name: 'White collection'),
  ];
}
