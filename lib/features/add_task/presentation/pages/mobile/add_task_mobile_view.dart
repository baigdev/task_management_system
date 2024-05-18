import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_system/features/add_task/presentation/manager/add_task_cubit.dart';
import 'package:task_management_system/features/add_task/presentation/manager/add_task_state.dart';
import 'package:task_management_system/features/add_task/presentation/manager/status_toggle_cubit.dart';
import 'package:task_management_system/features/add_task/presentation/manager/status_toggle_state.dart';
import 'package:task_management_system/features/home/presentation/manager/home_cubit.dart';
import 'package:task_management_system/utils/constant/app_snackbar.dart';
import 'package:task_management_system/utils/constant/constant.dart';
import 'package:task_management_system/utils/extensions/context_extensions.dart';
import 'package:task_management_system/utils/extensions/string_extensions.dart';
import 'package:task_management_system/utils/navigation/app_navigations.dart';
import 'package:task_management_system/widgets/app_label/app_label.dart';
import 'package:task_management_system/widgets/buttons/app_filled_buttons.dart';
import 'package:task_management_system/widgets/responsive.dart';

import '../../../../../widgets/app_date_picker/date_picker.dart';
import '../../../../../widgets/input_fields/app_input_field.dart';
import '../../../../../widgets/loaders/app_loader.dart';

class AddTaskMobileView extends StatelessWidget {
  const AddTaskMobileView(
      {super.key,
      required this.addTaskCubit,
      required this.statusToggleCubit,
      required this.homeCubit});
  final AddTaskCubit addTaskCubit;
  final StatusToggleCubit statusToggleCubit;
  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppLabel(text: "Add Task"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppUtils.paddingAllSides),
          child: BlocProvider.value(
            value: addTaskCubit,
            child: BlocConsumer<AddTaskCubit, AddTaskState>(
                listener: (ctx, state) {
              if (state is UploadedTask) {
                AppSnackBar().showSuccessSnackBar(
                    context: context, successMsg: state.msg);
                homeCubit.getTaskFromServer();
                AppNavigations().replaceToHome(context);
                AppNavigations().replaceToHome(context);
              } else if (state is AddTaskError) {
                AppSnackBar()
                    .showErrorSnackBar(context: context, error: state.errorMsg);
              }
            }, builder: (cxt, state) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Form(
                    key: addTaskCubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppInputField(
                          controller: addTaskCubit.titleController,
                          inputValidator: (v) => v?.validateEmpty(context),
                          inputFocusNode: addTaskCubit.titleNode,
                          inputLabel: "Title",
                          textInputType: TextInputType.text,
                          inputFormatters: const [],
                        ),
                        AppUtils.sizedBoxHeight(context),
                        SizedBox(
                          height: getResponsiveValue(context, 150),
                          child: AppInputField(
                            maxLines: 50,
                            controller: addTaskCubit.descriptionController,
                            inputValidator: (v) => v?.validateEmpty(context),
                            inputFocusNode: addTaskCubit.descriptionNodeNode,
                            inputLabel: "Description",
                            textInputType: TextInputType.text,
                            inputFormatters: const [],
                          ),
                        ),
                        AppUtils.sizedBoxHeight(context),
                        AppDatePicker(
                          suffixWidget: const Icon(Icons.calendar_month),
                          hintText: "DD/MM/YYYY",
                          inputValidator: (v) => v?.validateEmpty(context),
                          initialText: "Due Date",
                          controller: addTaskCubit.dueDateController,
                          node: addTaskCubit.dueDateNodeNode,
                        ),
                        AppUtils.sizedBoxHeight(context),
                        const AppLabel(text: "Status"),
                        BlocProvider.value(
                          value: statusToggleCubit,
                          child:
                              BlocBuilder<StatusToggleCubit, StatusToggleState>(
                            builder: (ctx, state) {
                              return Row(
                                children: [
                                  Row(
                                    children: [
                                      const AppLabel(text: "Finished"),
                                      Checkbox(
                                        checkColor: AppColors().appWhiteColor,
                                        fillColor: state.finished
                                            ? MaterialStatePropertyAll(
                                                AppColors().appGreen)
                                            : const MaterialStatePropertyAll(
                                                Colors.transparent),
                                        value: state.finished,
                                        onChanged: (value) {
                                          statusToggleCubit.toggleStatus();
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const AppLabel(text: "To Do"),
                                      Checkbox(
                                        checkColor: AppColors().appWhiteColor,
                                        fillColor: !state.finished
                                            ? MaterialStatePropertyAll(
                                                AppColors().appGreen)
                                            : const MaterialStatePropertyAll(
                                                Colors.transparent),
                                        value: !state.finished,
                                        onChanged: (value) {
                                          statusToggleCubit.toggleStatus();
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        AppUtils.sizedBoxHeight(context),
                        BlocProvider.value(
                          value: statusToggleCubit,
                          child:
                              BlocBuilder<StatusToggleCubit, StatusToggleState>(
                            builder: (ctx, state) {
                              return AppFilledButton(
                                filled: true,
                                customWidth: double.infinity,
                                buttonLabel: "Add Task",
                                onPressed: () {
                                  if (addTaskCubit.formKey.currentState
                                          ?.validate() ==
                                      true) {
                                    addTaskCubit.addTask(state.finished);
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  state is UploadingTask
                      ? Positioned(
                          left: 0,
                          right: 0,
                          top: context.screenWidth / 2,
                          child: SizedBox(
                              height: getResponsiveValue(context, 100),
                              width: getResponsiveValue(context, 100),
                              child: const ScreenProgressLoader()),
                        )
                      : const SizedBox.shrink(),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
