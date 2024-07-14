part of 'fetch_user_bloc.dart';

sealed class FetchUserState extends Equatable {
  const FetchUserState();

  @override
  List<Object> get props => [];
}

final class FetchUserInitial extends FetchUserState {}
