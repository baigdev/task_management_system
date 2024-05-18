import 'package:task_management_system/features/home/data/models/task_response_model.dart';

abstract class HomeLocalDataSourceRepo {
  Future<List<TaskResponseModel>?> getTasks();
}
