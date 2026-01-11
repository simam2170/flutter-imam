import 'package:flutter/material.dart';
import 'product_detail_page.dart';

class ProductListPage extends StatelessWidget {
  final String categoryName;
  const ProductListPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final products = [
      {"name": "Green Tea", "price": 20000.0},
      {"name": "Milk Chocolate", "price": 15000.0},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(categoryName),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (_, i) {
          final p = products[i];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailPage(
                    name: p["name"] as String,
                    price: p["price"] as double,
                  ),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  const Expanded(
                    child: Icon(Icons.shopping_bag, size: 50),
                  ),
                  Text(p["name"] as String),
                  Text("Rp ${p["price"]}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
