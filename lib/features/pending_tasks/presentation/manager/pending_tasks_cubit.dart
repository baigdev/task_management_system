import 'package:bloc/bloc.dart';
import 'package:task_management_system/features/home/domain/usecases/get_tasks_usecase.dart';
import 'package:task_management_system/features/pending_tasks/presentation/manager/pending_tasks_state.dart';

class PendingTasksCubit extends Cubit<PendingTasksState> {
  PendingTasksCubit({required this.getTasksUseCase})
      : super(PendingTasksInitial());
  final GetTasksUseCase getTasksUseCase;

  getPendingTasks() async {
    emit(PendingTasksLoading());
    var res = await getTasksUseCase.repo.getTasks();
    res.fold((error) {
      emit(PendingTasksError(errorMsg: error.errorStatus));
    }, (success) {
      emit(PendingTasksLoaded(
          tasks: success.where((element) => element.status == 1).toList()));
    });
  }
}
