import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/auth/cubit/auth_cubit.dart';
import 'package:test_app/auth/ui/login_screen.dart';
import 'package:test_app/home/home_screen.dart';
import 'package:test_app/launcher/cubit/launcher_cubit.dart';
import 'package:test_app/launcher/cubit/launcher_state.dart';

/// Страница для запуска приложения
/// в зависимости от состояния какую страницу нужно открыть при старте приложения
class LauncherScreen extends StatefulWidget {
  const LauncherScreen({Key? key}) : super(key: key);

  @override
  _LauncherScreenState createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      context.read<LauncherCubit>().checkForAccessToken();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<LauncherCubit, LauncherState>(
        builder: (context, state) {
          if (state is NotYetAuthorizedState) {
            return BlocProvider(create: (_) => AuthCubit(), child: const LoginScreen());
          }
          if (state is AuthorizedState) {
            return const HomeScreen();
          }
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        },
      );

 
}