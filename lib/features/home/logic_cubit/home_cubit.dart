import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/book_model.dart';
import '../data/repository/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<BookModel?>? bookDataListF = [];
  List<BookModel?>? bookDataListN = [];

  void emitNewestBooksStates() async {
    emit(const HomeState.loading());
    final response = await _homeRepo.newestBooks();
    response.when(success: (homeResponse) {
      bookDataListN = homeResponse.bookDataList ?? [];
      emit(HomeState.successN(bookDataListN));
    }, failure: (error) {
      emit(HomeState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  void emitFeaturedBooksStates() async {
    emit(const HomeState.loading());
    final response = await _homeRepo.featuredBooks();
    response.when(success: (homeResponse) {
      bookDataListF = homeResponse.bookDataList ?? [];
      emit(HomeState.successF(bookDataListF));
    }, failure: (error) {
      emit(HomeState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
