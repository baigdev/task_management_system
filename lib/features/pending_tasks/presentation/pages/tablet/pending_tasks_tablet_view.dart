import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_system/features/pending_tasks/presentation/manager/pending_tasks_cubit.dart';
import 'package:task_management_system/features/pending_tasks/presentation/manager/pending_tasks_state.dart';

import '../../../../../utils/constant/constant.dart';
import '../../../../../widgets/app_label/app_label.dart';
import '../../../../../widgets/loaders/app_loader.dart';
import '../../../../home/presentation/widgets/overview_card.dart';

class PendingTasksTabletView extends StatelessWidget {
  const PendingTasksTabletView({super.key, required this.pendingTasksCubit});
  final PendingTasksCubit pendingTasksCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppLabel(
          text: "Pending Tasks",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppUtils.paddingAllSides),
        child: BlocProvider.value(
          value: pendingTasksCubit,
          child: BlocBuilder<PendingTasksCubit, PendingTasksState>(
            builder: (ctx, state) {
              if (state is PendingTasksLoading) {
                return const ScreenProgressLoader();
              } else if (state is PendingTasksError) {
                return Center(
                  child: AppLabel(
                    text: state.errorMsg,
                  ),
                );
              } else if (state is PendingTasksLoaded) {
                return state.tasks.isEmpty
                    ? const Center(
                        child: AppLabel(text: "No pending tasks found"),
                      )
                    : Stack(
                        children: [
                          RefreshIndicator(
                            onRefresh: () async {
                              pendingTasksCubit.getPendingTasks();
                            },
                            child: ListView.separated(
                              itemCount: state.tasks.length,
                              shrinkWrap: true,
                              itemBuilder: (cxt, index) {
                                return OverviewCard(
                                  showPrefixIcons: false,
                                  entity: state.tasks[index],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return AppUtils.sizedBoxHeight(context);
                              },
                            ),
                          ),
                        ],
                      );
              } else {
                return const Center(
                  child: AppLabel(text: "No pending tasks found"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
