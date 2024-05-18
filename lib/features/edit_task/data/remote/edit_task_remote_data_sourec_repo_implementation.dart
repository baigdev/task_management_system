import 'package:task_management_system/features/edit_task/data/remote/edit_task_remote_data_source_repo.dart';
import 'package:task_management_system/utils/firebase/firebase_repo.dart';

import '../../../../core/error/response_error.dart';
import '../../../../utils/constant/constant.dart';

class EditTaskRemoteDataSourceRepoImplementation
    extends EditTaskRemoteDataSourceRepo {
  final FirebaseRepo firebaseRepo;
  EditTaskRemoteDataSourceRepoImplementation({required this.firebaseRepo});
  @override
  Future<bool> editTask({required Map<String, dynamic> requestParams}) async {
    try {
      var res = await firebaseRepo.editTask(
          docRefId: requestParams["docRefId"],
          requestModel: requestParams["task"]);
      return res;
    } catch (e) {
      throw ResponseError(errorStatus: AppStrings.serverNotReachable);
    }
  }
}
