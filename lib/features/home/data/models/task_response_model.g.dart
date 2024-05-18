// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskResponseModel _$TaskResponseModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TaskResponseModel',
      json,
      ($checkedConvert) {
        final val = TaskResponseModel(
          id: $checkedConvert('task_id', (v) => (v as num?)?.toInt()),
          docID: $checkedConvert('docRefId', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
          dueDate: $checkedConvert('dueDate', (v) => v as String?),
          status: $checkedConvert('status', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'id': 'task_id', 'docID': 'docRefId'},
    );

Map<String, dynamic> _$TaskResponseModelToJson(TaskResponseModel instance) =>
    <String, dynamic>{
      'task_id': instance.id,
      'docRefId': instance.docID,
      'title': instance.title,
      'description': instance.description,
      'dueDate': instance.dueDate,
      'status': instance.status,
    };
