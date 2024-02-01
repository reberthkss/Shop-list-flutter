// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../authentication/checkLogin/bloc/check_login_bloc.dart' as _i43;
import '../authentication/checkLogin/data/check_token_repository.dart' as _i26;
import '../authentication/checkLogin/data/check_token_service.dart' as _i15;
import '../authentication/checkLogin/domain/check_token_interactor.dart'
    as _i36;
import '../authentication/login/data/service/sign_in_service.dart' as _i14;
import '../authentication/login/data/sign_in_repository.dart' as _i24;
import '../authentication/login/domain/sign_in_interactor.dart' as _i35;
import '../authentication/login/presentation/sign_in_bloc.dart' as _i42;
import '../authentication/network/no_auth_network_module.dart' as _i46;
import '../home/base/network/network_module.dart' as _i45;
import '../home/dashboard/bloc/dashboard_bloc.dart' as _i4;
import '../home/department/department_bloc.dart' as _i44;
import '../home/department/department_interactor.dart' as _i37;
import '../home/department/department_repository.dart' as _i27;
import '../home/department/department_service.dart' as _i16;
import '../home/list/add/bulk_product_add/bulk_add_cubit.dart' as _i25;
import '../home/list/add/single_product_add/market_list_add_bloc.dart' as _i28;
import '../home/list/add/single_product_add/market_list_add_interactor.dart'
    as _i20;
import '../home/list/add/single_product_add/market_list_add_repository.dart'
    as _i17;
import '../home/list/add/single_product_add/market_list_add_service.dart'
    as _i7;
import '../home/list/create/market_list_create_interactor.dart' as _i29;
import '../home/list/create/market_list_create_repository.dart' as _i18;
import '../home/list/create/market_list_create_service.dart' as _i8;
import '../home/list/create/market_list_home_create_bloc.dart' as _i31;
import '../home/list/detail/market_list_detail_cubit.dart' as _i38;
import '../home/list/detail/market_list_detail_interactor.dart' as _i30;
import '../home/list/detail/market_list_detail_repository.dart' as _i19;
import '../home/list/detail/market_list_detail_service.dart' as _i9;
import '../home/list/widget/market_list_view/market_list_view_bloc.dart'
    as _i39;
import '../home/list/widget/market_list_view/market_list_view_interactor.dart'
    as _i32;
import '../home/list/widget/market_list_view/market_list_view_repository.dart'
    as _i21;
import '../home/list/widget/market_list_view/market_list_view_service.dart'
    as _i10;
