import 'package:shop_list/authentication/checkLogin/bloc/check_login_bloc.dart';
import 'package:shop_list/authentication/checkLogin/bloc/check_login_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../di/injection.dart';
import '../../../route/route_list.dart';

class CheckTokenWidget extends StatelessWidget {
  CheckTokenWidget({
    required this.username,
    required this.url,
    required this.onSuccess,
    required this.onFail,
    RouteList? routeList,
    super.key,
  });

  final String username;
  final String url;
  final Function(String accessToken) onSuccess;
  final Function() onFail;

  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController.fromValue(
    const TextEditingValue(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckLoginBloc, CheckLoginState>(
      listener: (ctx, state) {
        if (state.status == CheckLoginStatus.validationSuccess) {
          onSuccess(state.accessToken ?? '');
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Container(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
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
                            decoration: const InputDecoration(
                              labelText: "Digite Código recebido via SMS",
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate.call() ??
                                  false) {
                                context.read<CheckLoginBloc>().add(
                                      ValidateOTP(
                                        username: username,
                                        otp: _controller.text,
                                        url: url
                                      ),
                                    );
                              }
                            },
                            child:
                                state.status == CheckLoginStatus.validatingOTP
                                    ? const CircularProgressIndicator()
                                    : const Text(
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
