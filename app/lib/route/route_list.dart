import 'package:injectable/injectable.dart';

@singleton
class RouteList {
  RouteList({
    required this.authenticationList,
    required this.homeList,
    required this.productDetail,
    required this.listRoute,
  });

  final AuthenticationRouteList authenticationList;
  final HomeRouteList homeList;
  final ProductDetailRouteList productDetail;
  final ListRoute listRoute;
  final home = "/";
}

@singleton
class AuthenticationRouteList {
  final String login = "/login";
  final String loginOtp = "/login/otp";
  final String register = "/register";
  final String registerOtp = "/register/otp";
  final String checkToken = "/checkToken";
}

@singleton
class HomeRouteList {
  final String homeDashboard = "/dashboard";
  final String homeSettings = "/settings";
}

@singleton
class ProductDetailRouteList {
  final String base = "/products";
  final String detail = "detail/:productId";

  String getDetail(String id) {
    return "$base/${detail.replaceAll(":productId", id)}";
  }
}

@singleton
class ListRoute {
  late final String base = "/market_list";
  late final String add = "add";
  late final String create = "create";
  late final String delete = "delete";
  late final String detail = "detail/:marketListId";
  late final String filter = "filter";
  late final String search = "search";
  late final String view = "view";

  String getDetail(String id) =>
      "$base/${detail.replaceAll(":marketListId", id)}";
  String getAdd([
    String? productSku = null,
  ]) {
    String route = "$base/$add";

    if (productSku != null) {
      route = "$route?productSku=$productSku";
    }
    return route;
  }

  String getDelete() => "$base/$delete";
  String getFilter() => "$base/$filter";
  String getSearch() => "$base/$search";
  String getView() => "$base/$view";
  String getCreate() => "$base/$create";
}
