import 'package:flutter/material.dart';
import '../models/sepatu_model.dart';

class DetailScreen extends StatefulWidget {
  final Shoe shoe;

  DetailScreen({required this.shoe});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int selectedSize = 40;
  final List<int> sizes = [38, 39, 40, 41, 42, 43];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Detail", style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Container(
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Image.asset(widget.shoe.image, height: 180),
                ),
              ),
              SizedBox(height: 20),
              Text(widget.shoe.name,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              SizedBox(height: 4),
              Text("Rp ${widget.shoe.price.toInt()}",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, size: 18, color: Colors.amber),
                  SizedBox(width: 4),
                  Text("${widget.shoe.rating} / 5",
                      style: TextStyle(color: Colors.black87)),
                ],
              ),
              SizedBox(height: 20),
              Text("Pilih Ukuran",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: sizes.map((size) {
                  final isSelected = selectedSize == size;
                  return GestureDetector(
                    onTap: () => setState(() => selectedSize = size),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.grey[700]
                            : Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$size',
                        style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text("Deskripsi",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              SizedBox(height: 8),
              Text(
                "Sepatu berkualitas tinggi dengan desain modern dan warna stylish. Cocok untuk gaya kasual maupun aktivitas ringan.",
                style: TextStyle(color: Colors.black54),
              ),
              SizedBox(height: 30),
              // Tombol beli
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, widget.shoe);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text("Tambahkan ke Keranjang",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}