import 'package:shop_list/authentication/redirect/redirect_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../di/injection.dart';
import '../../route/route_list.dart';

class RedirectPage extends StatelessWidget {
  final RouteList _routeList = getIt.get();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RedirectBloc>(
      create: (ctx) => getIt.get<RedirectBloc>()..add(RequestRedirect()),
      child: BlocListener<RedirectBloc, RedirectState>(
        listener: (context, state) {
          if (state.destination == null) return;

          if (state.destination == RedirectDestination.Home) {
            context.go(
              _routeList.productDetail.base
            );
          }

          if (state.destination == RedirectDestination.Login) {
            context.go(
              _routeList.authenticationList.login
            );
          }
        },
        child: Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ),
      ),
      );
  }
}
