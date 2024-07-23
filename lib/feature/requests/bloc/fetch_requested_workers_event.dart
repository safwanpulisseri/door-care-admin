part of 'fetch_requested_workers_bloc.dart';

sealed class FetchRequestedWorkersEvent extends Equatable {
  const FetchRequestedWorkersEvent();

  @override
  List<Object> get props => [];
}

final class FetchRequestedWorkersDetailsEvent
    extends FetchRequestedWorkersEvent {}

final class AcceptRejectWorkerEvent extends FetchRequestedWorkersEvent {
  final String id;
  final String status;
  const AcceptRejectWorkerEvent({
    required this.id,
    required this.status,
  });
  @override
  List<Object> get props => [id, status];
}
