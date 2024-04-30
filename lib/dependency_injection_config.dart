import 'package:flutter_messenger/core/local_storage/shared_preferences_service.dart';
import 'package:flutter_messenger/core/notifier/shared_preferences_notifier.dart';
import 'package:flutter_messenger/src/chat_heads/data/data_sources/chat_head_repository_impl.dart';
import 'package:flutter_messenger/src/chat_heads/domain/repository/chat_head_repository.dart';
import 'package:flutter_messenger/src/chat_heads/presentation/bloc/chat_heads_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory(
    () => ChatHeadsBloc(
      sl(),
    )..add(OnGetChatHeads()),
  );

  // Repositories
  sl.registerLazySingleton<ChatHeadRepository>(() => ChatHeadRepositoryImpl());

  // Shared preferences
  await setupSharedPreferencesDependencies();
}

Future<void> setupSharedPreferencesDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final sharedPreferencesService = SharedPreferencesService(sharedPreferences);
  final sharedPreferencesNotifier =
      SharedPreferencesNotifier(sharedPreferencesService);

  sl.registerLazySingleton<SharedPreferencesService>(
      () => sharedPreferencesService);
  sl.registerLazySingleton<SharedPreferencesNotifier>(
      () => sharedPreferencesNotifier);
}
