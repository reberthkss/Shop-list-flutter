import 'package:shop_list/home/products/list/products_interactor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../base/model/product_model.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(
    this.interactor,
  ) : super(Empty()) {
    on<RequestProducts>(
      (event, emit) async {
        try {
          emit(Loading());
          departmentId = event.departmentId;
          page = 1;
          final productList = await interactor.getProductsByDepartment(
            departmentId,
            page.toString(),
          );

          loadedProductList = productList;

          emit(
            Products(
              productList: loadedProductList,
            ),
          );
        } catch (exception) {
          print(exception);
        }
      },
    );
    on<LoadMore>(
      (event, emit) async {
        try {
          page++;
          final productList = await interactor.getProductsByDepartment(
            departmentId,
            page.toString(),
          );
          loadedProductList = [
            ...loadedProductList,
            ...productList,
          ];
          setProductList = loadedProductList;
          emit(
            Products(
              productList: sanitizedProductList,
            ),
          );
        } catch (exception) {
          print(exception);
        }
      },
    );

    on<Search>((event, emit) async {
      // todo - http request
      searchString = event.target;
      setProductList = loadedProductList;
      emit(
        Products(
          productList: sanitizedProductList,
        ),
      );
    });
  }

  List<Product> loadedProductList = [];
  String? searchString = "";
  List<Product> sanitizedProductList = [];
  String departmentId = "";
  int page = 1;

  final ProductsInteractor interactor;

  set setProductList(List<Product> productList) {
    sanitizedProductList = productList;

    if (searchString != null) {
      sanitizedProductList = sanitizedProductList
          .where(
            (product) => product.name.toLowerCase().contains(
                  searchString?.toLowerCase() ?? "",
                ),
          )
          .toList();
    }
  }
}

abstract class ProductsEvent {}

abstract class ProductsState {}

class Empty extends ProductsState {}

class Loading extends ProductsState {}

class Products extends ProductsState {
  Products({
    required this.productList,
  }) : super();
  final List<Product> productList;
}

class RequestProducts extends ProductsEvent {
  RequestProducts({
    required this.departmentId,
  });

  final String departmentId;
}

class LoadMore extends ProductsEvent {
  LoadMore({
    required this.departmentId,
  });
  final String departmentId;
}

class Search extends ProductsEvent {
  Search({required this.target});

  final String? target;
}
