import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/request/add_task_request_entity.dart';

part 'add_task_request_model.g.dart';

@JsonSerializable(checked: true)
class AddTaskRequestModel extends AddTaskRequestEntity {
  @JsonKey(name: "task_id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "dueDate")
  final String dueDate;
  @JsonKey(name: "status")
  final int status;
  const AddTaskRequestModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.status,
      required this.dueDate})
      : super(
            id: id,
            title: title,
            description: description,
            dueDate: dueDate,
            status: status);

  factory AddTaskRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AddTaskRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddTaskRequestModelToJson(this);
}
