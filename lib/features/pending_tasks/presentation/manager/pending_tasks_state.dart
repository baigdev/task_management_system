import 'package:equatable/equatable.dart';

import '../../../home/domain/entities/response/task_response_entity.dart';

abstract class PendingTasksState extends Equatable {}

class PendingTasksInitial extends PendingTasksState {
  @override
  List<Object?> get props => [];
}

class PendingTasksLoading extends PendingTasksState {
  @override
  List<Object?> get props => [];
}

class PendingTasksLoaded extends PendingTasksState {
  final List<TaskResponseEntity> tasks;
  PendingTasksLoaded({required this.tasks});
  @override
  List<Object?> get props => [tasks];
}

class PendingTasksError extends PendingTasksState {
  final String errorMsg;
  PendingTasksError({required this.errorMsg});
  @override
  List<Object?> get props => [errorMsg];
}
