import 'dart:developer';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repository/add_services_repo.dart';
part 'add_service_event.dart';
part 'add_service_state.dart';

class AddServiceBloc extends Bloc<AddServiceEvent, AddServiceState> {
  final AddServicesRepo _addServicesRepo;
  AddServiceBloc(this._addServicesRepo) : super(AddServiceInitialState()) {
    on<AddNewServiceEvent>((event, emit) async {
      emit(AddServiceLoadingState());
      try {
        var response = await _addServicesRepo.addNewServices(
          serviceName: event.serviceName,
          firstHourCharge: event.firstHourCharge,
          laterHourCharge: event.laterHourCharge,
          description: event.description,
          serviceImg: event.serviceImg,
        );
        if (response.statusCode == 200) {
          emit(AddServiceSuccessState(data: response.data));
        } else {
          emit(AddServiceFailState());
          log('Add New Service failed: ${response.statusCode}');
          throw Exception('Add New Service  failed');
        }
      } catch (e) {
        log(e.toString());
        emit(AddServiceFailState());
      }
    });
  }
}
