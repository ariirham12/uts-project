class Shoe {
  final String name;
  final String brand;
  final String image;
  final double price;
  final double rating;
  bool isChecked; //

  Shoe({
    required this.name,
    required this.brand,
    required this.image,
    required this.price,
    required this.rating,
    this.isChecked = true,
  });
}

List<Shoe> allProducts = [
  Shoe(name: 'Nike Air Zoom', brand: 'Nike', price: 2000000, image: 'assets/nike2.png', rating: 4.5),
  Shoe(name: 'Nike Revolution', brand: 'Nike', price: 4500000, image: 'assets/nike3.png', rating: 4.0),
  Shoe(name: 'Converse Chuck Taylor', brand: 'Converse', price: 150000, image: 'assets/converse1.png', rating: 3.8),
  Shoe(name: 'Adidas Yeezy Boost', brand: 'Adidas', price: 3500000, image: 'assets/yeezy2.png', rating: 4.7),
  Shoe(name: 'Puma RS-X', brand: 'Puma', price: 1200000, image: 'assets/puma1.png', rating: 4.1),
];