import 'package:flutter/material.dart';

import '../../base/model/product_model.dart';

enum ProductHorizontalCardStyle { normal, removed, checking }

class ProductHorizontalCard extends StatelessWidget {
  const ProductHorizontalCard({
    required this.product,
    this.style = ProductHorizontalCardStyle.normal,
    super.key,
  });

  final Product product;
  final ProductHorizontalCardStyle style;

  @override
  Widget build(BuildContext context) {
    double opacity;
    TextDecoration priceTextDecoration;
    TextDecoration productNameTextDecoration;
    Color priceTextColor;
    Color productNameColor;
    switch (style) {
      case ProductHorizontalCardStyle.normal:
        {
          opacity = 1;
          priceTextDecoration = productNameTextDecoration = TextDecoration.none;
          productNameColor = priceTextColor = Colors.black;

          break;
        }
      case ProductHorizontalCardStyle.removed:
        {
          opacity = 0.5;
          priceTextDecoration =
              productNameTextDecoration = TextDecoration.lineThrough;
          productNameColor = priceTextColor = Colors.red;
          break;
        }
      case ProductHorizontalCardStyle.checking:
        {
          opacity = 0.8;
          priceTextDecoration =
              productNameTextDecoration = TextDecoration.lineThrough;
          productNameColor = priceTextColor = Colors.green;

          break;
        }
      default:
        {
          opacity = 1;
          priceTextDecoration = productNameTextDecoration = TextDecoration.none;
          productNameColor = priceTextColor = Colors.black;
          break;
        }
    }
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            product.imageUrl,
            opacity: AlwaysStoppedAnimation(
              opacity,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                      decoration: productNameTextDecoration,
                      color: productNameColor),
                ),
              ],
            ),
          ),
          Text(
            product.price,
            style: TextStyle(
                decoration: priceTextDecoration, color: priceTextColor),
          )
        ],
      ),
    );
  }
}
