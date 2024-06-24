import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repository/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  void emitNewestBooksStates() async {
    emit(const HomeState.loading());
    final response = await _homeRepo.newestBooks();
    response.when(success: (homeResponse) {
      emit(HomeState.success(homeResponse));
    }, failure: (error) {
      emit(HomeState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  void emitFeaturedBooksStates() async {
    emit(const HomeState.loading());
    final response = await _homeRepo.featuredBooks();
    response.when(success: (homeResponse) {
      emit(HomeState.success(homeResponse));
    }, failure: (error) {
      emit(HomeState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

  void emitSimilarBooksStates() async {
    emit(const HomeState.loading());
    final response = await _homeRepo.similarBooks();
    response.when(success: (homeResponse) {
      emit(HomeState.success(homeResponse));
    }, failure: (error) {
      emit(HomeState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
