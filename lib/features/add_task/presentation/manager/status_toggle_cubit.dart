import 'package:bloc/bloc.dart';
import 'package:task_management_system/features/add_task/presentation/manager/status_toggle_state.dart';

class StatusToggleCubit extends Cubit<StatusToggleState> {
  StatusToggleCubit() : super(const StatusToggle(finished: true));

  toggleStatus() {
    emit(StatusToggle(finished: !state.finished));
  }
}
