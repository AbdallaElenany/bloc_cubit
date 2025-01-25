import 'package:bloc_cubit/features/home/data/repository/book_details/book_details_repository.dart';
import 'package:bloc_cubit/features/home/logic_cubit/book_details/book_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/book_model.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  final BookDetailsRepo _bookDetailsRepo;
  BookDetailsCubit(this._bookDetailsRepo)
      : super(const BookDetailsState.initial());

  List<BookModel?>? bookDetailsList = [];

  void emitSimilarBooks() async {
    emit(const BookDetailsState.loading());
    final response = await _bookDetailsRepo.similarBooks();
    response.when(success: (homeResponse) {
      bookDetailsList = homeResponse.bookDataList ?? [];
      emit(BookDetailsState.success(bookDetailsList));
    }, failure: (error) {
      emit(BookDetailsState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
