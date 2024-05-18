import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_error.g.dart';

@JsonSerializable(
  checked: true,
)
class ResponseError {
  @JsonKey(name: "message")
  final String errorStatus;

  ResponseError({
    required this.errorStatus,
  });

  Map<String, dynamic> toJson() => _$ResponseErrorToJson(this);

  static const fromJsonFactory = _$ResponseErrorFromJson;
}

@JsonSerializable(
  checked: true,
)
class ErrorDetailsHandling extends Equatable {
  @JsonKey(name: "message")
  final String messageData;
  @JsonKey(name: "errors")
  final ErrorDetailsHandlingList errorMessageDetails;

  const ErrorDetailsHandling(
      {required this.messageData, required this.errorMessageDetails});

  @override
  List<Object?> get props => [
        messageData,
        errorMessageDetails,
      ];

  factory ErrorDetailsHandling.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailsHandlingFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDetailsHandlingToJson(this);
}

@JsonSerializable(
  checked: true,
)
class ErrorDetailsHandlingList extends Equatable {
  @JsonKey(name: "details")
  final List<String> errorMessageDetails;

  const ErrorDetailsHandlingList({required this.errorMessageDetails});

  @override
  List<Object?> get props => [
        errorMessageDetails,
      ];

  factory ErrorDetailsHandlingList.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailsHandlingListFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDetailsHandlingListToJson(this);
}
