import 'package:app/authentication/checkLogin/bloc/check_login_bloc.dart';
import 'package:app/authentication/checkLogin/bloc/check_login_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../di/injection.dart';
import '../../../route/route_list.dart';

class CheckTokenWidget extends StatelessWidget {
  CheckTokenWidget({
    RouteList? routeList,
    super.key,
  }) : _routeList = routeList ?? getIt.get();

  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController.fromValue(
    TextEditingValue(),
  );
  final RouteList _routeList;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckLoginBloc, CheckLoginState>(
      listener: (ctx, state) {
        if (state.status == CheckLoginStatus.VALIDATION_SUCCESS) {
          context.go(
            _routeList.productDetail.base
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Container(
                height: 200,
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 16.0,
                ),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _controller,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              value!;

                              if (value.isEmpty || value.length < 4) {
                                return "Código deve ter 4 digitos";
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Digite Código recebido via SMS",
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate.call() ??
                                  false) {
                                context.read<CheckLoginBloc>().add(
                                      ValidateOTP(
                                        otp: _controller.text,
                                      ),
                                    );
                              }
                            },
                            child:
                                state.status == CheckLoginStatus.VALIDATING_OTP
                                    ? CircularProgressIndicator()
                                    : Text(
                                        "Confirmar",
                                      ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
