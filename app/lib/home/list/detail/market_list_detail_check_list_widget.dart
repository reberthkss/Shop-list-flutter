import 'package:shop_list/home/base/model/product_occurrences_model.dart';
import 'package:shop_list/home/products/widgets/product_horizontal_card_widget.dart';
import 'package:flutter/material.dart';

import '../../base/model/product_model.dart';

class MarketListDetailCheckListWidget extends StatelessWidget {
  const MarketListDetailCheckListWidget({
    required this.productList,
    required this.checkedProducts,
    required this.onCheck,
    super.key,
  });

  final List<ProductOccurrencesModel> productList;
  final List<Product> checkedProducts;
  final Function(Product product) onCheck;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final productOccurence = productList[index];
          final isChecked = checkedProducts.indexWhere(
                (checkedProduct) =>
                    checkedProduct.id == productOccurence.product.id,
              ) !=
              -1;
          return Row(
            children: [
              Text(
                productOccurence.occurences.toString(),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    onCheck(productOccurence.product);
                  },
                  child: ProductHorizontalCard(
                    product: productOccurence.product,
                    style: isChecked
                        ? ProductHorizontalCardStyle.checking
                        : ProductHorizontalCardStyle.normal,
                  ),
                ),
              )
            ],
          );
        });
  }
}