import '../home/products/detail/bloc/product_detail_bloc.dart' as _i40;
import '../home/products/detail/data/product_detail_repository.dart' as _i22;
import '../home/products/detail/data/product_detail_service.dart' as _i11;
import '../home/products/detail/domain/product_detail_interactor.dart' as _i33;
import '../home/products/list/bloc/products_bloc.dart' as _i41;
import '../home/products/list/bloc/products_by_department_bloc.dart' as _i5;
import '../home/products/list/products_interactor.dart' as _i34;
import '../home/products/list/products_repository.dart' as _i23;
import '../home/products/list/products_service.dart' as _i12;
import '../home/settings/bloc/settings_bloc.dart' as _i13;
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
    final noAuthNetworkModule = _$NoAuthNetworkModule();
    gh.singleton<_i3.AuthenticationRouteList>(_i3.AuthenticationRouteList());
    gh.factory<_i4.DashboardBloc>(() => _i4.DashboardBloc());
    gh.factory<_i5.DepartmentSelectorBloc>(() => _i5.DepartmentSelectorBloc());
    gh.factory<_i6.Dio>(() => networkModule.dio);
    gh.factory<_i6.Dio>(
      () => noAuthNetworkModule.dio,
      instanceName: 'NoAuthDio',
    );
    gh.singleton<_i3.HomeRouteList>(_i3.HomeRouteList());
    gh.singleton<_i3.ListRoute>(_i3.ListRoute());
    gh.factory<_i7.MarketListAddService>(
        () => _i7.MarketListAddServiceImpl(gh<_i6.Dio>()));
    gh.factory<_i8.MarketListCreateService>(
        () => _i8.MarketListCreateServiceImpl(gh<_i6.Dio>()));
    gh.factory<_i9.MarketListDetailService>(
        () => _i9.MarketListDetailServiceImpl(gh<_i6.Dio>()));
    gh.factory<_i10.MarketListViewService>(
        () => _i10.MarketListViewServiceImpl(gh<_i6.Dio>()));
    gh.singleton<_i3.ProductDetailRouteList>(_i3.ProductDetailRouteList());
    gh.factory<_i11.ProductDetailService>(
        () => _i11.ProductDetailServiceImpl(gh<_i6.Dio>()));
    gh.factory<_i12.ProductsService>(
        () => _i12.ProductsServiceImpl(gh<_i6.Dio>()));
    gh.singleton<_i3.RouteList>(_i3.RouteList(
      authenticationList: gh<_i3.AuthenticationRouteList>(),
      homeList: gh<_i3.HomeRouteList>(),
      productDetail: gh<_i3.ProductDetailRouteList>(),
      listRoute: gh<_i3.ListRoute>(),
    ));
    gh.factory<_i13.SettingsBloc>(() => _i13.SettingsBloc());
    gh.factory<_i14.SignInService>(
        () => _i14.SignInServiceImpl(gh<_i6.Dio>(instanceName: 'NoAuthDio')));
    gh.factory<_i15.CheckTokenService>(
        () => _i15.CheckTokenServiceImpl(gh<_i6.Dio>()));
    gh.factory<_i16.DepartmentService>(
        () => _i16.DepartmentServiceImpl(gh<_i6.Dio>()));
    gh.factory<_i17.MarketListAddRepository>(
        () => _i17.MarketListAddRepositoryImpl(gh<_i7.MarketListAddService>()));
    gh.factory<_i18.MarketListCreateRepository>(() =>
        _i18.MarketListCreateRepositoryImpl(gh<_i8.MarketListCreateService>()));
    gh.factory<_i19.MarketListDetailRepository>(() =>
        _i19.MarketListDetailRepositoryImpl(gh<_i9.MarketListDetailService>()));
    gh.factory<_i20.MarketListInteractor>(() =>
        _i20.MarketListInteractorImpl(gh<_i17.MarketListAddRepository>()));
    gh.factory<_i21.MarketListViewRepository>(() =>
        _i21.MarketListViewRepositoryImpl(gh<_i10.MarketListViewService>()));
    gh.factory<_i22.ProductDetailRepository>(() =>
        _i22.ProductDetailRepositoryImpl(gh<_i11.ProductDetailService>()));
    gh.factory<_i23.ProductsRepository>(
        () => _i23.ProductsRepositoryImpl(gh<_i12.ProductsService>()));
    gh.factory<_i24.SignInRepository>(
        () => _i24.SignInRepositoryImpl(gh<_i14.SignInService>()));
    gh.factory<_i25.BulkAddCubit>(
        () => _i25.BulkAddCubit(gh<_i20.MarketListInteractor>()));
    gh.factory<_i26.CheckTokenRepository>(
        () => _i26.CheckTokenRepositoryImpl(gh<_i15.CheckTokenService>()));
    gh.factory<_i27.DepartmentRepository>(
        () => _i27.DepartmentRepositoryImpl(gh<_i16.DepartmentService>()));
    gh.factory<_i28.MarketListAddBloc>(
        () => _i28.MarketListAddBloc(gh<_i20.MarketListInteractor>()));
    gh.factory<_i29.MarketListCreateInteractor>(() =>
        _i29.MarketListCreateInteractorImpl(
            gh<_i18.MarketListCreateRepository>()));
    gh.factory<_i30.MarketListDetailInteractor>(() =>
        _i30.MarketListDetailInteractorImpl(
            gh<_i19.MarketListDetailRepository>()));
    gh.factory<_i31.MarketListHomeCreateBloc>(() =>
        _i31.MarketListHomeCreateBloc(gh<_i29.MarketListCreateInteractor>()));
    gh.factory<_i32.MarketListViewInteractor>(() =>
        _i32.MarketListViewInteractorImpl(gh<_i21.MarketListViewRepository>()));
    gh.factory<_i33.ProductDetailInteractor>(() =>
        _i33.ProductDetailInteractorImpl(gh<_i22.ProductDetailRepository>()));
    gh.factory<_i34.ProductsInteractor>(
        () => _i34.ProductsInteractorImpl(gh<_i23.ProductsRepository>()));
    gh.factory<_i35.SignInInteractor>(
        () => _i35.SignInInteractorImpl(gh<_i24.SignInRepository>()));
    gh.factory<_i36.CheckTokenInteractor>(
        () => _i36.CheckTokenInteractorImpl(gh<_i26.CheckTokenRepository>()));
    gh.factory<_i37.DepartmentInteractor>(
        () => _i37.DepartmentInteractorImpl(gh<_i27.DepartmentRepository>()));
    gh.factory<_i38.MarketListDetailCubit>(() =>
        _i38.MarketListDetailCubit(gh<_i30.MarketListDetailInteractor>()));
    gh.factory<_i39.MarketListViewBloc>(
        () => _i39.MarketListViewBloc(gh<_i32.MarketListViewInteractor>()));
    gh.factory<_i40.ProductDetailBloc>(
        () => _i40.ProductDetailBloc(gh<_i33.ProductDetailInteractor>()));
    gh.factory<_i41.ProductsBloc>(
        () => _i41.ProductsBloc(gh<_i34.ProductsInteractor>()));
    gh.factory<_i42.SignInBloc>(() => _i42.SignInBloc(
          gh<_i3.RouteList>(),
          gh<_i35.SignInInteractor>(),
        ));
    gh.factory<_i43.CheckLoginBloc>(
        () => _i43.CheckLoginBloc(gh<_i36.CheckTokenInteractor>()));
    gh.factory<_i44.DepartmentBloc>(
        () => _i44.DepartmentBloc(gh<_i37.DepartmentInteractor>()));
    return this;
  }
}

class _$NetworkModule extends _i45.NetworkModule {}

class _$NoAuthNetworkModule extends _i46.NoAuthNetworkModule {}
