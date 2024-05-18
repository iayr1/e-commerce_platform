class ProductModel {
  int? id;
  String? title;
  String? description;
  num? price;
  num? discountPercentage;
  num? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List? images;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      discountPercentage: json['discountPercentage'],
      rating: json['rating'],
      stock: json['stock'],
      brand: json['brand'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      images: List.from(json['images']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
    };
  }
    ProductModel copyWith({
    int? id,
    String? title,
    String? description,
    num? price,
    num? discountPercentage,
    num? rating,
    int? stock,
    String? brand,
    String? category,
    String? thumbnail,
    List? images,
  }) {
    
  return ProductModel(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    price: price ?? this.price,
    discountPercentage: discountPercentage ?? this.discountPercentage,
    rating: rating ?? this.rating,
    stock: stock ?? this.stock,
    brand: brand ?? this.brand,
    category: category ?? this.category,
    thumbnail: thumbnail ?? this.thumbnail,
    images: images ?? this.images,
    );
  }
}
