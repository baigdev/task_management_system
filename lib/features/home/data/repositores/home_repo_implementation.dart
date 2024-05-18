import 'package:dartz/dartz.dart';
import 'package:task_management_system/core/error/response_error.dart';
import 'package:task_management_system/core/platform/network_information.dart';
import 'package:task_management_system/features/home/data/local/home_local_data_source_repo.dart';
import 'package:task_management_system/features/home/data/remote/home_remote_data_source_repo.dart';
import 'package:task_management_system/features/home/domain/entities/response/task_response_entity.dart';
import 'package:task_management_system/features/home/domain/repositories/home_repo.dart';
import 'package:task_management_system/utils/constant/constant.dart';
import 'package:task_management_system/utils/local_storage/local_storage.dart';

class HomeRepoImplementation extends HomeRepo {
  final NetworkInfo networkInfo;
  final HomeRemoteDataSourceRepo remoteDataSourceRepo;
  final LocalStorage localStorage;
  final HomeLocalDataSourceRepo localRepo;
  HomeRepoImplementation(
      {required this.networkInfo,
      required this.remoteDataSourceRepo,
      required this.localStorage,
      required this.localRepo});
  @override
  Future<Either<ResponseError, List<TaskResponseEntity>>> getTasks() async {
    if (await networkInfo.isConnected) {
      try {
        var res = await remoteDataSourceRepo.getTasks();
        if (res != null && res is! String) {
          return Right(res);
        } else {
          return Left(
              ResponseError(errorStatus: AppStrings.serverNotReachable));
        }
      } on ResponseError catch (e) {
        return Left(e);
      }
    } else {
      try {
        var res = await localRepo.getTasks();
        if (res != null && res is! String) {
          return Right(res);
        } else {
          return Left(ResponseError(errorStatus: AppStrings.unknownError));
        }
      } catch (e) {
        return Left(ResponseError(errorStatus: e.toString()));
      }
    }
  }

  @override
  Future<Either<ResponseError, bool>> deleteTask(
      {required String taskId, required String docRefID}) async {
    if (await networkInfo.isConnected) {
      try {
        var res = await remoteDataSourceRepo.deleteTask(taskId: docRefID);
        await localStorage.deleteTask(taskId);
        return Right(res);
      } on ResponseError catch (e) {
        return Left(e);
      }
    } else {
      return Left(
          ResponseError(errorStatus: AppStrings.notConnectedToInternet));
    }
  }
}
