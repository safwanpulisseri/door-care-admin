part of 'fetch_requested_workers_bloc.dart';

sealed class FetchRequestedWorkersEvent extends Equatable {
  const FetchRequestedWorkersEvent();

  @override
  List<Object> get props => [];
}

final class FetchRequestedWorkersDetailsEvent
    extends FetchRequestedWorkersEvent {}
