import 'package:flutter/material.dart';
import 'package:task_management_system/features/home/presentation/manager/home_cubit.dart';
import 'package:task_management_system/features/home/presentation/pages/desktop/home_desktop_view.dart';
import 'package:task_management_system/features/home/presentation/pages/mobile/home_mobile_view.dart';
import 'package:task_management_system/features/home/presentation/pages/tablet/home_tablet_view.dart';
import 'package:task_management_system/utils/dependency_injection/di_container.dart';
import 'package:task_management_system/widgets/responsive.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeCubit homeCubit;
  @override
  void initState() {
    super.initState();
    homeCubit = getItInstance.get();
    homeCubit.getTaskFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveView(
      mobile: HomeMobileView(
        homeCubit: homeCubit,
      ),
      tablet: HomeTabletView(
        homeCubit: homeCubit,
      ),
      desktop: const HomeDesktopView(),
    );
  }
}
