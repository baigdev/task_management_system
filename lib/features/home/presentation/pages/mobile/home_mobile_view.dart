import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_system/features/home/presentation/manager/home_cubit.dart';
import 'package:task_management_system/features/home/presentation/manager/home_state.dart';
import 'package:task_management_system/features/home/presentation/widgets/overview_card.dart';
import 'package:task_management_system/utils/constant/app_snackbar.dart';
import 'package:task_management_system/utils/constant/constant.dart';
import 'package:task_management_system/utils/navigation/app_navigations.dart';
import 'package:task_management_system/widgets/app_label/app_label.dart';
import 'package:task_management_system/widgets/loaders/app_loader.dart';

class HomeMobileView extends StatelessWidget {
  const HomeMobileView({super.key, required this.homeCubit});
  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppLabel(
          text: "Home",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppUtils.paddingAllSides),
        child: BlocProvider.value(
          value: homeCubit,
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (ctx, state) {
              if (state is HomeLoaded && state.msg?.isNotEmpty == true) {
                AppSnackBar().showSuccessSnackBar(
                    context: context, successMsg: state.msg ?? "");
              }
            },
            builder: (ctx, state) {
              if (state is HomeLoading) {
                return const ScreenProgressLoader();
              } else if (state is HomeError) {
                return Center(
                  child: AppLabel(
                    text: state.errorMsg,
                  ),
                );
              } else if (state is HomeLoaded) {
                return state.tasks.isEmpty
                    ? const Center(
                        child: AppLabel(text: "No data found"),
                      )
                    : Stack(
                        children: [
                          RefreshIndicator(
                            onRefresh: () async {
                              homeCubit.getTaskFromServer();
                            },
                            child: ListView.separated(
                              itemCount: state.tasks.length,
                              shrinkWrap: true,
                              itemBuilder: (cxt, index) {
                                return OverviewCard(
                                  entity: state.tasks[index],
                                  editOnTap: () {
                                    AppNavigations().navigateToEditTask(
                                      context,
                                      value: state.tasks[index],
                                    );
                                  },
                                  deleteOnTap: () {
                                    homeCubit.deleteTask(
                                        state.tasks[index].id ?? 0,
                                        state.tasks[index].docID ?? "0",
                                        state);
                                  },
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return AppUtils.sizedBoxHeight(context);
                              },
                            ),
                          ),
                          state.deletingTask
                              ? const ScreenProgressLoader(
                                  message: "Deleting task",
                                )
                              : SizedBox.shrink()
                        ],
                      );
              } else {
                return const Center(
                  child: AppLabel(text: "No data found"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
