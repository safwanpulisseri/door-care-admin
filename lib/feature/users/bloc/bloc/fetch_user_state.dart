part of 'fetch_user_bloc.dart';

sealed class FetchUserState extends Equatable {
  const FetchUserState();

  @override
  List<Object> get props => [];
}

final class FetchUserInitialState extends FetchUserState {}

final class FetchLoadingState extends FetchUserState {}

final class FetchSuccessState extends FetchUserState {
  final FetchUserModel fetchUserModel;

  const FetchSuccessState({required this.fetchUserModel});
}

final class AuthFailState extends FetchUserState {}
