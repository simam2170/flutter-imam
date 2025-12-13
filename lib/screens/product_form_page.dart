import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductFormPage extends StatefulWidget {
  final Product? product;

  const ProductFormPage({super.key, this.product});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameCtrl;
  late TextEditingController _priceCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.product?.name ?? '');
    _priceCtrl =
        TextEditingController(text: widget.product?.price.toString() ?? '');
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _priceCtrl.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final name = _nameCtrl.text;
    final price = int.tryParse(_priceCtrl.text) ?? 0;

    Navigator.pop(
      context,
      Product(
        id: widget.product?.id ?? DateTime.now().toString(),
        name: name,
        price: price,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.product != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Produk' : 'Tambah Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameCtrl,
                decoration: const InputDecoration(labelText: 'Nama Produk'),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Nama wajib diisi' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _priceCtrl,
                decoration: const InputDecoration(labelText: 'Harga'),
                keyboardType: TextInputType.number,
                validator: (v) =>
                    v == null || v.isEmpty ? 'Harga wajib diisi' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _save,
                child: Text(isEdit ? 'Simpan Perubahan' : 'Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
