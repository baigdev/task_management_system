import 'package:dartz/dartz.dart';
import 'package:task_management_system/core/error/response_error.dart';
import 'package:task_management_system/features/add_task/domain/entities/request/add_task_request_entity.dart';

abstract class AddTaskRepo {
  Future<Either<ResponseError, bool>> addTask(
      {required AddTaskRequestEntity requestEntity});
}
