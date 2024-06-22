import 'package:shop_list/authentication/register/domain/register_payload.dart';
import 'package:shop_list/authentication/widgets/register_widget/register_param.dart';
import 'package:flutter/material.dart';

class RegisterWidget extends StatelessWidget {
  RegisterWidget({
    required this.onRegister,
    required this.registering,
    super.key,
  });

  final void Function(RegisterPayload payload) onRegister;
  final bool registering;
  final formKey = GlobalKey<FormState>();

  RegisterPayload payload = RegisterPayload();

  List<RegisterParam> getRegisterParamList() {
    return [
      RegisterParam(
        labelText: "Qual seu nome?",
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Valor obrigatório";
          }
          return null;
        },
        onChange: (value) {
          payload = payload.copyWith(name: value);
        },
      ),
      RegisterParam(
        labelText: "Qual seu último nome?",
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Valor obrigatório";
          }

          return null;
        },
        onChange: (value) {
          payload = payload.copyWith(
            lastName: value,
          );
        },
      ),
      RegisterParam(
        labelText: "Qual seu email?",
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

          if (value == null || value.isEmpty) {
            return "Valor obrigatório";
          }

          if (!regex.hasMatch(value)) {
            return "Digite um e-mail válido!";
          }

          return null;
        },
        onChange: (value) {
          payload = payload.copyWith(email: value);
        },
      ),
      RegisterParam(
        labelText: "Qual é o número do seu celular?",
        keyboardType: TextInputType.phone,
        hint: 'Exemplo: +5512997914991',
        validator: (value) {
          final regex = RegExp(
            r'(\b\(\d{2}\)\s?[9]?\s?\d{4}(\-|\s)?\d\d{4})|(\b\d{2}\s?[9]?\s?\d{4}(\-|\s)?\d{4})|(\b([9]|[9]\s)?\d{4}(\-|\s)?\d{4})|(\b\d{4}(\-|\s)?\d{4})',
          );

          if (value == null || value.isEmpty) {
            return "Valor obrigatório";
          }

          if (!regex.hasMatch(value)) {
            return "Digite um telefone válido!";
          }

          return null;
        },
        onChange: (value) {
          payload = payload.copyWith(phoneNumber: value);
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final registerParamList = getRegisterParamList();
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (ctx, position) {
                        final registerParam = registerParamList[position];
                        return TextFormField(
                          keyboardType: registerParam.keyboardType,
                          validator: registerParam.validator,
                          onChanged: registerParam.onChange,
                          decoration: InputDecoration(
                            labelText: registerParam.labelText,
                            helperText: registerParam.hint,
                            border: const OutlineInputBorder(),
                          ),
                        );
                      },
                      separatorBuilder: (ctx, position) {
                        return const SizedBox(
                          height: 8.0,
                        );
                      },
                      itemCount: registerParamList.length,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState == null) {
                          return;
                        }

                        if (formKey.currentState!.validate()) {
                          onRegister(payload);
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: registering
                            ? CircularProgressIndicator()
                            : const Text(
                                "Continuar",
                              ),
                      ),
                    )
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
