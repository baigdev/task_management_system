import 'package:flutter/cupertino.dart';
import 'package:task_management_system/features/add_task/presentation/manager/add_task_cubit.dart';
import 'package:task_management_system/features/add_task/presentation/manager/status_toggle_cubit.dart';
import 'package:task_management_system/features/add_task/presentation/pages/desktop/add_task_desktop_view.dart';
import 'package:task_management_system/features/add_task/presentation/pages/mobile/add_task_mobile_view.dart';
import 'package:task_management_system/features/add_task/presentation/pages/tablet/add_task_tablet_view.dart';
import 'package:task_management_system/features/home/presentation/manager/home_cubit.dart';
import 'package:task_management_system/utils/dependency_injection/di_container.dart';
import 'package:task_management_system/widgets/responsive.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  late AddTaskCubit addTaskCubit;
  late StatusToggleCubit statusToggleCubit;
  late HomeCubit homeCubit;
  @override
  void initState() {
    super.initState();
    addTaskCubit = getItInstance.get();
    statusToggleCubit = getItInstance.get();
    homeCubit = getItInstance.get();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: AddTaskMobileView(
        addTaskCubit: addTaskCubit,
        statusToggleCubit: statusToggleCubit,
        homeCubit: homeCubit,
      ),
      tablet: AddTaskTabletView(
        addTaskCubit: addTaskCubit,
        statusToggleCubit: statusToggleCubit,
        homeCubit: homeCubit,
      ),
      desktop: const AddTaskDesktopView(),
    );
  }

  @override
  void dispose() {
    addTaskCubit.dispose();
    super.dispose();
  }
}
