import 'package:dartz/dartz.dart';
import 'package:task_management_system/core/error/response_error.dart';
import 'package:task_management_system/core/usecase/usecase.dart';
import 'package:task_management_system/features/home/domain/entities/response/task_response_entity.dart';
import 'package:task_management_system/features/home/domain/repositories/home_repo.dart';

class GetTasksUseCase extends UseCase<List<TaskResponseEntity>, NoParams> {
  final HomeRepo repo;
  GetTasksUseCase({required this.repo});
  @override
  Future<Either<ResponseError, List<TaskResponseEntity>>> call(
      NoParams params) {
    return repo.getTasks();
  }
}
