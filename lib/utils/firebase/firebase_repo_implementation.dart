import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_management_system/features/add_task/data/models/request/add_task_request_model.dart';

import 'firebase_repo.dart';

class FirebaseRepoImplementation extends FirebaseRepo {
  @override
  Future<List<QueryDocumentSnapshot>?> getTasks() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('my_tasks').get();
      return querySnapshot.docs;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<bool> addTask({required AddTaskRequestModel requestModel}) async {
    bool uploadedTask = false;
    CollectionReference tasks =
        FirebaseFirestore.instance.collection('my_tasks');
    var json = requestModel.toJson();
    await tasks.add(json).then((value) {
      value.update({'docRefId': value.id}).then((value) {
        uploadedTask = true;
      });
    }).catchError((v) {
      uploadedTask = false;
    });
    return uploadedTask;
  }

  @override
  Future<bool> deleteTask({required String taskID}) async {
    bool taskDeleted = false;
    CollectionReference tasks =
        FirebaseFirestore.instance.collection('my_tasks');
    await tasks.doc(taskID).delete().then((value) {
      taskDeleted = true;
    }).catchError((error) {
      taskDeleted = false;
    });
    return taskDeleted;
  }

  @override
  Future<bool> editTask(
      {required String docRefId,
      required AddTaskRequestModel requestModel}) async {
    bool taskEdited = false;
    CollectionReference tasks =
        FirebaseFirestore.instance.collection('my_tasks');
    var json = requestModel.toJson();
    json["docRefId"] = docRefId;
    await tasks.doc(docRefId).set(json).then((value) {
      taskEdited = true;
    }).catchError((error) {
      taskEdited = false;
    });
    return taskEdited;
  }
}
