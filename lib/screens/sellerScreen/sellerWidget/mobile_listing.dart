class MobileListing {
  final String id;
  final String name;
  final String brand;
  final double price;
  final String condition;
  final String description;
  final List<String> images;
  final String sellerContact;

  MobileListing({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.condition,
    required this.description,
    required this.images,
    required this.sellerContact,
  });
}
