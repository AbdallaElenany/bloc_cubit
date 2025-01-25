import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/book_model.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.loading() = Loading;
  const factory HomeState.successF(List<BookModel?>? bookDataList) = SuccessF;
  const factory HomeState.successN(List<BookModel?>? bookDataList) = SuccessN;
  const factory HomeState.error({required String error}) = Error;
}
