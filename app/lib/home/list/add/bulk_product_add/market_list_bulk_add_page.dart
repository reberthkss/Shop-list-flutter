import 'package:app/home/list/add/bulk_product_add/bulk_add_cubit.dart';
import 'package:app/widgets/button/button_extended.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../di/injection.dart';
import '../../../../route/route_list.dart';
import '../../../base/model/product_model.dart';
import '../../../products/widgets/product_horizontal_card_widget.dart';
import '../../../products/widgets/products_by_department_widget.dart';

class MarketListBulkAddPage extends StatelessWidget {
  MarketListBulkAddPage({
    RouteList? routeList,
    BulkAddCubit? cubit,
    required this.marketListId,
    super.key,
  })  : _routeList = routeList ?? getIt.get(),
        _cubit = cubit ?? getIt.get();

  final RouteList _routeList;
  final _controller = DraggableScrollableController();
  final BulkAddCubit _cubit;
  final String marketListId;

  double getTotal(List<Product> productList) {
    return productList.fold(
      0.0,
      (total, product) => total + (double.tryParse(product.price) ?? 0.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BulkAddCubit>(
      create: (_) => _cubit,
      child: Scaffold(
        body: Stack(
          children: [
            ProductsByDepartmentWidget(
              onTapProduct: (product) {
                _cubit.add(
                  Add(
                    product: product,
                  ),
                );
              },
            ),
            DraggableScrollableSheet(
              controller: _controller,
              initialChildSize: 0.15,
              maxChildSize: 1,
              minChildSize: 0.15,
              expand: true,
              snap: true,
              snapSizes: [0.5],
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return BlocBuilder<BulkAddCubit, BulkAddState>(
                  builder: (ctx, state) {
                    return DecoratedBox(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: CustomScrollView(
                        controller: scrollController,
                        slivers: [
                          const SliverToBoxAdapter(
                            child: Text('Produtos Selecionados'),
                          ),
                          SliverList.builder(
                            itemCount: state.selectedProductList.length,
                            itemBuilder: (ctx, index) {
                              final Product product =
                                  state.selectedProductList[index];
                              return ProductHorizontalCard(
                                product: product,
                              );
                            },
                          ),
                          SliverToBoxAdapter(
                            child: Text(
                              "Total: R\$ ${getTotal(state.selectedProductList)}",
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ButtonExtended(
                onPressed: () {
                  _cubit.add(
                    Confirm(marketListId: marketListId),
                  );
                  context.pop();
                },
                text: "Confirmar",
              ),
            )
          ],
        ),
      ),
    );
  }
}
