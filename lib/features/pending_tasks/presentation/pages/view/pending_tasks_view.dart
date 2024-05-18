import 'package:flutter/widgets.dart';
import 'package:task_management_system/features/pending_tasks/presentation/manager/pending_tasks_cubit.dart';
import 'package:task_management_system/features/pending_tasks/presentation/pages/desktop/peding_task_desktop_view.dart';
import 'package:task_management_system/features/pending_tasks/presentation/pages/mobile/pending_tasks_mobile_view.dart';
import 'package:task_management_system/features/pending_tasks/presentation/pages/tablet/pending_tasks_tablet_view.dart';
import 'package:task_management_system/utils/dependency_injection/di_container.dart';
import 'package:task_management_system/widgets/responsive.dart';

class PendingTasksView extends StatefulWidget {
  const PendingTasksView({super.key});

  @override
  State<PendingTasksView> createState() => _PendingTasksViewState();
}

class _PendingTasksViewState extends State<PendingTasksView> {
  late PendingTasksCubit pendingTasksCubit;
  @override
  void initState() {
    super.initState();
    pendingTasksCubit = getItInstance.get();
    pendingTasksCubit.getPendingTasks();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: PendingTasksMobileView(
        pendingTasksCubit: pendingTasksCubit,
      ),
      tablet: PendingTasksTabletView(
        pendingTasksCubit: pendingTasksCubit,
      ),
      desktop: const PendingTasksDesktopView(),
    );
  }
}
