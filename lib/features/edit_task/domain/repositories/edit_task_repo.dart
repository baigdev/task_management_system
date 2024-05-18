import 'package:dartz/dartz.dart';
import 'package:task_management_system/core/error/response_error.dart';

abstract class EditTaskRepo {
  Future<Either<ResponseError, bool>> editTask(
      {required Map<String, dynamic> requestParams});
}
