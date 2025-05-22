import 'package:flutter/material.dart';
import '../models/sepatu_model.dart'; // Import model sepatu

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String selectedBrand = 'All';

  List<String> brands = ['All', 'Nike', 'Adidas', 'Puma', 'Converse'];

  @override
  Widget build(BuildContext context) {
    List<Shoe> filteredProducts = selectedBrand == 'All'
        ? allProducts
        : allProducts.where((p) => p.brand == selectedBrand).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Best Product'),
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: brands.map((brand) {
                  final isSelected = selectedBrand == brand;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(brand),
                      selected: isSelected,
                      onSelected: (_) {
                        setState(() {
                          selectedBrand = brand;
                        });
                      },
                      selectedColor: Colors.black,
                      backgroundColor: Colors.grey[300],
                      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final shoe = filteredProducts[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(2, 2)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1.5,
                        child: Image.asset(shoe.image, fit: BoxFit.contain),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(shoe.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text('Rp ${shoe.price.toStringAsFixed(0)}', style: TextStyle(color: Colors.grey[700])),
                            Text('Rating ${shoe.rating}', style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}