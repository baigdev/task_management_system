import 'package:bloc/bloc.dart';
import 'package:task_management_system/features/home/domain/usecases/delete_task_usecase.dart';
import 'package:task_management_system/features/home/domain/usecases/get_tasks_usecase.dart';
import 'package:task_management_system/features/home/presentation/manager/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.getTasksUseCase, required this.deleteTaskUseCase})
      : super(HomeInitial());
  final GetTasksUseCase getTasksUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;
  getTaskFromServer() async {
    emit(HomeLoading());
    var res = await getTasksUseCase.repo.getTasks();
    res.fold((error) {
      emit(HomeError(errorMsg: error.errorStatus));
    }, (success) {
      emit(HomeLoaded(tasks: success));
    });
  }

  deleteTask(int taskID, String docRefId, HomeLoaded state) async {
    emit(HomeLoaded(tasks: state.tasks, deletingTask: true));
    var res = await deleteTaskUseCase.homeRepo
        .deleteTask(taskId: taskID.toString(), docRefID: docRefId);
    res.fold((error) {
      emit(HomeLoaded(tasks: state.tasks, msg: error.errorStatus));
    }, (success) {
      state.tasks.removeWhere((element) => element.docID == docRefId);
      emit(HomeLoaded(
          tasks: state.tasks,
          msg: "Task deleted successfully",
          deletingTask: false));
    });
  }
}
