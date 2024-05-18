import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:task_management_system/features/add_task/presentation/manager/status_toggle_cubit.dart';
import 'package:task_management_system/features/edit_task/presentation/manager/edit_task_cubit.dart';
import 'package:task_management_system/features/edit_task/presentation/pages/desktop/edit_task_desktop_view.dart';
import 'package:task_management_system/features/edit_task/presentation/pages/mobile/edit_task_mobile_view.dart';
import 'package:task_management_system/features/edit_task/presentation/pages/tablet/edit_task_tablet_view.dart';
import 'package:task_management_system/features/home/data/models/task_response_model.dart';
import 'package:task_management_system/features/home/presentation/manager/home_cubit.dart';
import 'package:task_management_system/utils/dependency_injection/di_container.dart';
import 'package:task_management_system/widgets/responsive.dart';

class EditTaskView extends StatefulWidget {
  final Map<String, dynamic> queryParams;
  const EditTaskView({super.key, required this.queryParams});

  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {
  late EditTaskCubit editTaskCubit;
  late HomeCubit homeCubit;
  late StatusToggleCubit statusToggleCubit;
  @override
  void initState() {
    super.initState();
    editTaskCubit = getItInstance.get();
    homeCubit = getItInstance.get();
    statusToggleCubit = getItInstance.get();
    editTaskCubit.initialize(
        TaskResponseModel.fromJson(jsonDecode(widget.queryParams["task"])));
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: EditTaskMobileView(
        editTaskCubit: editTaskCubit,
        homeCubit: homeCubit,
        statusToggleCubit: statusToggleCubit,
        responseEntity:
            TaskResponseModel.fromJson(jsonDecode(widget.queryParams["task"])),
      ),
      tablet: EditTaskTabletView(
          editTaskCubit: editTaskCubit,
          homeCubit: homeCubit,
          statusToggleCubit: statusToggleCubit,
          responseEntity: TaskResponseModel.fromJson(
              jsonDecode(widget.queryParams["task"]))),
      desktop: const EditTaskDesktopView(),
    );
  }
}
