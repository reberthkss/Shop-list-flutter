import 'package:shop_list/home/department/department_dropdown/department_dropdown_widget.dart';
import 'package:shop_list/home/products/list/bloc/products_by_department_bloc.dart';
import 'package:shop_list/home/products/widgets/products_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/injection.dart';
import '../../base/model/product_model.dart';
import '../../department/department_bloc.dart';
import '../list/bloc/products_bloc.dart';

class ProductsByDepartmentWidget extends StatelessWidget {
  ProductsByDepartmentWidget({
    DepartmentSelectorBloc? departmentSelectorBloc,
    DepartmentBloc? departmentBloc,
    ProductsBloc? productsBloc,
    required this.onTapProduct,
    super.key,
  })  : _departmentSelectorBloc = departmentSelectorBloc ?? getIt.get(),
        _departmentBloc = departmentBloc ?? getIt.get(),
        _productsBloc = productsBloc ?? getIt.get();

  final DepartmentSelectorBloc _departmentSelectorBloc;
  final DepartmentBloc _departmentBloc;
  final ProductsBloc _productsBloc;
  final TextEditingController _searchController = TextEditingController();
  final Function(Product product) onTapProduct;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DepartmentSelectorBloc>(
      create: (_) => _departmentSelectorBloc,
      child: BlocBuilder<DepartmentSelectorBloc, DepartmentSelectorBlocState>(
        builder: (context, departmentSelectorState) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (_) => _departmentBloc
                    ..add(
                      LoadDepartments(),
                    )),
              BlocProvider<ProductsBloc>(
                create: (_) => _productsBloc,
              )
            ],
            child: Column(
              children: [
                DepartmentDropdownWidget(
                  onRequestDepartmentProduct: (departmentId) {
                    _departmentSelectorBloc.add(
                      SetDepartmentSelected(
                        selectedDepartmentId: departmentId.toString(),
                      ),
                    );
                  },
                ),
                BlocBuilder<ProductsBloc, ProductsState>(builder: (ctx, state) {
                  if (state.runtimeType == Products) {
                    return TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.clear,
                          ),
                          onPressed: () {
                            _searchController.clear();
                            _productsBloc.add(
                              Search(target: null),
                            );
                          },
                        ),
                        hintText: "Qual produto você busca?",
                      ),
                      onChanged: (value) {
                        _productsBloc.add(
                          Search(
                            target: value,
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                }),
                Expanded(
                  child: ProductsRenderer(
                    state: departmentSelectorState,
                    productsBloc: _productsBloc,
                    onTapProduct: onTapProduct,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProductsRenderer extends StatelessWidget {
  const ProductsRenderer({
    required this.state,
    required this.productsBloc,
    required this.onTapProduct,
    super.key,
  });

  final DepartmentSelectorBlocState state;
  final ProductsBloc productsBloc;
  final Function(Product product) onTapProduct;

  @override
  Widget build(BuildContext context) {
    if (state.runtimeType == SelectedDepartmentId) {
      final departmentId = (state as SelectedDepartmentId).selectedDepartmentId;
      return ProductsListWidget(
        bloc: productsBloc
          ..add(
            RequestProducts(
              departmentId: departmentId,
            ),
          ),
        selectedDepartmentId: departmentId,
        onTapProduct: onTapProduct,
      );
    }
    return const SizedBox.shrink();
  }
}
