import 'package:dartz/dartz.dart';
import 'package:task_management_system/core/error/response_error.dart';
import 'package:task_management_system/core/usecase/usecase.dart';
import 'package:task_management_system/features/home/domain/repositories/home_repo.dart';

class DeleteTaskUseCase extends UseCase<bool, String> {
  final HomeRepo homeRepo;
  DeleteTaskUseCase({required this.homeRepo});
  @override
  Future<Either<ResponseError, bool>> call(String params) {
    return homeRepo.deleteTask(taskId: params, docRefID: "");
  }
}
