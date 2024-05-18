import 'package:dartz/dartz.dart';
import 'package:task_management_system/core/error/response_error.dart';
import 'package:task_management_system/core/platform/network_information.dart';
import 'package:task_management_system/features/add_task/data/models/request/add_task_request_model.dart';
import 'package:task_management_system/features/add_task/data/remote/add_task_remote_data_source_repo.dart';
import 'package:task_management_system/features/add_task/domain/entities/request/add_task_request_entity.dart';
import 'package:task_management_system/features/add_task/domain/repositories/add_taks_repo.dart';
import 'package:task_management_system/utils/constant/constant.dart';

import '../../../../utils/local_storage/local_storage.dart';

class AddTaskRepoImplementation extends AddTaskRepo {
  final NetworkInfo networkInfo;
  final AddTaskRemoteDataSourceRepo remoteDataSourceRepo;
  final LocalStorage localStorage;
  AddTaskRepoImplementation(
      {required this.networkInfo,
      required this.remoteDataSourceRepo,
      required this.localStorage});
  @override
  Future<Either<ResponseError, bool>> addTask(
      {required AddTaskRequestEntity requestEntity}) async {
    AddTaskRequestModel requestModel = AddTaskRequestModel(
        id: requestEntity.id,
        title: requestEntity.title,
        description: requestEntity.description,
        status: requestEntity.status,
        dueDate: requestEntity.dueDate);
    if (await networkInfo.isConnected) {
      // When user has an internet connection then I am saving the task on both fire store and local db, it will help us to show the task to user even if user is offline.
      await localStorage.insertTask(requestModel);
      var res = await remoteDataSourceRepo.saveTaskOnServer(
          requestModel: requestModel);
      return Right(res);
    } else {
      return Left(
          ResponseError(errorStatus: AppStrings.notConnectedToInternet));
    }
  }
}
