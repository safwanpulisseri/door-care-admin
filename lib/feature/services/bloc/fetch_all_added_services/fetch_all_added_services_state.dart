part of 'fetch_all_added_services_bloc.dart';

sealed class FetchAllAddedServicesState extends Equatable {
  const FetchAllAddedServicesState();
  
  @override
  List<Object> get props => [];
}

final class FetchAllAddedServicesInitial extends FetchAllAddedServicesState {}
