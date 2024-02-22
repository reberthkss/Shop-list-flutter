import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/injection.dart';
import '../bloc/check_login_bloc.dart';
import '../widgets/check_token_widget.dart';

class CheckTokenPage extends StatelessWidget {
  const CheckTokenPage({
    required this.username,
    required this.url,
    required this.onFail,
    required this.onSuccess,
    super.key,
  });

  final String username;
  final String url;
  final Function(String accessToken) onSuccess;
  final Function() onFail;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt.get<CheckLoginBloc>(),
      child: CheckTokenWidget(
        username: username,
        url: url,
        onSuccess: onSuccess,
        onFail: onFail,
      ),
    );
  }
}
