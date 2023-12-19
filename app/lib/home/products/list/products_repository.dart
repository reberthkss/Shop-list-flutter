import 'package:app/home/base/model/product_model.dart';
import 'package:app/home/products/list/products_service.dart';
import 'package:injectable/injectable.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProductListByDepartment(
    String departmentId,
    String page,
  );
}

@Injectable(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  const ProductsRepositoryImpl(this.service);

  final ProductsService service;

  @override
  Future<List<Product>> getProductListByDepartment(
      String departmentId, String page) {
    return service.getProductListByDepartment(departmentId, page);
  }
}
