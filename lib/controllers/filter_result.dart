import 'package:diploy_assignment/models/product_model.dart';
import 'package:diploy_assignment/utils/sample_product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterResultProvider =
    StateNotifierProvider<FilteredResult, List<Product>>((ref) {
  return FilteredResult();
});

class FilteredResult extends StateNotifier<List<Product>> {
  FilteredResult() : super(sampleProducts);

  void onSearch(String query) {
    if (query.isEmpty) {
      state = sampleProducts;
    } else {
      state = sampleProducts.where((product) {
        return product.name.toLowerCase().contains(query);
      }).toList();
    }
  }
}
