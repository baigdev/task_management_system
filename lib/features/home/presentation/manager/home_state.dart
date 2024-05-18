import 'package:equatable/equatable.dart';
import 'package:task_management_system/features/home/domain/entities/response/task_response_entity.dart';

abstract class HomeState extends Equatable {
  final bool deletingTask;
  const HomeState({this.deletingTask = false});
}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoaded extends HomeState {
  final String? msg;
  final List<TaskResponseEntity> tasks;
  const HomeLoaded({required this.tasks, this.msg, super.deletingTask});
  @override
  List<Object?> get props => [tasks, msg, deletingTask];
}

class HomeError extends HomeState {
  final String errorMsg;
  const HomeError({required this.errorMsg});
  @override
  List<Object?> get props => [errorMsg];
}
