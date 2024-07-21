import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_requested_workers_event.dart';
part 'fetch_requested_workers_state.dart';

class FetchRequestedWorkersBloc extends Bloc<FetchRequestedWorkersEvent, FetchRequestedWorkersState> {
  FetchRequestedWorkersBloc() : super(FetchRequestedWorkersInitial()) {
    on<FetchRequestedWorkersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
