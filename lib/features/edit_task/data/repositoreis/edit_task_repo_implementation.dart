import 'package:dartz/dartz.dart';
import 'package:task_management_system/core/error/response_error.dart';
import 'package:task_management_system/core/platform/network_information.dart';
import 'package:task_management_system/features/edit_task/data/remote/edit_task_remote_data_source_repo.dart';
import 'package:task_management_system/features/edit_task/domain/repositories/edit_task_repo.dart';
import 'package:task_management_system/utils/local_storage/local_storage.dart';

import '../../../../utils/constant/constant.dart';

class EditTaskRepoImplementation extends EditTaskRepo {
  final NetworkInfo networkInfo;
  final LocalStorage localStorage;
  final EditTaskRemoteDataSourceRepo remoteDataSourceRepo;
  EditTaskRepoImplementation(
      {required this.networkInfo,
      required this.remoteDataSourceRepo,
      required this.localStorage});
  @override
  Future<Either<ResponseError, bool>> editTask(
      {required Map<String, dynamic> requestParams}) async {
    if (await networkInfo.isConnected) {
      var res =
          await remoteDataSourceRepo.editTask(requestParams: requestParams);
      localStorage.updateTask(requestParams["task"]);
      return Right(res);
    } else {
      return Left(
          ResponseError(errorStatus: AppStrings.notConnectedToInternet));
    }
  }
}
