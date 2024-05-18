import 'package:equatable/equatable.dart';

abstract class AddTaskState extends Equatable {}

class AddTaskInitial extends AddTaskState {
  @override
  List<Object?> get props => [];
}

class UploadingTask extends AddTaskState {
  @override
  List<Object?> get props => [];
}

class UploadedTask extends AddTaskState {
  UploadedTask({required this.msg});
  final String msg;
  @override
  List<Object?> get props => [msg];
}

class AddTaskError extends AddTaskState {
  final String errorMsg;
  AddTaskError({required this.errorMsg});
  @override
  List<Object?> get props => [errorMsg];
}
