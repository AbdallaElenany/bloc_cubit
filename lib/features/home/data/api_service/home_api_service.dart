import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/networking/api_links.dart';
import '../models/book_response_model.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: AppLink.server)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(AppLink.newestBooks)
  Future<BookResponseModel> getNewestBooks();
  @GET(AppLink.featuredBooks)
  Future<BookResponseModel> getFeaturedBooks();
}
