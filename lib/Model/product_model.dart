class ProductModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        price = json['price'] is int
            ? (json['price'] as int).toDouble()
            : json['price'] is double
                ? json['price']
                : 0.0,
        description = json['description'],
        category = json['category'],
        image = json['image'],
        rating = Rating.fromJson(json['rating']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    data['rating'] = rating.toJson();
    return data;
  }
}

class Rating {
  double rate;
  int count;

  Rating({
    required this.rate,
    required this.count,
  });

  Rating.fromJson(Map<String, dynamic> json)
      : rate = json['rate'] is int
            ? (json['rate'] as int).toDouble()
            : json['rate'] is double
                ? json['rate']
                : 0.0,
        count = json['count'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}
