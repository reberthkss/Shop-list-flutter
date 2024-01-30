import 'package:app/home/products/detail/bloc/product_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../di/injection.dart';
import '../bloc/product_detail_state.dart';
import '../widgets/product_detail_widget/product_detail_widget.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({
    required this.productId,
    ProductDetailBloc? bloc,
    super.key,
  }) : _bloc = bloc ?? getIt.get();

  final ProductDetailBloc _bloc;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: BlocProvider<ProductDetailBloc>(
        create: (_) => _bloc..add(RequestProductDetail(productId: productId)),
        child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case LoadingProductDetail:
                {
                  return const Center(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              case ShowProductDetail:
                {
                  state as ShowProductDetail;
                  return ProductDetailWidget(
                      productDetail: state.productDetail);
                }
              case Idle:
                {
                  return const CircularProgressIndicator();
                }
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
