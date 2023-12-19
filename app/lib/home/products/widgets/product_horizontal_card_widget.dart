import 'package:flutter/material.dart';

import '../../base/model/product_model.dart';

class ProductHorizontalCard extends StatelessWidget {
  const ProductHorizontalCard({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(product.imageUrl),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
