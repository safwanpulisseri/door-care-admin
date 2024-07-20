import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/model/fetch_user_model.dart';
import '../../data/repository/fetch_user_repo.dart';
part 'fetch_user_event.dart';
part 'fetch_user_state.dart';

class FetchUserBloc extends Bloc<FetchUserEvent, FetchUserState> {
  final FetchUserRepo _fetchUserRepo;
  FetchUserBloc(this._fetchUserRepo) : super(FetchUserInitialState()) {
    on<FetchUsersDetailsEvent>((event, emit) async {
      emit(FetchLoadingState());
      try {
        final FetchUserModel fetchUserModel =
            await _fetchUserRepo.fetchUsersAllDetails();

        emit(FetchSuccessState(fetchUserModel: fetchUserModel));
      } catch (e) {
        emit(AuthFailState());
      }
    });
  }
}
