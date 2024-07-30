import 'package:erkatoy_afex_ai/core/provider/remote/api_client.dart';
import 'package:erkatoy_afex_ai/feature/auth/data/remote/source/auth_remote_source_impl.dart';
import 'package:erkatoy_afex_ai/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:erkatoy_afex_ai/feature/auth/domain/repository/auth_repository.dart';
import 'package:erkatoy_afex_ai/feature/auth/domain/use_case/login_use_case.dart';
import 'package:erkatoy_afex_ai/feature/auth/domain/use_case/register_use_case.dart';
import 'package:erkatoy_afex_ai/feature/auth/domain/use_case/send_child_info_use_case.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/creating_account/bloc/create_account_bloc.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/login/bloc/login_bloc.dart';
import 'package:erkatoy_afex_ai/feature/auth/presentation/register/bloc/register_bloc.dart';
import 'package:erkatoy_afex_ai/feature/change_lang/bloc/change_lang_bloc.dart';
import 'package:erkatoy_afex_ai/feature/home/data/local/home_local_source.dart';
import 'package:erkatoy_afex_ai/feature/home/data/remote/source/home_remote_source_impl.dart';
import 'package:erkatoy_afex_ai/feature/home/data/repository/home_repository_impl.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/repository/home_repository.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/use_case/get_all_activities_use_case.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/use_case/get_cached_chats_use_case.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/use_case/get_current_activity_use_case.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/use_case/get_health_tips_use_case.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/use_case/request_to_ai_chat_use_case.dart';
import 'package:erkatoy_afex_ai/feature/home/domain/use_case/save_chat_to_db_use_case.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/chat/bloc/chat_bloc.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/daily_schedule/bloc/daily_schedule_bloc.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/health/bloc/health_bloc.dart';
import 'package:erkatoy_afex_ai/feature/home/presentation/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/provider/local/hive_local_storage.dart';
import 'core/service/connectivity/connectivity_cubit.dart';
import 'feature/home/domain/use_case/get_cry_reason_with_audio_use_case.dart';
import 'feature/settings/presentation/bloc/settings_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt
    ..registerLazySingleton<HiveLocalStorage>(HiveLocalStorage.new)
    ..registerLazySingleton<ApiClient>(() => ApiClient(localStorage: getIt<HiveLocalStorage>()))
    ..registerFactory<ConnectivityCubit>(ConnectivityCubit.new)
    ..registerFactory<ChangeLangBloc>(
      () => ChangeLangBloc(localStorage: getIt<HiveLocalStorage>()),
    )

    /// auth
    ..registerLazySingleton<AuthRemoteSource>(
        () => AuthRemoteSourceImpl(apiClient: getIt<ApiClient>()))
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
          remoteSource: getIt<AuthRemoteSource>(),
          localStorage: getIt<HiveLocalStorage>(),
        ))
    // use cases
    ..registerFactory<SendChildInfoUseCase>(
        () => SendChildInfoUseCase(repository: getIt<AuthRepository>()))
    ..registerFactory<RegisterUseCase>(() => RegisterUseCase(repository: getIt<AuthRepository>()))
    ..registerFactory<LoginUseCase>(() => LoginUseCase(repository: getIt<AuthRepository>()))
    ..registerFactory<RegisterBloc>(() => RegisterBloc(registerUseCase: getIt<RegisterUseCase>()))
    // bloc
    ..registerFactory<CreateAccountBloc>(() => CreateAccountBloc(
          loginUseCase: getIt<LoginUseCase>(),
          sendChildInfoUseCase: getIt<SendChildInfoUseCase>(),
        ))
    ..registerFactory<LoginBloc>(() => LoginBloc(loginUseCase: getIt<LoginUseCase>()))

    /// home
    ..registerLazySingleton<HomeLocalSource>(HomeLocalSource.new)
    ..registerLazySingleton<HomeRemoteSource>(
        () => HomeRemoteSourceImpl(apiClient: getIt<ApiClient>()))
    ..registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
          remoteSource: getIt<HomeRemoteSource>(),
          localSource: getIt<HomeLocalSource>(),
        ))
    //
    ..registerFactory<GetAllActivitiesUseCase>(
        () => GetAllActivitiesUseCase(repository: getIt<HomeRepository>()))
    ..registerFactory<GetCurrentActivityUseCase>(
        () => GetCurrentActivityUseCase(repository: getIt<HomeRepository>()))
    ..registerFactory<GetHealthTipsUseCase>(
        () => GetHealthTipsUseCase(repository: getIt<HomeRepository>()))
    ..registerFactory<SaveChatToDbUseCase>(
        () => SaveChatToDbUseCase(repository: getIt<HomeRepository>()))
    ..registerFactory<GetCachedChatsUseCase>(
        () => GetCachedChatsUseCase(repository: getIt<HomeRepository>()))
    ..registerFactory<RequestToAiChatUseCase>(
        () => RequestToAiChatUseCase(repository: getIt<HomeRepository>()))
    ..registerFactory<GetCryReasonWithAudioUseCase>(
        () => GetCryReasonWithAudioUseCase(repository: getIt<HomeRepository>()))
    //
    ..registerFactory<HomeBloc>(() => HomeBloc(
          getCurrentActivityUseCase: getIt<GetCurrentActivityUseCase>(),
          getCryReasonWithAudioUseCase: getIt<GetCryReasonWithAudioUseCase>(),
        ))
    ..registerFactory<ChatBloc>(() => ChatBloc(
          getCachedChatsUseCase: getIt<GetCachedChatsUseCase>(),
          saveChatToDbUseCase: getIt<SaveChatToDbUseCase>(),
          requestToAiChatUseCase: getIt<RequestToAiChatUseCase>(),
        ))
    ..registerFactory<DailyScheduleBloc>(
        () => DailyScheduleBloc(getAllActivitiesUseCase: getIt<GetAllActivitiesUseCase>()))
    ..registerFactory<HealthBloc>(
        () => HealthBloc(getHealthTipsUseCase: getIt<GetHealthTipsUseCase>()))

    /// settings
    ..registerFactory<SettingsBloc>(() => SettingsBloc(localStorage: getIt<HiveLocalStorage>()));
}
