import 'package:flutter/material.dart';
import '../models/sepatu_model.dart';
import '../screens/checkout_screen.dart';

class CartScreen extends StatefulWidget {
  final List<Shoe> cartItems;

  const CartScreen({Key? key, required this.cartItems}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // Hitung total harga hanya dari item yang dicentang
    double totalPrice = widget.cartItems
        .where((item) => item.isChecked)
        .fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang Belanja"),
        backgroundColor: Colors.grey[200],
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: widget.cartItems.isEmpty
            ? const Center(child: Text("Keranjang masih kosong."))
            : Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  final item = widget.cartItems[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(item.image, width: 70),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text(item.price.toStringAsFixed(2),
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 15)),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      size: 16, color: Colors.amber),
                                  const SizedBox(width: 4),
                                  Text(item.rating.toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Checkbox(
                          value: item.isChecked,
                          onChanged: (val) {
                            setState(() {
                              item.isChecked = val ?? true;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total:",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(totalPrice.toStringAsFixed(2),
                      style: const TextStyle(
                          fontSize: 18, color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: totalPrice == 0
                  ? null
                  : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CheckoutScreen(total: totalPrice),
                  ),
                ).then((_) {
                  // Hapus item yang sudah dicheckout setelah kembali dari CheckoutScreen
                  setState(() {
                    widget.cartItems.removeWhere((item) => item.isChecked);
                  });
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: totalPrice == 0 ? Colors.grey : Colors.grey[700],
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 16),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Pesan Sekarang"),
            ),

          ],
        ),
      ),
    );
  }
}