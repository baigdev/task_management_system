import '../models/task_response_model.dart';

abstract class HomeRemoteDataSourceRepo {
  Future<List<TaskResponseModel>?> getTasks();
  Future<bool> deleteTask({required String taskId});
}
