part of 'fetch_requested_workers_bloc.dart';

sealed class FetchRequestedWorkersState extends Equatable {
  const FetchRequestedWorkersState();

  @override
  List<Object> get props => [];
}

final class FetchRequestedWorkersInitialState
    extends FetchRequestedWorkersState {}

final class FetchRequestedWorkersLoadingState
    extends FetchRequestedWorkersState {}

final class FetchRequestedWorkersSuccessState
    extends FetchRequestedWorkersState {
  final List<FetchWorkerModel> fetchWorkerModel;
  const FetchRequestedWorkersSuccessState({required this.fetchWorkerModel});
}

final class FetchRequestedWorkersFailState extends FetchRequestedWorkersState {}
