part of 'add_service_bloc.dart';

sealed class AddServiceEvent extends Equatable {
  const AddServiceEvent();

  @override
  List<Object> get props => [];
}

final class AddNewServiceEvent extends AddServiceEvent {
  final String serviceName;
  final num firstHourCharge;
  final num laterHourCharge;
  final String description;
  final String serviceImg;
  const AddNewServiceEvent({
    required this.serviceName,
    required this.firstHourCharge,
    required this.laterHourCharge,
    required this.description,
    required this.serviceImg,
  });
}
