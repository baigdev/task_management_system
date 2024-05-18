import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_system/features/add_task/presentation/manager/status_toggle_cubit.dart';
import 'package:task_management_system/features/edit_task/presentation/manager/edit_task_cubit.dart';
import 'package:task_management_system/features/edit_task/presentation/manager/edit_task_state.dart';
import 'package:task_management_system/features/home/domain/entities/response/task_response_entity.dart';
import 'package:task_management_system/features/home/presentation/manager/home_cubit.dart';
import 'package:task_management_system/utils/extensions/context_extensions.dart';
import 'package:task_management_system/utils/extensions/string_extensions.dart';

import '../../../../../utils/constant/app_snackbar.dart';
import '../../../../../utils/constant/constant.dart';
import '../../../../../utils/navigation/app_navigations.dart';
import '../../../../../widgets/app_date_picker/date_picker.dart';
import '../../../../../widgets/app_label/app_label.dart';
import '../../../../../widgets/buttons/app_filled_buttons.dart';
import '../../../../../widgets/input_fields/app_input_field.dart';
import '../../../../../widgets/loaders/app_loader.dart';
import '../../../../../widgets/responsive.dart';
import '../../../../add_task/presentation/manager/status_toggle_state.dart';

class EditTaskTabletView extends StatelessWidget {
  const EditTaskTabletView(
      {super.key,
      required this.editTaskCubit,
      required this.homeCubit,
      required this.statusToggleCubit,
      required this.responseEntity});

  final EditTaskCubit editTaskCubit;
  final HomeCubit homeCubit;
  final StatusToggleCubit statusToggleCubit;
  final TaskResponseEntity responseEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppLabel(text: "Edit Task"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppUtils.paddingAllSides),
          child: BlocProvider.value(
            value: editTaskCubit,
            child: BlocConsumer<EditTaskCubit, EditTaskState>(
                listener: (ctx, state) {
              if (state is EditedTask) {
                AppSnackBar().showSuccessSnackBar(
                    context: context, successMsg: state.msg);
                homeCubit.getTaskFromServer();
                AppNavigations().replaceToHome(context);
                AppNavigations().replaceToHome(context);
              } else if (state is EditTaskError) {
                AppSnackBar()
                    .showErrorSnackBar(context: context, error: state.errorMsg);
              }
            }, builder: (cxt, state) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Form(
                    key: editTaskCubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppInputField(
                          controller: editTaskCubit.titleController,
                          inputValidator: (v) => v?.validateEmpty(context),
                          inputFocusNode: editTaskCubit.titleNode,
                          inputLabel: "Title",
                          textInputType: TextInputType.text,
                          inputFormatters: const [],
                        ),
                        AppUtils.sizedBoxHeight(context),
                        SizedBox(
                          height: getResponsiveValue(context, 150),
                          child: AppInputField(
                            maxLines: 50,
                            controller: editTaskCubit.descriptionController,
                            inputValidator: (v) => v?.validateEmpty(context),
                            inputFocusNode: editTaskCubit.descriptionNodeNode,
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
                          controller: editTaskCubit.dueDateController,
                          node: editTaskCubit.dueDateNodeNode,
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
                                buttonLabel: "Edit Task",
                                onPressed: () {
                                  if (editTaskCubit.formKey.currentState
                                          ?.validate() ==
                                      true) {
                                    editTaskCubit.editTask(
                                        id: responseEntity.id ?? 0,
                                        docRefId: responseEntity.docID ?? "");
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  state is EditingTask
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
