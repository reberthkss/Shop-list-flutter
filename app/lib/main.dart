import 'package:app/route/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'di/injection.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

final GoRouter goRouter = router();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Shop List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: goRouter,
    );
  }
}
