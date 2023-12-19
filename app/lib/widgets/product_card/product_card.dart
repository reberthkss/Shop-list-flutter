import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../home/base/model/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    required this.onTap,
  });

  final Product product;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Image.network(
                    product.imageUrl,
                    height: 100,
                    width: 100,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.green),
                    child: Text(product.price),
                  )
                ],
              ),
            ),
            Text(product.name)
          ],
        ),
      ),
    );
  }
}
