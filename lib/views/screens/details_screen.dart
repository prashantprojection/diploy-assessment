import 'package:diploy_assignment/controllers/cart_provider.dart';
import 'package:diploy_assignment/utils/common_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/product_model.dart';

class DetailsScreen extends ConsumerWidget {
  const DetailsScreen({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  Center(
                    child: Image.network(
                      product.imageUrl,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16.0),

                  // Product Name
                  Text(
                    product.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),

                  // Product Price
                  Text(
                    '\u{20B9}${product.price.toStringAsFixed(2)}',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.green),
                  ),
                  SizedBox(height: 16.0),

                  // Product Description
                  Text(
                    product.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 150,
            //   child: Image.asset("assets/images/cover_page.jpg"),
            // ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero)),
                    fixedSize: Size(MediaQuery.sizeOf(context).width / 2, 65)),
                onPressed: () {
                  ref.read(cartProvider.notifier).addToCart(product);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('${product.name} added to cart'),
                  ));
                },
                label: text(title: 'Add to Cart'),
                icon: const Icon(Icons.shopping_bag),
              ),
              TextButton.icon(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.zero)),
                      fixedSize:
                          Size(MediaQuery.sizeOf(context).width / 2, 65)),
                  onPressed: () {},
                  label: text(title: 'Buy Now'),
                  icon: text(title: '\u{20B9}'))
            ],
          )
        ],
      ),
    );
  }
}
