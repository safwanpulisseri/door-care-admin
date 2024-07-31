import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_all_added_services_event.dart';
part 'fetch_all_added_services_state.dart';

class FetchAllAddedServicesBloc extends Bloc<FetchAllAddedServicesEvent, FetchAllAddedServicesState> {
  FetchAllAddedServicesBloc() : super(FetchAllAddedServicesInitial()) {
    on<FetchAllAddedServicesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
