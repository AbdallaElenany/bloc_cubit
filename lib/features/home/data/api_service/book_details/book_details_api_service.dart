import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/networking/api_links.dart';
import '../../models/book_response_model.dart';
part 'book_details_api_service.g.dart';

@RestApi(baseUrl: AppLink.server)
abstract class BookDetailsApiService {
  factory BookDetailsApiService(Dio dio) = _BookDetailsApiService;

  @GET(AppLink.similarBooks)
  Future<BookResponseModel> getSimilarBooks();
}
