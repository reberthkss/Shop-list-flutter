import 'package:app/di/injection.dart';
import 'package:app/home/products/list/bloc/products_bloc.dart';
import 'package:app/route/route_list.dart';
import 'package:app/widgets/product_card/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductsListWidget extends StatelessWidget {
  ProductsListWidget({
    routeList,
    ProductsBloc? bloc,
    required this.selectedDepartmentId,
    super.key,
  })  : _routeList = routeList ?? getIt.get(),
        _bloc = bloc ?? getIt.get();
  final RouteList _routeList;
  final ProductsBloc _bloc;
  final controller = TrackingScrollController();
  final String selectedDepartmentId;

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
                              context.go(
                                _routeList.productDetail.getDetail(product.id),
                              );
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
