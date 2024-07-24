part of 'fetch_all_workers_bloc.dart';

sealed class FetchAllWorkersEvent extends Equatable {
  const FetchAllWorkersEvent();

  @override
  List<Object> get props => [];
}

final class FetchAllWorkersDetilsEvent extends FetchAllWorkersEvent {}
