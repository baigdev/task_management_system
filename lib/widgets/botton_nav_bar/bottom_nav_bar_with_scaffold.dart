import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_system/utils/constant/constant.dart';

class AppBottomNavBarWithScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppBottomNavBarWithScaffold({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          selectedItemColor: AppColors().primary,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Add Task",
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              label: "Pending Tasks",
              icon: Icon(Icons.pending),
            ),
          ],
          currentIndex: navigationShell.currentIndex,
          onTap: navigationShell.goBranch,
        ),
      ),
    );
  }
}
