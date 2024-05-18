import 'package:dartz/dartz.dart';
import 'package:task_management_system/core/error/response_error.dart';
import 'package:task_management_system/features/home/domain/entities/response/task_response_entity.dart';

abstract class HomeRepo {
  Future<Either<ResponseError, List<TaskResponseEntity>>> getTasks();
  Future<Either<ResponseError, bool>> deleteTask(
      {required String taskId, required String docRefID});
}
