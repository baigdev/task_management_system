import 'package:dartz/dartz.dart';
import 'package:task_management_system/core/error/response_error.dart';
import 'package:task_management_system/core/usecase/usecase.dart';
import 'package:task_management_system/features/edit_task/domain/repositories/edit_task_repo.dart';

class EditTaskUseCase extends UseCase<bool, Map<String, dynamic>> {
  final EditTaskRepo editTaskRepo;
  EditTaskUseCase({required this.editTaskRepo});
  @override
  Future<Either<ResponseError, bool>> call(Map<String, dynamic> params) {
    return editTaskRepo.editTask(requestParams: params);
  }
}
