import 'package:equatable/equatable.dart';

abstract class StatusToggleState extends Equatable {
  final bool finished;
  const StatusToggleState({required this.finished});
}

class StatusToggle extends StatusToggleState {
  const StatusToggle({required super.finished});
  @override
  List<Object?> get props => [finished];
}
