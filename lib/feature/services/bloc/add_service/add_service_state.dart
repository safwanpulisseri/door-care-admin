part of 'add_service_bloc.dart';

sealed class AddServiceState extends Equatable {
  const AddServiceState();

  @override
  List<Object> get props => [];
}

final class AddServiceInitialState extends AddServiceState {}

final class AddServiceLoadingState extends AddServiceState {}

final class AddServiceSuccessState extends AddServiceState {
  final dynamic data;
  const AddServiceSuccessState({this.data});
}

final class AddServiceFailState extends AddServiceState {}
