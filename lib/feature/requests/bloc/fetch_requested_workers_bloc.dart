import 'package:bloc/bloc.dart';
import 'package:doorcareadmin/feature/requests/data/model/requested_workers_model.dart';
import 'package:doorcareadmin/feature/requests/data/repository/fetch_requested_worker_repo.dart';
import 'package:equatable/equatable.dart';
part 'fetch_requested_workers_event.dart';
part 'fetch_requested_workers_state.dart';

class FetchRequestedWorkersBloc
    extends Bloc<FetchRequestedWorkersEvent, FetchRequestedWorkersState> {
  final FetchRequestedWorkerRepo _fetchRequestedWorkerRepo;
  FetchRequestedWorkersBloc(this._fetchRequestedWorkerRepo)
      : super(FetchRequestedWorkersInitialState()) {
    on<FetchRequestedWorkersEvent>((event, emit) async {
      emit(FetchRequestedWorkersLoadingState());
      try {
        final List<FetchWorkerModel> fetchWorkerModel =
            await _fetchRequestedWorkerRepo.fetchUsersAllDetails();
        final List<FetchWorkerModel> pendingWorkers = fetchWorkerModel
            .where((worker) => worker.status == 'pending')
            .toList();
        if (pendingWorkers.isEmpty) {
          emit(FetchRequestedWorkersNoPendingWorkersState());
        } else {
          emit(FetchRequestedWorkersSuccessState(
              fetchWorkerModel: pendingWorkers));
        }
      } catch (e) {
        emit(FetchRequestedWorkersFailState());
      }
    });
    on<AcceptRejectWorkerEvent>(
      (event, emit) async {
        emit(FetchRequestedWorkersLoadingState());
        try {
          await _fetchRequestedWorkerRepo.acceptRejectWorker(
              event.id, event.status);

          emit(FetchRequestedWorkersActionSuccessState());
          add(FetchRequestedWorkersDetailsEvent());
        } catch (e) {
          emit(FetchRequestedWorkersFailState());
        }
      },
    );
  }
}
