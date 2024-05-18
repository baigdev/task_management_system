import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management_system/features/add_task/domain/entities/request/add_task_request_entity.dart';
import 'package:task_management_system/features/add_task/domain/usecases/add_task_usecase.dart';
import 'package:task_management_system/features/add_task/presentation/manager/add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit({required this.addTaskUseCase}) : super(AddTaskInitial());
  final AddTaskUseCase addTaskUseCase;
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
  // ===========================================================================

  addTask(bool status) async {
    emit(UploadingTask());
    var res = await addTaskUseCase.addTaskRepo.addTask(
      requestEntity: AddTaskRequestEntity(
        id: DateTime.now().microsecondsSinceEpoch,
        title: titleController.text,
        description: descriptionController.text,
        status: status ? 1 : 0,
        dueDate: dueDateController.text,
      ),
    );
    res.fold((error) {
      emit(AddTaskError(errorMsg: error.errorStatus));
    }, (success) {
      emit(UploadedTask(msg: "Task successfully uploaded"));
      clearFormData();
    });
  }

  clearFormData() {
    titleController.clear();
    descriptionController.clear();
    dueDateController.clear();
  }

  dispose() {
    clearFormData();
  }
}
