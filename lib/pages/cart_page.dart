import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/cart_item_model.dart';
import '../services/cart_service.dart';
import '../services/whatsapp_service.dart'; // ⬅️ TAMBAH INI

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Cart"),
        centerTitle: true,
      ),

      body: ValueListenableBuilder(
        valueListenable: Hive.box<CartItem>('cartBox').listenable(),
        builder: (context, Box<CartItem> box, _) {
          final items = box.values.toList();

          if (items.isEmpty) {
            return const Center(
              child: Text("Cart masih kosong"),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final CartItem item = items[index];

                    return Card(
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(Icons.shopping_bag),
                            ),
                            const SizedBox(width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Rs. ${item.price.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        color: Colors.green),
                                  ),
                                ],
                              ),
                            ),

                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_circle_outline),
                                  onPressed: () =>
                                      CartService.decreaseQty(item),
                                ),
                                Text(
                                  item.quantity.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_circle_outline),
                                  onPressed: () =>
                                      CartService.increaseQty(item),
                                ),
                              ],
                            ),

                            IconButton(
                              icon: const Icon(Icons.delete,
                                  color: Colors.red),
                              onPressed: () =>
                                  CartService.removeItem(item),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // TOTAL & CHECKOUT
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Rs. ${CartService.totalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // 🔥 SESUAI PERMINTAAN KAMU
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding:
                              const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          WhatsAppService.openWhatsApp();
                        },
                        child: const Text("Checkout via WhatsApp"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
