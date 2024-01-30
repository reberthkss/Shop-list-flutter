import 'package:app/authentication/checkLogin/domain/navigation_action.dart';
import 'package:app/authentication/checkLogin/domain/sign_in_bloc.dart';
import 'package:app/authentication/checkLogin/domain/sign_in_status.dart';
import 'package:app/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  SignInPage({required SignInBloc? bloc}) : _bloc = bloc ?? getIt.get();

  final _formKey = GlobalKey<FormState>();
  final SignInBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (_) => _bloc,
      child: BlocConsumer<SignInBloc, SignInState>(
        builder: (ctx, state) {
          return Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.red,
              child: Center(
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Column(
                    children: [
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if ((value?.isEmpty ?? false) ||
                                      (value?.length ?? 0) < 11) {
                                    return 'Informe um número de telefone com pelo menos 11 caracteres';
                                  }

                                  return null;
                                },
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Telefone',
                                    helperText: 'por exemplo: 12997914991'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    ctx
                                        .read<SignInBloc>()
                                        .add(SubmitFormEvent());
                                  }
                                },
                                child: state.status == SignInStatus.SIGNING
                                    ? CircularProgressIndicator()
                                    : Text('Continuar'),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (ctx, state) {
          if (state.navigationAction == null) {
            return;
          }
          if (state.navigationAction?.action == NavigationActionType.PUSH_TO) {
            context.push(state.navigationAction!.value);
          }
        },
      ),
    );
  }
}
