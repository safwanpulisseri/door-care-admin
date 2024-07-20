part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class CheckTokenEvent extends AuthEvent {}

final class SignOutEvent extends AuthEvent {}

final class EmailSignInAuthEvent extends AuthEvent {
  final String email;
  final String password;

  const EmailSignInAuthEvent({
    required this.email,
    required this.password,
  });
}
