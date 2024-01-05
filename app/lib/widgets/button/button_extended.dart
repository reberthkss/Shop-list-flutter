import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonExtended extends StatelessWidget {
  const ButtonExtended({
    required this.onPressed,
    required this.text,
    super.key,
  });

  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: const ButtonStyle(),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
