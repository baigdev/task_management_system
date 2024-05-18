import 'package:equatable/equatable.dart';

abstract class EditTaskState extends Equatable {}

class EditTaskInitial extends EditTaskState {
  @override
  List<Object?> get props => [];
}

class EditingTask extends EditTaskState {
  @override
  List<Object?> get props => [];
}

class EditedTask extends EditTaskState {
  final String msg;
  EditedTask({required this.msg});
  @override
  List<Object?> get props => [msg];
}

class EditTaskError extends EditTaskState {
  final String errorMsg;
  EditTaskError({required this.errorMsg});
  @override
  List<Object?> get props => [errorMsg];
}
