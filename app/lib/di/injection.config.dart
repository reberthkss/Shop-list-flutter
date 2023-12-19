// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../authentication/checkLogin/bloc/check_login_bloc.dart' as _i4;
import '../authentication/login/data/login_repository.dart' as _i8;
import '../home/base/network/network_module.dart' as _i35;
import '../home/dashboard/bloc/dashboard_bloc.dart' as _i5;
import '../home/department/department_bloc.dart' as _i34;
import '../home/department/department_interactor.dart' as _i30;
import '../home/department/department_repository.dart' as _i23;
import '../home/department/department_service.dart' as _i16;
import '../home/list/add/market_list_add_bloc.dart' as _i24;
import '../home/list/add/market_list_add_interactor.dart' as _i19;
import '../home/list/add/market_list_add_repository.dart' as _i17;
import '../home/list/add/market_list_add_service.dart' as _i9;
import '../home/list/create/market_list_create_interactor.dart' as _i25;
import '../home/list/create/market_list_create_repository.dart' as _i18;
import '../home/list/create/market_list_create_service.dart' as _i10;
import '../home/list/create/market_list_home_create_bloc.dart' as _i26;
import '../home/list/detail/market_list_detail_cubit.dart' as _i11;
import '../home/list/widget/market_list_view/market_list_view_bloc.dart'
    as _i31;
import '../home/list/widget/market_list_view/market_list_view_interactor.dart'
    as _i27;
import '../home/list/widget/market_list_view/market_list_view_repository.dart'
    as _i20;
import '../home/list/widget/market_list_view/market_list_view_service.dart'
    as _i12;
import '../home/products/detail/bloc/product_detail_bloc.dart' as _i32;
import '../home/products/detail/data/product_detail_repository.dart' as _i21;
import '../home/products/detail/data/product_detail_service.dart' as _i13;
import '../home/products/detail/domain/product_detail_interactor.dart' as _i28;
import '../home/products/list/bloc/products_bloc.dart' as _i33;
import '../home/products/list/bloc/products_by_department_bloc.dart' as _i6;
import '../home/products/list/products_interactor.dart' as _i29;
import '../home/products/list/products_repository.dart' as _i22;
import '../home/products/list/products_service.dart' as _i14;
import '../home/settings/bloc/settings_bloc.dart' as _i15;
import '../route/route_list.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    gh.singleton<_i3.AuthenticationRouteList>(_i3.AuthenticationRouteList());
    gh.factory<_i4.CheckLoginBloc>(() => _i4.CheckLoginBloc());
    gh.factory<_i5.DashboardBloc>(() => _i5.DashboardBloc());
    gh.factory<_i6.DepartmentSelectorBloc>(() => _i6.DepartmentSelectorBloc());
    gh.factory<_i7.Dio>(() => networkModule.dio);
    gh.singleton<_i3.HomeRouteList>(_i3.HomeRouteList());
    gh.singleton<_i3.ListRoute>(_i3.ListRoute());
    gh.factory<_i8.LoginRepository>(() => _i8.LoginRepositoryImpl());
    gh.factory<_i9.MarketListAddService>(
        () => _i9.MarketListAddServiceImpl(gh<_i7.Dio>()));
    gh.factory<_i10.MarketListCreateService>(
        () => _i10.MarketListCreateServiceImpl(gh<_i7.Dio>()));
    gh.factory<_i11.MarketListDetailCubit>(() => _i11.MarketListDetailCubit());
    gh.factory<_i12.MarketListViewService>(
        () => _i12.MarketListViewServiceImpl(gh<_i7.Dio>()));
    gh.singleton<_i3.ProductDetailRouteList>(_i3.ProductDetailRouteList());
    gh.factory<_i13.ProductDetailService>(
        () => _i13.ProductDetailServiceImpl(gh<_i7.Dio>()));
    gh.factory<_i14.ProductsService>(
        () => _i14.ProductsServiceImpl(gh<_i7.Dio>()));
    gh.singleton<_i3.RouteList>(_i3.RouteList(
      authenticationList: gh<_i3.AuthenticationRouteList>(),
      homeList: gh<_i3.HomeRouteList>(),
      productDetail: gh<_i3.ProductDetailRouteList>(),
      listRoute: gh<_i3.ListRoute>(),
    ));
    gh.factory<_i15.SettingsBloc>(() => _i15.SettingsBloc());
    gh.factory<_i16.DepartmentService>(
        () => _i16.DepartmentServiceImpl(gh<_i7.Dio>()));
    gh.factory<_i17.MarketListAddRepository>(
        () => _i17.MarketListAddRepositoryImpl(gh<_i9.MarketListAddService>()));
    gh.factory<_i18.MarketListCreateRepository>(() =>
        _i18.MarketListCreateRepositoryImpl(
            gh<_i10.MarketListCreateService>()));
    gh.factory<_i19.MarketListInteractor>(() =>
        _i19.MarketListInteractorImpl(gh<_i17.MarketListAddRepository>()));
    gh.factory<_i20.MarketListViewRepository>(() =>
        _i20.MarketListViewRepositoryImpl(gh<_i12.MarketListViewService>()));
    gh.factory<_i21.ProductDetailRepository>(() =>
        _i21.ProductDetailRepositoryImpl(gh<_i13.ProductDetailService>()));
    gh.factory<_i22.ProductsRepository>(
        () => _i22.ProductsRepositoryImpl(gh<_i14.ProductsService>()));
    gh.factory<_i23.DepartmentRepository>(
        () => _i23.DepartmentRepositoryImpl(gh<_i16.DepartmentService>()));
    gh.factory<_i24.MarketListAddBloc>(
        () => _i24.MarketListAddBloc(gh<_i19.MarketListInteractor>()));
    gh.factory<_i25.MarketListCreateInteractor>(() =>
        _i25.MarketListCreateInteractorImpl(
            gh<_i18.MarketListCreateRepository>()));
    gh.factory<_i26.MarketListHomeCreateBloc>(() =>
        _i26.MarketListHomeCreateBloc(gh<_i25.MarketListCreateInteractor>()));
    gh.factory<_i27.MarketListViewInteractor>(() =>
        _i27.MarketListViewInteractorImpl(gh<_i20.MarketListViewRepository>()));
    gh.factory<_i28.ProductDetailInteractor>(() =>
        _i28.ProductDetailInteractorImpl(gh<_i21.ProductDetailRepository>()));
    gh.factory<_i29.ProductsInteractor>(
        () => _i29.ProductsInteractorImpl(gh<_i22.ProductsRepository>()));
    gh.factory<_i30.DepartmentInteractor>(
        () => _i30.DepartmentInteractorImpl(gh<_i23.DepartmentRepository>()));
    gh.factory<_i31.MarketListViewBloc>(
        () => _i31.MarketListViewBloc(gh<_i27.MarketListViewInteractor>()));
    gh.factory<_i32.ProductDetailBloc>(
        () => _i32.ProductDetailBloc(gh<_i28.ProductDetailInteractor>()));
    gh.factory<_i33.ProductsBloc>(
        () => _i33.ProductsBloc(gh<_i29.ProductsInteractor>()));
    gh.factory<_i34.DepartmentBloc>(
        () => _i34.DepartmentBloc(gh<_i30.DepartmentInteractor>()));
    return this;
  }
}

class _$NetworkModule extends _i35.NetworkModule {}
