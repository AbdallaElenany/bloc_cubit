import '../../../../../core/networking/api_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../api_service/book_details/book_details_api_service.dart';
import '../../models/book_response_model.dart';

class BookDetailsRepo {
  final BookDetailsApiService _apiService;

  BookDetailsRepo(this._apiService);

  Future<ApiResult<BookResponseModel>> similarBooks() async {
    try {
      final response = await _apiService.getSimilarBooks();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
