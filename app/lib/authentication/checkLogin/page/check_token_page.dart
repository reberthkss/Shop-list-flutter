import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/injection.dart';
import '../bloc/check_login_bloc.dart';
import '../widgets/check_token_widget.dart';

class CheckTokenPage extends StatelessWidget {
  const CheckTokenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt.get<CheckLoginBloc>(),
      child: const CheckTokenWidget(),
    );
  }
}
