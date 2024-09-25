import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/auth_repo.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
  AuthBloc(this._authRepo) : super(AuthInitialState()) {
    on<CheckTokenEvent>(
      (event, emit) async {
        String? authToken;

        await Future.delayed(const Duration(seconds: 2)).whenComplete(() async {
          authToken = await _authRepo.getToken();
        });

        if (authToken != null) {
          emit(AuthSuccessState(token: authToken!));
        } else {
          log("no data found");
          emit(AuthFailState());
        }
      },
    );

    on<SignOutEvent>((event, emit) async {
      try {
        await _authRepo.signOut();
        emit(AuthSignedOutState());
      } catch (e) {
        emit(AuthFailState());
      }
    });

    on<EmailSignInAuthEvent>(
      (event, emit) async {
        emit(AuthLoadingState());
        try {
          final String token = await _authRepo.emailSignIn(
            email: event.email,
            password: event.password,
          );

          emit(AuthSuccessState(token: token));
        } catch (e) {
          emit(AuthFailState());
        }
      },
    );
  }
}
