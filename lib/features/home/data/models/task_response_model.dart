import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/response/task_response_entity.dart';

part 'task_response_model.g.dart';

@JsonSerializable(checked: true)
class TaskResponseModel extends TaskResponseEntity {
  @JsonKey(name: "task_id")
  final int? id;
  @JsonKey(name: "docRefId")
  final String? docID;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "dueDate")
  final String? dueDate;
  @JsonKey(name: "status")
  final int? status;
  const TaskResponseModel(
      {this.id,
      this.docID,
      this.title,
      this.description,
      this.dueDate,
      this.status})
      : super(
          id: id,
          docID: docID,
          title: title,
          description: description,
          dueDate: dueDate,
          status: status,
        );

  factory TaskResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TaskResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskResponseModelToJson(this);
}
