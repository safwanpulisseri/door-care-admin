// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:doorcareadmin/feature/requests/data/model/requested_workers_model.dart';
import 'package:doorcareadmin/feature/requests/data/repository/fetch_requested_worker_repo.dart';
import 'package:equatable/equatable.dart';

part 'fetch_all_workers_event.dart';
part 'fetch_all_workers_state.dart';

class FetchAllWorkersBloc
    extends Bloc<FetchAllWorkersEvent, FetchAllWorkersState> {
  final FetchRequestedWorkerRepo _fetchRequestedWorkerRepo;
  FetchAllWorkersBloc(this._fetchRequestedWorkerRepo)
      : super(FetchAllWorkersInitialState()) {
    on<FetchAllWorkersEvent>((event, emit) async {
      try {
        emit(FetchAllWorkersLoadingState());
        final List<FetchWorkerModel> fetchAllWorkersModel =
            await _fetchRequestedWorkerRepo.fetchUsersAllDetails();
        final List<FetchWorkerModel> acceptedOrRejectedWorkers =
            fetchAllWorkersModel
                .where((worker) =>
                    worker.status == 'accept' || worker.status == 'reject')
                .toList();
        if (acceptedOrRejectedWorkers.isEmpty) {
          emit(FetchRequestedWorkersNoAcceptedOrRejectedWorkersState());
        } else {
          emit(FetchAllWorkersSuccessState(
              fetchAllWorkersModel: acceptedOrRejectedWorkers));
        }
      } catch (e) {
        emit(FetchAllWorkersFailState());
      }
    });
  }
}
