import 'package:shop_list/di/injection.dart';
import 'package:shop_list/home/products/list/bloc/products_bloc.dart';
import 'package:shop_list/widgets/product_card/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/model/product_model.dart';

class ProductsListWidget extends StatelessWidget {
  ProductsListWidget({
    routeList,
    ProductsBloc? bloc,
    required this.selectedDepartmentId,
    required this.onTapProduct,
    super.key,
  }) : _bloc = bloc ?? getIt.get();
  
  final ProductsBloc _bloc;
  final controller = TrackingScrollController();
  final String selectedDepartmentId;
  final Function(Product product) onTapProduct;

  void handlePagination(ProductsBloc bloc) {
    if (controller.position.maxScrollExtent == controller.offset) {
      bloc.add(
        LoadMore(
          departmentId: selectedDepartmentId,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        controller.removeListener(() {
          handlePagination(_bloc);
        });
        controller.addListener(() {
          handlePagination(_bloc);
        });

        switch (state.runtimeType) {
          case Loading:
            {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              );
            }
          case Products:
            {
              state as Products;
              return CustomScrollView(
                controller: controller,
                slivers: [
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = state.productList[index];
                        return ProductCard(
                            product: product,
                            onTap: () {
                              onTapProduct(product);
                            });
                      },
                      childCount: state.productList.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                        ],
                      ),
                      childCount: 1,
                    ),
                  )
                ],
              );
            }
          default:
            {
              return const SizedBox.shrink();
            }
        }
      },
    );
  }
}
