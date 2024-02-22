import 'package:flutter/cupertino.dart';

class RegisterParam {
  const RegisterParam(
    {
      required this.labelText,
      required this.validator,
      required this.onChange,
      this.hint = '',
      this.keyboardType = TextInputType.text
    }
  );

  final String hint;
  final String labelText;
  final TextInputType keyboardType;
  final String? Function(String? value) validator;
  final void Function(String? value) onChange;
}