import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/home/data/models/book_model.dart';
import 'api_links.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: AppLink.server)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(AppLink.newestBooks)
  Future<BookModel> getNewestBooks();
  @GET(AppLink.featuredBooks)
  Future<BookModel> getFeaturedBooks();
  @GET(AppLink.similarBooks)
  Future<BookModel> getSimilarBooks();
}
