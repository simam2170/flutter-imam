import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_form_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<Product> _products = [];

  Future<void> _addProduct() async {
    final result = await Navigator.push<Product>(
      context,
      MaterialPageRoute(
        builder: (_) => const ProductFormPage(),
      ),
    );

    if (result != null) {
      setState(() {
        _products.add(result); // CREATE
      });
    }
  }

  Future<void> _editProduct(Product product) async {
    final result = await Navigator.push<Product>(
      context,
      MaterialPageRoute(
        builder: (_) => ProductFormPage(product: product),
      ),
    );

    if (result != null) {
      setState(() {
        final index =
            _products.indexWhere((element) => element.id == product.id);
        if (index != -1) {
          _products[index] = result; // UPDATE
        }
      });
    }
  }

  void _deleteProduct(String id) {
    setState(() {
      _products.removeWhere((p) => p.id == id); // DELETE
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Produk'),
      ),
      body: _products.isEmpty
          ? const Center(child: Text('Belum ada data produk'))
          : ListView.builder(
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final p = _products[index];
                return ListTile(
                  title: Text(p.name),
                  subtitle: Text('Rp ${p.price}'),
                  onTap: () {
                    // READ detail sederhana
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(p.name),
                        content: Text('Harga: Rp ${p.price}'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Tutup'),
                          )
                        ],
                      ),
                    );
                  },
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => _editProduct(p),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteProduct(p.id),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        child: const Icon(Icons.add),
      ),
    );
  }
}
