// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTaskRequestModel _$AddTaskRequestModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AddTaskRequestModel',
      json,
      ($checkedConvert) {
        final val = AddTaskRequestModel(
          id: $checkedConvert('task_id', (v) => (v as num).toInt()),
          title: $checkedConvert('title', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          status: $checkedConvert('status', (v) => (v as num).toInt()),
          dueDate: $checkedConvert('dueDate', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'id': 'task_id'},
    );

Map<String, dynamic> _$AddTaskRequestModelToJson(
        AddTaskRequestModel instance) =>
    <String, dynamic>{
      'task_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'dueDate': instance.dueDate,
      'status': instance.status,
    };
