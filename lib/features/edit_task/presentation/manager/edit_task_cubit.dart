import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_management_system/features/add_task/data/models/request/add_task_request_model.dart';
import 'package:task_management_system/features/edit_task/domain/usecases/edit_task_usecase.dart';
import 'package:task_management_system/features/edit_task/presentation/manager/edit_task_state.dart';
import 'package:task_management_system/features/home/domain/entities/response/task_response_entity.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit({required this.editTaskUseCase}) : super(EditTaskInitial());
  final EditTaskUseCase editTaskUseCase;

  // ================= Form Keys ===============================================
  GlobalKey<FormState> formKey = GlobalKey();
  // ===========================================================================

  // ================= Controllers =============================================
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  // ===========================================================================

  // =================== Nodes =================================================
  FocusNode titleNode = FocusNode();
  FocusNode descriptionNodeNode = FocusNode();
  FocusNode dueDateNodeNode = FocusNode();
// =============================================================================

  editTask(
      {required int id,
      required String docRefId,
      final bool status = false}) async {
    emit(EditingTask());
    var res = await editTaskUseCase.editTaskRepo.editTask(requestParams: {
      "task": AddTaskRequestModel(
        id: id,
        title: titleController.text,
        description: descriptionController.text,
        dueDate: dueDateController.text,
        status: status ? 1 : 0,
      ),
      "docRefId": docRefId,
    });
    res.fold((error) {
      emit(EditTaskError(errorMsg: error.errorStatus));
    }, (success) {
      emit(EditedTask(msg: "Task Successfully edited"));
    });
  }

  initialize(TaskResponseEntity responseEntity) {
    titleController.text = responseEntity.title ?? "";
    descriptionController.text = responseEntity.description ?? "";
    dueDateController.text = responseEntity.dueDate ?? "";
  }
}
