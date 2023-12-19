import 'package:app/home/settings/bloc/settings_bloc.dart';
import 'package:app/home/settings/widgets/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/injection.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SettingsBloc>(),
      child: const SettingsWidget(),
    );
  }
}
