import 'package:app/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../domain/navigation_action.dart';
import 'sign_in_bloc.dart';
import '../domain/sign_in_status.dart';

class SignInPage extends StatelessWidget {
  SignInPage({required SignInBloc? bloc}) : _bloc = bloc ?? getIt.get();

  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
  final SignInBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (_) => _bloc,
      child: BlocConsumer<SignInBloc, SignInState>(
        builder: (ctx, state) {
          return Scaffold(
            body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Container(
                  height: 200,
                  margin: EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 16.0,
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _phoneNumberController,
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
                                  helperText: 'por exemplo: +5512997914991'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ctx.read<SignInBloc>().add(
                                        DoSignIn(
                                          phoneNumber:
                                              _phoneNumberController.text,
                                        ),
                                      );
                                }
                              },
                              child: state.status == SignInStatus.SIGNING
                                  ? CircularProgressIndicator()
                                  : Text('Continuar'),
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
        listener: (ctx, state) {
          if (state.navigationAction == null) {
            return;
          }
          if (state.navigationAction?.action == NavigationActionType.PUSH_TO) {
            context.push(
              state.navigationAction!.value,
            );
          }
        },
      ),
    );
  }
}
