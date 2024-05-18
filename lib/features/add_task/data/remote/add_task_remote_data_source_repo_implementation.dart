import 'package:task_management_system/core/error/response_error.dart';
import 'package:task_management_system/features/add_task/data/models/request/add_task_request_model.dart';
import 'package:task_management_system/features/add_task/data/remote/add_task_remote_data_source_repo.dart';
import 'package:task_management_system/utils/constant/constant.dart';
import 'package:task_management_system/utils/firebase/firebase_repo.dart';

class AddTaskRemoteDataSourceRepoImplementation
    extends AddTaskRemoteDataSourceRepo {
  final FirebaseRepo firebaseRepo;
  AddTaskRemoteDataSourceRepoImplementation({required this.firebaseRepo});
  @override
  Future<bool> saveTaskOnServer(
      {required AddTaskRequestModel requestModel}) async {
    try {
      var res = await firebaseRepo.addTask(requestModel: requestModel);
      return res;
    } catch (e) {
      throw ResponseError(errorStatus: AppStrings.serverNotReachable);
    }
  }
}
