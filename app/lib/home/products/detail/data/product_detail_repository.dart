import 'package:app/home/products/detail/data/product_detail_model.dart';
import 'package:app/home/products/detail/data/product_detail_service.dart';
import 'package:injectable/injectable.dart';

abstract class ProductDetailRepository {
  Future<ProductDetail> getProductDetail(String sku);
}

@Injectable(as: ProductDetailRepository)
class ProductDetailRepositoryImpl implements ProductDetailRepository {
  ProductDetailRepositoryImpl(this.service);

  final ProductDetailService service;

  @override
  Future<ProductDetail> getProductDetail(String sku) async {
    return service.getProductDetail(sku);
  }
}
