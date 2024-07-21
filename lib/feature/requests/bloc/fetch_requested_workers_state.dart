part of 'fetch_requested_workers_bloc.dart';

sealed class FetchRequestedWorkersState extends Equatable {
  const FetchRequestedWorkersState();
  
  @override
  List<Object> get props => [];
}

final class FetchRequestedWorkersInitial extends FetchRequestedWorkersState {}
