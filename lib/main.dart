import 'package:calley/core/config/theme.dart';
import 'package:calley/core/network/api_client.dart';
import 'package:calley/features/Dashboard/data/data_repository.dart';
import 'package:calley/features/Dashboard/data/services/data_service.dart';
import 'package:calley/features/Dashboard/presentation/bloc/list_bloc.dart';
import 'package:calley/features/authentication/data/auth_repository.dart';
import 'package:calley/features/authentication/data/services/auth_service.dart';
import 'package:calley/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:calley/features/authentication/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/config/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthBloc(AuthRepository(AuthService(ApiClient()))),
        ),
        BlocProvider(
          create: (context) =>
              LoginBloc(AuthRepository(AuthService(ApiClient()))),
        ),
        BlocProvider(
          create: (context) =>
              ListBloc(DataRepository(DataService(ApiClient()))),
        ),
      ],
      child: MaterialApp.router(
        title: 'Calley App',
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        theme: themeData,
      ),
    );
  }
}
