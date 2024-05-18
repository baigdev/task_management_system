// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseError _$ResponseErrorFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ResponseError',
      json,
      ($checkedConvert) {
        final val = ResponseError(
          errorStatus: $checkedConvert('message', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'errorStatus': 'message'},
    );

Map<String, dynamic> _$ResponseErrorToJson(ResponseError instance) =>
    <String, dynamic>{
      'message': instance.errorStatus,
    };

ErrorDetailsHandling _$ErrorDetailsHandlingFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ErrorDetailsHandling',
      json,
      ($checkedConvert) {
        final val = ErrorDetailsHandling(
          messageData: $checkedConvert('message', (v) => v as String),
          errorMessageDetails: $checkedConvert(
              'errors',
              (v) =>
                  ErrorDetailsHandlingList.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {
        'messageData': 'message',
        'errorMessageDetails': 'errors'
      },
    );

Map<String, dynamic> _$ErrorDetailsHandlingToJson(
        ErrorDetailsHandling instance) =>
    <String, dynamic>{
      'message': instance.messageData,
      'errors': instance.errorMessageDetails,
    };

ErrorDetailsHandlingList _$ErrorDetailsHandlingListFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'ErrorDetailsHandlingList',
      json,
      ($checkedConvert) {
        final val = ErrorDetailsHandlingList(
          errorMessageDetails: $checkedConvert('details',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
        );
        return val;
      },
      fieldKeyMap: const {'errorMessageDetails': 'details'},
    );

Map<String, dynamic> _$ErrorDetailsHandlingListToJson(
        ErrorDetailsHandlingList instance) =>
    <String, dynamic>{
      'details': instance.errorMessageDetails,
    };
