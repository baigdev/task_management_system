import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_system/features/add_task/presentation/pages/view/add_task_view.dart';
import 'package:task_management_system/features/pending_tasks/presentation/pages/view/pending_tasks_view.dart';
import 'package:task_management_system/utils/extensions/string_extensions.dart';
import 'package:task_management_system/utils/navigation/route_names.dart';

import '../../features/edit_task/presentation/pages/view/edit_task_view.dart';
import '../../features/home/presentation/pages/view/home_view.dart';
import '../../widgets/botton_nav_bar/bottom_nav_bar_with_scaffold.dart';

class GoRouterNavigationDelegate {
  static final GoRouterNavigationDelegate _singleton =
      GoRouterNavigationDelegate._internal();

  factory GoRouterNavigationDelegate() {
    return _singleton;
  }

  GoRouterNavigationDelegate._internal();

  // final localStorage = getItInstance.get<LocalStorage>();
  final parentNavigationKey = GlobalKey<NavigatorState>();
  late final GoRouter router = GoRouter(
    navigatorKey: parentNavigationKey,
    debugLogDiagnostics: true,
    redirect: (ctx, state) async {
      return null;
    },
    initialLocation: NavigationRouteNames.home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (ctx, state, navShell) {
          return AppBottomNavBarWithScaffold(navigationShell: navShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: NavigationRouteNames.home,
                name: NavigationRouteNames.home.convertRoutePathToRouteName,
                builder: (ctx, state) {
                  return const HomeView();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: NavigationRouteNames.addTask,
                name: NavigationRouteNames.addTask.convertRoutePathToRouteName,
                builder: (ctx, state) {
                  return const AddTaskView();
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: NavigationRouteNames.pendingTasks,
                name: NavigationRouteNames
                    .pendingTasks.convertRoutePathToRouteName,
                builder: (ctx, state) {
                  return const PendingTasksView();
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: NavigationRouteNames.editTask,
        name: NavigationRouteNames.editTask.convertRoutePathToRouteName,
        builder: (ctx, state) {
          return EditTaskView(
            queryParams: state.uri.queryParameters,
          );
        },
      ),
    ],
  );
}
