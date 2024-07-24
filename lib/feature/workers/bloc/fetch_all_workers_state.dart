part of 'fetch_all_workers_bloc.dart';

sealed class FetchAllWorkersState extends Equatable {
  const FetchAllWorkersState();

  @override
  List<Object> get props => [];
}

final class FetchAllWorkersInitialState extends FetchAllWorkersState {}

final class FetchAllWorkersLoadingState extends FetchAllWorkersState {}

final class FetchAllWorkersSuccessState extends FetchAllWorkersState {
  final List<FetchWorkerModel> fetchAllWorkersModel;
  const FetchAllWorkersSuccessState({required this.fetchAllWorkersModel});
}

final class FetchAllWorkersFailState extends FetchAllWorkersState {}

final class FetchRequestedWorkersNoAcceptedOrRejectedWorkersState
    extends FetchAllWorkersState {}
