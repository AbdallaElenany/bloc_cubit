import '../../../../../core/networking/api_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../api_service/home/home_api_service.dart';
import '../../models/book_response_model.dart';

class HomeRepo {
  final HomeApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<BookResponseModel>> newestBooks() async {
    try {
      final response = await _apiService.getNewestBooks();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<BookResponseModel>> featuredBooks() async {
    try {
      final response = await _apiService.getFeaturedBooks();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
