import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:task_management_system/features/add_task/data/remote/add_task_remote_data_source_repo.dart';
import 'package:task_management_system/features/add_task/data/remote/add_task_remote_data_source_repo_implementation.dart';
import 'package:task_management_system/features/add_task/data/repositories/add_task_repo_implementation.dart';
import 'package:task_management_system/features/add_task/domain/repositories/add_taks_repo.dart';
import 'package:task_management_system/features/add_task/domain/usecases/add_task_usecase.dart';
import 'package:task_management_system/features/add_task/presentation/manager/add_task_cubit.dart';
import 'package:task_management_system/features/add_task/presentation/manager/status_toggle_cubit.dart';
import 'package:task_management_system/features/edit_task/data/remote/edit_task_remote_data_source_repo.dart';
import 'package:task_management_system/features/edit_task/data/remote/edit_task_remote_data_sourec_repo_implementation.dart';
import 'package:task_management_system/features/edit_task/data/repositoreis/edit_task_repo_implementation.dart';
import 'package:task_management_system/features/edit_task/domain/repositories/edit_task_repo.dart';
import 'package:task_management_system/features/edit_task/domain/usecases/edit_task_usecase.dart';
import 'package:task_management_system/features/edit_task/presentation/manager/edit_task_cubit.dart';
import 'package:task_management_system/features/home/data/local/home_local_data_source_repo.dart';
import 'package:task_management_system/features/home/data/local/home_local_data_source_repo_implementation.dart';
import 'package:task_management_system/features/home/data/remote/home_remote_data_source_repo.dart';
import 'package:task_management_system/features/home/data/remote/home_remote_data_source_repo_implementation.dart';
import 'package:task_management_system/features/home/data/repositores/home_repo_implementation.dart';
import 'package:task_management_system/features/home/domain/repositories/home_repo.dart';
import 'package:task_management_system/features/home/domain/usecases/delete_task_usecase.dart';
import 'package:task_management_system/features/home/domain/usecases/get_tasks_usecase.dart';
import 'package:task_management_system/features/home/presentation/manager/home_cubit.dart';
import 'package:task_management_system/features/pending_tasks/presentation/manager/pending_tasks_cubit.dart';
import 'package:task_management_system/utils/firebase/firebase_repo.dart';
import 'package:task_management_system/utils/firebase/firebase_repo_implementation.dart';
import 'package:task_management_system/utils/local_storage/local_storage.dart';

import '../../core/platform/network_information.dart';
import '../internet_checker/network_bloc.dart';

final getItInstance = GetIt.instance;

void initializeDependencies() {
  _initializeBlocsAndCubits();
  _initializeRepositories();
  _initializeUseCases();
  _initializeExternalPackages();
}

void _initializeBlocsAndCubits() {
  getItInstance.registerLazySingleton(
    () => NetworkBloc(),
  );
  getItInstance.registerLazySingleton(
    () => HomeCubit(
        getTasksUseCase: getItInstance.get(),
        deleteTaskUseCase: getItInstance.get()),
  );

  getItInstance.registerFactory(
    () => AddTaskCubit(addTaskUseCase: getItInstance.get()),
  );

  getItInstance.registerFactory(
    () => StatusToggleCubit(),
  );

  getItInstance.registerFactory(
    () => EditTaskCubit(editTaskUseCase: getItInstance.get()),
  );

  getItInstance.registerFactory(
    () => PendingTasksCubit(getTasksUseCase: getItInstance.get()),
  );
}

void _initializeRepositories() {
  getItInstance
      .registerFactory<FirebaseRepo>(() => FirebaseRepoImplementation());
  // ====================== Home Repos =========================================
  getItInstance.registerFactory<HomeRemoteDataSourceRepo>(() =>
      HomeRemoteDataSourceRepoImplementation(
          firebaseRepo: getItInstance.get()));
  getItInstance.registerFactory<HomeLocalDataSourceRepo>(() =>
      HomeLocalDataSourceRepoImplementation(localStorage: getItInstance.get()));
  getItInstance.registerFactory<HomeRepo>(() => HomeRepoImplementation(
        networkInfo: getItInstance.get(),
        remoteDataSourceRepo: getItInstance.get(),
        localRepo: getItInstance.get(),
        localStorage: getItInstance.get(),
      ));
  // ===========================================================================
  // ====================== Add Task Repos =====================================
  getItInstance.registerFactory<AddTaskRemoteDataSourceRepo>(
      () => AddTaskRemoteDataSourceRepoImplementation(
            firebaseRepo: getItInstance.get(),
          ));
  getItInstance.registerFactory<AddTaskRepo>(() => AddTaskRepoImplementation(
        networkInfo: getItInstance.get(),
        remoteDataSourceRepo: getItInstance.get(),
        localStorage: getItInstance.get(),
      ));
  // ===========================================================================
  // ====================== Edit Task Repos ====================================
  getItInstance.registerFactory<EditTaskRemoteDataSourceRepo>(() =>
      EditTaskRemoteDataSourceRepoImplementation(
          firebaseRepo: getItInstance.get()));
  getItInstance.registerFactory<EditTaskRepo>(() => EditTaskRepoImplementation(
        networkInfo: getItInstance.get(),
        remoteDataSourceRepo: getItInstance.get(),
        localStorage: getItInstance.get(),
      ));
  // ===========================================================================
}

void _initializeUseCases() {
  getItInstance.registerLazySingleton(
    () => GetTasksUseCase(repo: getItInstance.get()),
  );
  getItInstance.registerLazySingleton(
    () => AddTaskUseCase(addTaskRepo: getItInstance.get()),
  );
  getItInstance.registerLazySingleton(
    () => DeleteTaskUseCase(homeRepo: getItInstance.get()),
  );
  getItInstance.registerLazySingleton(
    () => EditTaskUseCase(editTaskRepo: getItInstance.get()),
  );
}

void _initializeExternalPackages() {
  getItInstance.registerLazySingleton<LocalStorage>(
    () => LocalStorage(),
  );
  getItInstance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      networkConnectionCheck: getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton(() => Connectivity());
}
