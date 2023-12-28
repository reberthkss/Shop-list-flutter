import 'package:app/authentication/checkLogin/bloc/check_login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../di/injection.dart';
import '../../../route/route_list.dart';

class CheckTokenWidget extends StatelessWidget {
  const CheckTokenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckLoginBloc, CheckLoginState>(
      builder: (context, state) {
        return Center(
          child: GestureDetector(
            child: const Text("GO TO HOME"),
            onTap: () {
              context.go(getIt.get<RouteList>().homeList.homeDashboard);
            },
          ),
        );
      },
    );
  }
}
