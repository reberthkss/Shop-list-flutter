import 'package:shop_list/home/products/detail/data/product_detail_repository.dart';
import 'package:injectable/injectable.dart';

import '../data/product_detail_model.dart';

abstract class ProductDetailInteractor {
  Future<ProductDetail> getProductDetail(String sku);
}

@Injectable(as: ProductDetailInteractor)
class ProductDetailInteractorImpl implements ProductDetailInteractor {
  const ProductDetailInteractorImpl(this.repository);

  final ProductDetailRepository repository;

  @override
  Future<ProductDetail> getProductDetail(String sku) async {
    return repository.getProductDetail(sku);
  }
}
