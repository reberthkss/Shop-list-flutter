import 'dart:html';

import 'package:flutter/material.dart';

import '../../base/model/product_model.dart';

enum ProductHorizontalCardStyle { NORMAL, REMOVED }

class ProductHorizontalCard extends StatelessWidget {
  const ProductHorizontalCard({
    required this.product,
    this.style = ProductHorizontalCardStyle.NORMAL,
    super.key,
  });

  final Product product;
  final ProductHorizontalCardStyle style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            product.imageUrl,
            opacity: style == ProductHorizontalCardStyle.REMOVED
                ? const AlwaysStoppedAnimation(0.5)
                : const AlwaysStoppedAnimation(1),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    decoration: style == ProductHorizontalCardStyle.REMOVED
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          Text(
            product.price,
            style: TextStyle(
              decoration: style == ProductHorizontalCardStyle.REMOVED
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          )
        ],
      ),
    );
  }
}
