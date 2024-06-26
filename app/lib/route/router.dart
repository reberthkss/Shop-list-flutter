import 'package:shop_list/authentication/login/presentation/sign_in_page.dart';
import 'package:shop_list/authentication/register/presentation/register_page.dart';
import 'package:shop_list/authentication/tools/token_preferences.dart';
import 'package:shop_list/home/list/add/bulk_product_add/market_list_bulk_add_page.dart';
import 'package:shop_list/home/list/create/market_list_create_page.dart';
import 'package:shop_list/home/list/home/market_list_home.dart';
import 'package:shop_list/home/products/detail/page/product_detail_page.dart';
import 'package:shop_list/route/route_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../authentication/checkLogin/page/check_token_page.dart';
import '../authentication/redirect/redirect_page.dart';
import '../di/injection.dart';
import '../home/list/add/single_product_add/market_list_add_page.dart';
import '../home/list/detail/market_list_detail_page.dart';
import '../home/nested_navigator.dart';
import '../home/products/list/page/products_page.dart';

GoRouter router() {
  final RouteList routeList = getIt.get<RouteList>();
  final TokenPreferences tokenPreferences =
      getIt.get<TokenPreferences>();
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final productsNavigatorKey = GlobalKey<NavigatorState>();
  final shoppingListNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: routeList.authenticationList.redirect,
    routes: [
      GoRoute(
        path: routeList.authenticationList.redirect,
        builder: (ctx, state) => RedirectPage()
      ),
      GoRoute(
        path: routeList.authenticationList.login,
        builder: (context, state) => SignInPage(),
        routes: [
          GoRoute(
            path: routeList.authenticationList.loginOtp,
            builder: (context, state) {
              final username = state.extra as String ?? '';
              return CheckTokenPage(
                username: username,
                url: "/login/confirm",
                onSuccess: (String accessToken) {
                  tokenPreferences.saveAccessToken(accessToken)
                  .then((value) => context.go(routeList.productDetail.base));
                },
                onFail: () {},
              );
            },
          )
        ],
      ),
      GoRoute(
        path: routeList.authenticationList.register,
        builder: (context, state) => RegisterPage(),
        routes: [
          GoRoute(
            path: routeList.authenticationList.registerOtp,
            builder: (context, state) {
              final username = state.extra as String ?? '';
              return CheckTokenPage(
                username: username,
                url: "/register/confirm",
                onSuccess: (String accessToken) {
                  context.go(routeList.authenticationList.login);
                },
                onFail: () {},
              );
            },
          )
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => NestedNavigation(
          navigationShell: navigationShell,
        ),
        branches: [
          /*StatefulShellBranch(
            navigatorKey: _homeListNavigator,
            routes: [
              GoRoute(
                path: routeList.homeList.homeDashboard,
                builder: (context, state) {
                  return DashboardPage();
                },
              )
            ],
          ),*/
          StatefulShellBranch(
            navigatorKey: productsNavigatorKey,
            routes: [
              GoRoute(
                  path: routeList.productDetail.base,
                  builder: (context, state) {
                    return const ProductsPage();
                  },
                  routes: [
                    GoRoute(
                      path: routeList.productDetail.detail,
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (context, state) {
                        final String productId =
                            state.pathParameters['productId'] ?? '';
                        return ProductDetailPage(
                          productId: productId,
                          bloc: getIt.get(),
                        );
                      },
                    ),
                  ]),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shoppingListNavigatorKey,
            routes: [
              GoRoute(
                path: routeList.listRoute.base,
                builder: (context, state) {
                  return MarketListHome();
                },
                routes: [
                  GoRoute(
                    path: routeList.listRoute.addSingle,
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) {
                      final sku = state.uri.queryParameters['productSku'];
                      return MarketListAddPage(
                        productSku: sku,
                      );
                    },
                  ),
                  GoRoute(
                    path: routeList.listRoute.addBulk,
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) {
                      final marketListId =
                          state.pathParameters['marketListId'] ?? '';
                      return MarketListBulkAddPage(
                        marketListId: marketListId,
                      );
                    },
                  ),
                  GoRoute(
                    path: routeList.listRoute.detail,
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) {
                      final String marketListId =
                          state.pathParameters['marketListId'] ?? '';
                      return MarketListDetailPage(marketListId: marketListId);
                    },
                  ),
                  GoRoute(
                    path: routeList.listRoute.create,
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) {
                      return const MarketListCreatePage();
                    },
                  ),
                ],
              ),
            ],
          ),
          /*StatefulShellBranch(
            navigatorKey: _settingsNavigatorKey,
            routes: [
              GoRoute(
                path: routeList.homeList.homeSettings,
                builder: (context, state) {
                  return const SettingsPage();
                },
              )
            ],
          ),*/
        ],
      ),
    ],
  );
}
