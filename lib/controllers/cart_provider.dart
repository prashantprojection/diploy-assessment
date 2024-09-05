import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  void addToCart(Product product) {
    if (state.any((item) => item.id == product.id)) {
      // This is for not adding anything into Cart if that item already exist in it
      return;
    }
    state = [...state, product];
  }

  void removeFromCart(Product product) {
    // For removing an item from the Cart
    state = state.where((item) => item.id != product.id).toList();
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>(
  (ref) => CartNotifier(),
);
