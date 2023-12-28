import 'package:app/home/products/detail/bloc/product_detail_state.dart';
import 'package:app/home/products/detail/domain/product_detail_interactor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc(
    this.interactor,
  ) : super(Idle()) {
    on<RequestProductDetail>(requestDetail);
  }

  final ProductDetailInteractor interactor;

  void requestDetail(
    RequestProductDetail event,
    Emitter<ProductDetailState> emitter,
  ) async {
    try {
      emitter(LoadingProductDetail());
      final productDetail = await interactor.getProductDetail(event.productId);
      emitter(
        ShowProductDetail(
          productDetail: productDetail,
        ),
      );
    } catch (exception) {
      print(exception);
    }
  }
}
