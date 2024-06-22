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

import '../authentication/checkLogin/bloc/check_login_bloc.dart' as _i52;
import '../authentication/checkLogin/data/check_token_repository.dart' as _i33;
import '../authentication/checkLogin/data/check_token_service.dart' as _i19;
import '../authentication/checkLogin/domain/check_token_interactor.dart'
    as _i44;
import '../authentication/login/data/service/sign_in_service.dart' as _i16;
import '../authentication/login/data/sign_in_repository.dart' as _i31;
import '../authentication/login/domain/sign_in_interactor.dart' as _i43;
import '../authentication/login/presentation/sign_in_bloc.dart' as _i51;
import '../authentication/network/no_auth_network_module.dart' as _i55;
import '../authentication/redirect/redirect_bloc.dart' as _i28;
import '../authentication/register/data/register_repository.dart' as _i30;
import '../authentication/register/data/register_service.dart' as _i13;
import '../authentication/register/domain/register_interactor.dart' as _i42;
import '../authentication/register/presentation/register_bloc.dart' as _i50;
import '../authentication/tools/token_preferences.dart' as _i17;
import '../home/base/network/network_module.dart' as _i54;
import '../home/dashboard/bloc/dashboard_bloc.dart' as _i4;
import '../home/department/department_bloc.dart' as _i53;
import '../home/department/department_interactor.dart' as _i45;
import '../home/department/department_repository.dart' as _i34;
import '../home/department/department_service.dart' as _i20;
import '../home/list/add/bulk_product_add/bulk_add_cubit.dart' as _i32;
import '../home/list/add/single_product_add/market_list_add_bloc.dart' as _i35;
import '../home/list/add/single_product_add/market_list_add_interactor.dart'
    as _i24;
import '../home/list/add/single_product_add/market_list_add_repository.dart'
    as _i21;
import '../home/list/add/single_product_add/market_list_add_service.dart'
    as _i7;
import '../home/list/create/market_list_create_interactor.dart' as _i36;
import '../home/list/create/market_list_create_repository.dart' as _i22;
import '../home/list/create/market_list_create_service.dart' as _i8;
import '../home/list/create/market_list_home_create_bloc.dart' as _i38;
import '../home/list/detail/market_list_detail_cubit.dart' as _i46;
import '../home/list/detail/market_list_detail_interactor.dart' as _i37;
import '../home/list/detail/market_list_detail_repository.dart' as _i23;
import '../home/list/detail/market_list_detail_service.dart' as _i9;
import '../home/list/widget/market_list_view/market_list_view_bloc.dart'
    as _i47;
import '../home/list/widget/market_list_view/market_list_view_interactor.dart'
    as _i39;
import '../home/list/widget/market_list_view/market_list_view_repository.dart'
    as _i25;
import '../home/list/widget/market_list_view/market_list_view_service.dart'
    as _i10;
