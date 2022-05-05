import 'package:get_it/get_it.dart';
import 'package:test_app/constants/global_pref_constants.dart';
import 'package:test_app/data/traffic/shymbulak_repository.dart';
import 'package:test_app/services/shymbulak_service.dart';

import '../network/network_client.dart';


final locator = GetIt.instance;
Future<void> setupLocator() async {
  _commonMainModule();
  _apiServiceModule();
  _repositoryModule();
  _useCaseModule();
}

void _commonMainModule() {
  // locator.registerSingletonAsync(() => createHttpClient(BuildTypeValue.url));

  /// для авторизованной зоны
  locator.registerSingletonAsync(
    () => createAuthorizedHttpClient(GlobalPrefConstants.baseUrl),
  );
}

void _apiServiceModule() async {
  /// для авторизованной зоны
  locator.registerSingleton(ShymbulakService(
    locator.getAsync(),
  ));
}

/// для репозиторий
void _repositoryModule() {
  ///платежи
  locator.registerFactory(() => ShymbulakRepository());
}

/// для useCase
void _useCaseModule() {
  // locator.registerFactory(() => GetMoviesInTheatreUseCase());
  // locator.registerFactory(() => GetPopularMoviesUseCase());
  // locator.registerFactory(() => GetDetailedMovieInfoUseCase());
  // locator.registerFactory(() => GetMoviePosterUseCase());
  // locator.registerFactory(() => GetTop250MovieUseCase());
}