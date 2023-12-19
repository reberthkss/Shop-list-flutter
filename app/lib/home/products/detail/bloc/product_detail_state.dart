
import '../data/product_detail_model.dart';

abstract class ProductDetailEvent {}

abstract class ProductDetailState {}

class RequestProductDetail extends ProductDetailEvent {
  RequestProductDetail({
    required this.productId,
  });
  final String productId;
}

class LoadingProductDetail extends ProductDetailState {}

class ShowProductDetail extends ProductDetailState {
  ShowProductDetail({
    required this.productDetail,
  });
  final ProductDetail productDetail;
}

class Idle extends ProductDetailState {}
