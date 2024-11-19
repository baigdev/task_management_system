import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_system/utils/constant/api_routes.dart';
import 'package:task_management_system/utils/constant/bloc_observer.dart';
import 'package:task_management_system/utils/theme/app_theme.dart';

import 'utils/constant/constant.dart';
import 'utils/dependency_injection/di_container.dart' as di;
import 'utils/dependency_injection/di_container.dart';
import 'utils/internet_checker/network_bloc.dart';
import 'utils/internet_checker/network_event.dart';
import 'utils/local_storage/local_storage.dart';
import 'utils/navigation/go_router_navigation_delegate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  ApiRoutes.kBaseUrl = "";
  Bloc.observer = CustomBlocObserver();
  di.initializeDependencies();
  runApp(const MyApp());
}

final _router = GoRouterNavigationDelegate();
final localStorageInstance = getItInstance.get<LocalStorage>();
final internetConnection = getItInstance.get<NetworkBloc>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: internetConnection..add(NetworkObserve()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Task Management System',
        themeMode: ThemeMode.dark,
        locale: const Locale(
          SupportedLanguageLocales.engLangCode,
        ),
        debugShowCheckedModeBanner: false,
        theme: AppTheme().kLightTheme,
        darkTheme: AppTheme().kDarkTheme,
        themeAnimationCurve: Curves.fastEaseInToSlowEaseOut,
        routerConfig: _router.router,
      ),
    );
  }
}
