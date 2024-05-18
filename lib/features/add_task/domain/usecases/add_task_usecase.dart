import 'package:dartz/dartz.dart';
import 'package:task_management_system/core/error/response_error.dart';
import 'package:task_management_system/core/usecase/usecase.dart';
import 'package:task_management_system/features/add_task/domain/entities/request/add_task_request_entity.dart';
import 'package:task_management_system/features/add_task/domain/repositories/add_taks_repo.dart';

class AddTaskUseCase extends UseCase<bool, AddTaskRequestEntity> {
  final AddTaskRepo addTaskRepo;
  AddTaskUseCase({required this.addTaskRepo});
  @override
  Future<Either<ResponseError, bool>> call(AddTaskRequestEntity params) {
    return addTaskRepo.addTask(requestEntity: params);
  }
}