import '../home/products/detail/bloc/product_detail_bloc.dart' as _i48;
import '../home/products/detail/data/product_detail_repository.dart' as _i26;
import '../home/products/detail/data/product_detail_service.dart' as _i11;
import '../home/products/detail/domain/product_detail_interactor.dart' as _i40;
import '../home/products/list/bloc/products_bloc.dart' as _i49;
import '../home/products/list/bloc/products_by_department_bloc.dart' as _i5;
import '../home/products/list/products_interactor.dart' as _i41;
import '../home/products/list/products_repository.dart' as _i27;
import '../home/products/list/products_service.dart' as _i12;
import '../home/settings/bloc/settings_bloc.dart' as _i14;
import '../route/route_list.dart' as _i3;
import '../tools/interceptors/access_token_interceptor.dart' as _i18;
import '../tools/interceptors/refresh_token_interceptor.dart' as _i29;
import '../tools/shared_preferences/shared_preferences.dart' as _i15;

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
    gh.factory<_i13.RegisterService>(
        () => _i13.RegisterServiceImp(gh<_i6.Dio>(instanceName: 'NoAuthDio')));
    gh.singleton<_i3.RouteList>(_i3.RouteList(
      authenticationList: gh<_i3.AuthenticationRouteList>(),
      homeList: gh<_i3.HomeRouteList>(),
      productDetail: gh<_i3.ProductDetailRouteList>(),
      listRoute: gh<_i3.ListRoute>(),
    ));
    gh.factory<_i14.SettingsBloc>(() => _i14.SettingsBloc());
    gh.factory<_i15.ShopListSharedPreferences>(
        () => _i15.ShopListSharedPreferencesImpl());
    gh.factory<_i16.SignInService>(
        () => _i16.SignInServiceImpl(gh<_i6.Dio>(instanceName: 'NoAuthDio')));
    gh.factory<_i17.TokenPreferences>(
        () => _i17.TokenPreferencesImpl(gh<_i15.ShopListSharedPreferences>()));
    gh.singleton<_i18.AccessTokenInterceptor>(
        _i18.AccessTokenInterceptor(gh<_i17.TokenPreferences>()));
    gh.factory<_i19.CheckTokenService>(() =>
        _i19.CheckTokenServiceImpl(gh<_i6.Dio>(instanceName: 'NoAuthDio')));
    gh.factory<_i20.DepartmentService>(
        () => _i20.DepartmentServiceImpl(gh<_i6.Dio>()));
    gh.factory<_i21.MarketListAddRepository>(
        () => _i21.MarketListAddRepositoryImpl(gh<_i7.MarketListAddService>()));
    gh.factory<_i22.MarketListCreateRepository>(() =>
        _i22.MarketListCreateRepositoryImpl(gh<_i8.MarketListCreateService>()));
    gh.factory<_i23.MarketListDetailRepository>(() =>
        _i23.MarketListDetailRepositoryImpl(gh<_i9.MarketListDetailService>()));
    gh.factory<_i24.MarketListInteractor>(() =>
        _i24.MarketListInteractorImpl(gh<_i21.MarketListAddRepository>()));
    gh.factory<_i25.MarketListViewRepository>(() =>
        _i25.MarketListViewRepositoryImpl(gh<_i10.MarketListViewService>()));
    gh.factory<_i26.ProductDetailRepository>(() =>
        _i26.ProductDetailRepositoryImpl(gh<_i11.ProductDetailService>()));
    gh.factory<_i27.ProductsRepository>(
        () => _i27.ProductsRepositoryImpl(gh<_i12.ProductsService>()));
    gh.factory<_i28.RedirectBloc>(
        () => _i28.RedirectBloc(gh<_i17.TokenPreferences>()));
    gh.factory<_i29.RefreshTokenInterceptor>(() => _i29.RefreshTokenInterceptor(
          gh<_i3.RouteList>(),
          gh<_i17.TokenPreferences>(),
        ));
    gh.factory<_i30.RegisterRepository>(
        () => _i30.RegisterRepositoryImp(gh<_i13.RegisterService>()));
    gh.factory<_i31.SignInRepository>(
        () => _i31.SignInRepositoryImpl(gh<_i16.SignInService>()));
    gh.factory<_i32.BulkAddCubit>(
        () => _i32.BulkAddCubit(gh<_i24.MarketListInteractor>()));
    gh.factory<_i33.CheckTokenRepository>(
        () => _i33.CheckTokenRepositoryImpl(gh<_i19.CheckTokenService>()));
    gh.factory<_i34.DepartmentRepository>(
        () => _i34.DepartmentRepositoryImpl(gh<_i20.DepartmentService>()));
    gh.factory<_i35.MarketListAddBloc>(
        () => _i35.MarketListAddBloc(gh<_i24.MarketListInteractor>()));
    gh.factory<_i36.MarketListCreateInteractor>(() =>
        _i36.MarketListCreateInteractorImpl(
            gh<_i22.MarketListCreateRepository>()));
    gh.factory<_i37.MarketListDetailInteractor>(() =>
        _i37.MarketListDetailInteractorImpl(
            gh<_i23.MarketListDetailRepository>()));
    gh.factory<_i38.MarketListHomeCreateBloc>(() =>
        _i38.MarketListHomeCreateBloc(gh<_i36.MarketListCreateInteractor>()));
    gh.factory<_i39.MarketListViewInteractor>(() =>
        _i39.MarketListViewInteractorImpl(gh<_i25.MarketListViewRepository>()));
    gh.factory<_i40.ProductDetailInteractor>(() =>
        _i40.ProductDetailInteractorImpl(gh<_i26.ProductDetailRepository>()));
    gh.factory<_i41.ProductsInteractor>(
        () => _i41.ProductsInteractorImpl(gh<_i27.ProductsRepository>()));
    gh.factory<_i42.RegisterInteractor>(
        () => _i42.RegisterInteractorImp(gh<_i30.RegisterRepository>()));
    gh.factory<_i43.SignInInteractor>(
        () => _i43.SignInInteractorImpl(gh<_i31.SignInRepository>()));
    gh.factory<_i44.CheckTokenInteractor>(
        () => _i44.CheckTokenInteractorImpl(gh<_i33.CheckTokenRepository>()));
    gh.factory<_i45.DepartmentInteractor>(
        () => _i45.DepartmentInteractorImpl(gh<_i34.DepartmentRepository>()));
    gh.factory<_i46.MarketListDetailCubit>(() =>
        _i46.MarketListDetailCubit(gh<_i37.MarketListDetailInteractor>()));
    gh.factory<_i47.MarketListViewBloc>(
        () => _i47.MarketListViewBloc(gh<_i39.MarketListViewInteractor>()));
    gh.factory<_i48.ProductDetailBloc>(
        () => _i48.ProductDetailBloc(gh<_i40.ProductDetailInteractor>()));
    gh.factory<_i49.ProductsBloc>(
        () => _i49.ProductsBloc(gh<_i41.ProductsInteractor>()));
    gh.factory<_i50.RegisterBloc>(
        () => _i50.RegisterBloc(gh<_i42.RegisterInteractor>()));
    gh.factory<_i51.SignInBloc>(() => _i51.SignInBloc(
          gh<_i3.RouteList>(),
          gh<_i43.SignInInteractor>(),
        ));
    gh.factory<_i52.CheckLoginBloc>(
        () => _i52.CheckLoginBloc(gh<_i44.CheckTokenInteractor>()));
    gh.factory<_i53.DepartmentBloc>(
        () => _i53.DepartmentBloc(gh<_i45.DepartmentInteractor>()));
    return this;
  }
}

class _$NetworkModule extends _i54.NetworkModule {}

class _$NoAuthNetworkModule extends _i55.NoAuthNetworkModule {}
