import 'package:doorcareadmin/app_view.dart';
import 'package:doorcareadmin/feature/auth/bloc/bloc/auth_bloc.dart';
import 'package:doorcareadmin/feature/auth/data/repository/auth_repo.dart';
import 'package:doorcareadmin/feature/auth/data/service/local/auth_local_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/auth/data/service/remote/auth_remote_service.dart';
import 'feature/navigation_menu/bloc/bloc/navigation_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => AuthRepo(
                  AuthRemoteService(),
                )),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(context.read<AuthRepo>()),
          ),
          BlocProvider(create: (create) => NavigationBloc()),
        ],
        child: const MyAppView(),
      ),
    );
  }
}
