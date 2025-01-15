import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/home/data/repository/home_repository.dart';
import '../../features/home/logic_cubit/home_cubit.dart';
import '../../features/home/data/api_service/home_api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));

  //home
  getIt.registerFactory<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
