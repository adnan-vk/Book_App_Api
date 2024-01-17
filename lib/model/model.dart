class BookModel {
  String id;
  String title;
  String description;
  double price;
  String image;
  String author;
  String category;

  BookModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.author,
    required this.category,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      author: json['author'],
      category: json['category'],
    );
  }
}
