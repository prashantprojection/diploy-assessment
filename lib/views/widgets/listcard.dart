import 'package:diploy_assignment/views/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/product_model.dart';

class ListCard extends ConsumerWidget {
  const ListCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => DetailsScreen(product: product)));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.contain,
                width: 90,
              ),
            ),
            Container(
              height: 2,
              color: Colors.red,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\u{20B9} ${product.price}',
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
