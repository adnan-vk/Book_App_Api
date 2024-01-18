class BookModel {
  String? id;
  String? title;
  String? description;
  double? price;
  String? image;
  String? author;
  String? category;

  BookModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.image,
    this.author,
    this.category,
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
