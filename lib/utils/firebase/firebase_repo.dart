import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_management_system/features/add_task/data/models/request/add_task_request_model.dart';

abstract class FirebaseRepo {
  Future<List<QueryDocumentSnapshot>?> getTasks();
  Future<bool> addTask({required AddTaskRequestModel requestModel});
  Future<bool> deleteTask({required String taskID});
  Future<bool> editTask(
      {required String docRefId, required AddTaskRequestModel requestModel});
}
