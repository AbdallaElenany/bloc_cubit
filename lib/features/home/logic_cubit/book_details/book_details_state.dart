import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/book_model.dart';
part 'book_details_state.freezed.dart';

@freezed
class BookDetailsState with _$BookDetailsState {
  const factory BookDetailsState.initial() = _Initial;

  const factory BookDetailsState.loading() = Loading;
  const factory BookDetailsState.success(List<BookModel?>? bookDetailsList) =
      Success;
  const factory BookDetailsState.error({required String error}) = Error;
}
