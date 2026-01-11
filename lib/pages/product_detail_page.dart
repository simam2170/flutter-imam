import 'package:flutter/material.dart';
import '../services/cart_service.dart';

class ProductDetailPage extends StatelessWidget {
  final String name;
  final double price;

  const ProductDetailPage({
    super.key,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: const Text("Detail")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.shopping_bag, size: 120),
            Text(name, style: const TextStyle(fontSize: 18)),
            Text("Rp $price", style: const TextStyle(color: Colors.green)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                CartService.addItem(name, price);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Ditambahkan ke cart")),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
