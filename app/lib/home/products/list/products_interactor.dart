import 'package:shop_list/home/base/model/product_model.dart';
import 'package:shop_list/home/products/list/products_repository.dart';
import 'package:injectable/injectable.dart';

abstract class ProductsInteractor {
  Future<List<Product>> getProductsByDepartment(
    String departmentId,
    String page,
  );
}

@Injectable(as: ProductsInteractor)
class ProductsInteractorImpl implements ProductsInteractor {
  ProductsInteractorImpl(
    this.repository,
  );

  final ProductsRepository repository;

  @override
  Future<List<Product>> getProductsByDepartment(
    String departmentId,
    String page,
  ) {
    return repository.getProductListByDepartment(
      departmentId,
      page,
    );
  }
}
