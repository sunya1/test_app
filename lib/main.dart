import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_app/di/di_locator.dart';
import 'package:test_app/screens/home/cubit/acitivity_cubit.dart';
import 'package:test_app/screens/launcher/cubit/launcher_cubit.dart';
import 'package:test_app/screens/launcher/ui/launcher.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LauncherCubit()),
        BlocProvider(create: (context) => ActivitiesCubit()),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ru', ''), //Russia
        ],
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: const LauncherScreen(),
      ),
    );
  }
}
