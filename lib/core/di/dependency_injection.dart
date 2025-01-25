import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/home/data/api_service/book_details/book_details_api_service.dart';
import '../../features/home/data/repository/book_details/book_details_repository.dart';
import '../../features/home/data/repository/home/home_repository.dart';
import '../../features/home/logic_cubit/book_details/book_details_cubit.dart';
import '../../features/home/logic_cubit/home/home_cubit.dart';
import '../../features/home/data/api_service/home/home_api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<BookDetailsApiService>(
      () => BookDetailsApiService(dio));

  //home
  getIt.registerFactory<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  //book_details
  getIt.registerFactory<BookDetailsRepo>(() => BookDetailsRepo(getIt()));
  getIt.registerFactory<BookDetailsCubit>(() => BookDetailsCubit(getIt()));
}
