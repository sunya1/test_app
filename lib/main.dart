import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/auth/cubit/auth_cubit.dart';
import 'package:test_app/di/di_locator.dart';
import 'package:test_app/launcher/cubit/launcher_cubit.dart';

import 'auth/ui/login_screen.dart';
import 'launcher/ui/launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: BlocProvider(create: (_) => LauncherCubit() , child: const LauncherScreen()),
    );
  }
}
