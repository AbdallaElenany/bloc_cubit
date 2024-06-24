import 'package:bloc_cubit/features/home/data/models/book_model.dart';
import '../../../../core/networking/api_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<BookModel>> newestBooks() async {
    try {
      final response = await _apiService.getNewestBooks();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<BookModel>> featuredBooks() async {
    try {
      final response = await _apiService.getFeaturedBooks();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<BookModel>> similarBooks() async {
    try {
      final response = await _apiService.getSimilarBooks();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
