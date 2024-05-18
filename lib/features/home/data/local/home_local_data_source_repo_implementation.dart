import 'package:task_management_system/core/error/response_error.dart';
import 'package:task_management_system/features/home/data/local/home_local_data_source_repo.dart';
import 'package:task_management_system/features/home/data/models/task_response_model.dart';
import 'package:task_management_system/utils/local_storage/local_storage.dart';

class HomeLocalDataSourceRepoImplementation extends HomeLocalDataSourceRepo {
  final LocalStorage localStorage;
  HomeLocalDataSourceRepoImplementation({required this.localStorage});
  @override
  Future<List<TaskResponseModel>?> getTasks() async {
    try {
      var res = await localStorage.getTasks();
      return res;
    } catch (e) {
      throw ResponseError(errorStatus: e.toString());
    }
  }
}
