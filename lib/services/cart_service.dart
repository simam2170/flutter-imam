import 'package:hive_flutter/hive_flutter.dart';
import '../models/cart_item_model.dart';

class CartService {
  static final Box<CartItem> _box = Hive.box<CartItem>('cartBox');

  // READ
  static List<CartItem> get items => _box.values.toList();

  // CREATE
  static void addItem(String name, double price) {
    final index =
        _box.values.toList().indexWhere((item) => item.name == name);

    if (index >= 0) {
      final item = _box.getAt(index)!;
      item.quantity++;
      item.save();
    } else {
      _box.add(CartItem(name: name, price: price));
    }
  }

  // UPDATE +
  static void increaseQty(CartItem item) {
    item.quantity++;
    item.save();
  }

  // UPDATE -
  static void decreaseQty(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
      item.save();
    } else {
      removeItem(item);
    }
  }

  // DELETE
  static void removeItem(CartItem item) {
    item.delete();
  }

  // TOTAL
  static double get totalPrice =>
      _box.values.fold(0, (sum, item) => sum + item.total);

  // CLEAR (optional)
  static void clearCart() {
    _box.clear();
  }
}
