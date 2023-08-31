class IceCream {
  final String name;
  final double price;
  final int quantity;
  final String imgurl;
  final String iconurl;
  final String description;
  final String flavor;
  final List<String> allergens;
  final double rating;
  final int bgColor;
  final int textColor;
  final int btnColor;

  IceCream({
    required this.name,
    required this.price,
    required this.quantity,
    required this.imgurl,
    required this.iconurl,
    required this.description,
    required this.flavor,
    required this.allergens,
    required this.rating,
    required this.bgColor,
    required this.textColor,
    required this.btnColor,
  });

  factory IceCream.fromJson(Map<String, dynamic> json) {
    return IceCream(
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      imgurl: json['imgurl'],
      iconurl: json['iconurl'],
      description: json['description'],
      flavor: json['flavor'],
      allergens: List<String>.from(json['allergens']),
      rating: json['rating'],
      bgColor: json['bgcolor'],
      textColor: json['textcolor'],
      btnColor: json['btncolor'],
    );
  }
}
