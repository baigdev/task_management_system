import 'package:flutter/material.dart';
import 'package:task_management_system/features/home/domain/entities/response/task_response_entity.dart';
import 'package:task_management_system/utils/constant/constant.dart';
import 'package:task_management_system/utils/theme/theme_constant.dart';
import 'package:task_management_system/widgets/app_label/app_label.dart';
import 'package:task_management_system/widgets/buttons/app_icon_button.dart';
import 'package:task_management_system/widgets/responsive.dart';

class OverviewCard extends StatelessWidget {
  final TaskResponseEntity entity;
  final VoidCallback? deleteOnTap;
  final VoidCallback? editOnTap;
  final bool showPrefixIcons;
  const OverviewCard(
      {super.key,
      required this.entity,
      this.deleteOnTap,
      this.editOnTap,
      this.showPrefixIcons = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColors().primary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 123, 0, 245),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                  AppLabel(
                    text: entity.title?.toUpperCase() ?? "N/A",
                    style: ThemeConstants().bold14(context),
                  ),
                ],
              ),
              showPrefixIcons
                  ? Row(
                      children: [
                        SizedBox(
                          width: getResponsiveValue(context, 35),
                          child: AppIconButton(
                            onPressed: editOnTap ?? () {},
                            icon: Icon(Icons.edit),
                          ),
                        ),
                        SizedBox(
                          width: getResponsiveValue(context, 35),
                          child: AppIconButton(
                            onPressed: deleteOnTap ?? () {},
                            icon: Icon(Icons.delete),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          AppUtils.sizedBoxHeight(context),
          AppLabel(
            text: entity.description ?? "N/A",
            style: ThemeConstants().bold14(context),
          ),
          AppUtils.sizedBoxHeight(context),
          AppLabel(
            text: entity.dueDate ?? "NA",
            style: ThemeConstants().bold14(context),
          ),
          AppUtils.sizedBoxHeight(context),
          Row(
            children: [
              AppLabel(
                text: "Status",
                style: ThemeConstants().bold14(context),
              ),
              AppUtils.sizedBoxWidth(context),
              AppLabel(
                text: entity.status == true ? "Finished" : "To Do",
                style: ThemeConstants().bold14(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
