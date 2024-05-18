import 'dart:io';

import 'package:task_management_system/core/error/response_error.dart';
import 'package:task_management_system/features/home/data/models/task_response_model.dart';
import 'package:task_management_system/features/home/data/remote/home_remote_data_source_repo.dart';
import 'package:task_management_system/utils/constant/constant.dart';
import 'package:task_management_system/utils/firebase/firebase_repo.dart';

class HomeRemoteDataSourceRepoImplementation extends HomeRemoteDataSourceRepo {
  final FirebaseRepo firebaseRepo;
  HomeRemoteDataSourceRepoImplementation({required this.firebaseRepo});
  @override
  Future<List<TaskResponseModel>?> getTasks() async {
    try {
      var response = await firebaseRepo.getTasks();
      if (response != null) {
        var res = response
            .map((e) =>
                TaskResponseModel.fromJson(e.data() as Map<String, dynamic>))
            .toList();
        return res;
      } else {
        throw ResponseError(errorStatus: AppStrings.unknownError);
      }
    } on ResponseError catch (e) {
      throw ResponseError(errorStatus: e.errorStatus);
    } on Socket catch (e) {
      throw ResponseError(errorStatus: AppStrings.notConnectedToInternet);
    } catch (e) {
      throw ResponseError(errorStatus: AppStrings.serverNotReachable);
    }
  }

  @override
  Future<bool> deleteTask({required String taskId}) async {
    try {
      var response = await firebaseRepo.deleteTask(taskID: taskId);
      return response;
    } on ResponseError catch (e) {
      throw ResponseError(errorStatus: e.errorStatus);
    } on Socket catch (e) {
      throw ResponseError(errorStatus: AppStrings.notConnectedToInternet);
    } catch (e) {
      throw ResponseError(errorStatus: AppStrings.serverNotReachable);
    }
  }
}
