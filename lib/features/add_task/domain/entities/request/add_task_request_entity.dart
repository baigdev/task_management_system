import 'package:equatable/equatable.dart';

class AddTaskRequestEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final int status;
  final String dueDate;
  const AddTaskRequestEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.status,
      required this.dueDate});
  @override
  List<Object?> get props => [id, title, description, status, dueDate];
}
