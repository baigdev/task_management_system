import 'package:task_management_system/features/add_task/data/models/request/add_task_request_model.dart';

abstract class AddTaskRemoteDataSourceRepo {
  Future<bool> saveTaskOnServer({required AddTaskRequestModel requestModel});
}
