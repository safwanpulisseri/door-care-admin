import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doorcareadmin/app_view.dart';
import 'feature/services/data/repository/add_services_repo.dart';
import 'feature/services/data/repository/fetch_all_service_repo.dart';
import 'feature/auth/data/service/local/auth_local_service.dart';
import 'feature/auth/data/service/remote/auth_remote_service.dart';
import 'feature/services/bloc/add_service/add_service_bloc.dart';
import 'feature/navigation_menu/bloc/bloc/navigation_bloc.dart';
import 'feature/requests/bloc/fetch_requested_workers_bloc.dart';
import 'package:doorcareadmin/feature/auth/bloc/bloc/auth_bloc.dart';
import 'feature/users/data/service/remote/fetch_user_remote_service.dart';
import 'package:doorcareadmin/feature/auth/data/repository/auth_repo.dart';
import 'package:doorcareadmin/feature/users/bloc/bloc/fetch_user_bloc.dart';
import 'package:doorcareadmin/feature/users/data/repository/fetch_user_repo.dart';
import 'package:doorcareadmin/feature/workers/bloc/fetch_all_workers_bloc.dart';
import 'feature/requests/data/repository/fetch_requested_worker_repo.dart';
import 'feature/requests/data/service/remote/remote_service_fetch_requested_worker.dart';
import 'feature/services/bloc/fetch_all_added_services/fetch_all_added_services_bloc.dart';
import 'feature/services/data/services/remote/add_services_remote_service.dart';
import 'feature/services/data/services/remote/fetch_all_services_remote_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => AuthRepo(
                  AuthRemoteService(),
                  AuthLocalService(),
                )),
        RepositoryProvider(
            create: (context) => FetchUserRepo(
                  UserRemoteService(),
                  AuthLocalService(),
                )),
        RepositoryProvider(
            create: (context) => FetchRequestedWorkerRepo(
                  RequestedWorkerRemoteService(),
                  AuthLocalService(),
                )),
        RepositoryProvider(
            create: (context) => AddServicesRepo(
                  AddServicesRemoteService(),
                  AuthLocalService(),
                )),
        RepositoryProvider(
            create: (context) => FetchAllServiceRepo(
                  FetchAllServicesRemoteService(),
                ))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBloc(context.read<AuthRepo>())..add(CheckTokenEvent()),
          ),
          BlocProvider(create: (create) => NavigationBloc()),
          BlocProvider(
            create: (context) => FetchUserBloc(context.read<FetchUserRepo>()),
          ),
          BlocProvider(
            create: (context) => FetchRequestedWorkersBloc(
                context.read<FetchRequestedWorkerRepo>()),
          ),
          BlocProvider(
            create: (context) =>
                FetchAllWorkersBloc(context.read<FetchRequestedWorkerRepo>()),
          ),
          BlocProvider(
            create: (context) =>
                AddServiceBloc(context.read<AddServicesRepo>()),
          ),
          BlocProvider(
            create: (context) =>
                FetchAllAddedServicesBloc(context.read<FetchAllServiceRepo>()),
          )
        ],
        child: const MyAppView(),
      ),
    );
  }
}
