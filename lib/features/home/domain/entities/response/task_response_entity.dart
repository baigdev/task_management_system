import 'package:equatable/equatable.dart';

class TaskResponseEntity extends Equatable {
  final int? id;
  final String? docID;
  final String? title;
  final String? description;
  final String? dueDate;
  final int? status;
  const TaskResponseEntity(
      {this.id,
      this.title,
      this.description,
      this.dueDate,
      this.status,
      this.docID});
  @override
  List<Object?> get props => [id, docID, title, description, dueDate, status];
}
