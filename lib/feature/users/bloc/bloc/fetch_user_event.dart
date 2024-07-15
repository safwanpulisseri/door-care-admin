part of 'fetch_user_bloc.dart';

sealed class FetchUserEvent extends Equatable {
  const FetchUserEvent();

  @override
  List<Object> get props => [];
}

final class FetchUsersDetailsEvent extends FetchUserEvent {}
