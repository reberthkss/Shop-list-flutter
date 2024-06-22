import 'package:shop_list/authentication/register/presentation/register_bloc.dart';
import 'package:shop_list/authentication/register/presentation/register_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../di/injection.dart';
import '../../../route/route_list.dart';
import '../../widgets/register_widget/register_widget.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({
    RegisterBloc? bloc,
    RouteList? routeList,
    super.key,
  })  : _bloc = bloc ?? getIt.get(),
        _routeList = routeList ?? getIt.get();

  final RegisterBloc _bloc;
  final RouteList _routeList;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (ctx) => _bloc,
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state.status == RegisterStatus.goToOtp) {
            print("Register page phone nhumber => ${state.payload?.phoneNumber}");
            context.push(
              _routeList.authenticationList.goToRegisterOtp(),
              extra: state.payload?.phoneNumber
            );
          }
        },
        builder: (context, state) {
          return RegisterWidget(
            registering: state.status == RegisterStatus.sendingForm,
            onRegister: (payload) {
              _bloc.add(
                Register(
                  payload: payload,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
