import 'package:diploy_assignment/controllers/filter_result.dart';
import 'package:diploy_assignment/controllers/cart_provider.dart';
import 'package:diploy_assignment/views/screens/cart_items.dart';
import 'package:diploy_assignment/views/widgets/listcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredProduct = ref.watch(filterResultProvider);
    final cartItems = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Diploy'),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartScreen()));
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              if (cartItems.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 4,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 10,
                      minHeight: 10,
                    ),
                    child: Text(
                      '${cartItems.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 7,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            // For doing a item search by its name
            child: TextFormField(
              controller: textController,
              onChanged: (value) {
                ref.read(filterResultProvider.notifier).onSearch(value);
              },
              decoration: InputDecoration(
                  hintText: "Type to filter...",
                  suffixIcon: const Icon(Icons.filter_list_alt),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(width: 1.5))),
            ),
          ),
          Expanded(
              // Using GripdView builder to generate all hard coded products in it
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: filteredProduct.length,
                  itemBuilder: (BuildContext context, index) {
                    return ListCard(
                      product: filteredProduct[index],
                    );
                  }))
        ],
      ),
    );
  }
}
