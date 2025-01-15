import 'package:json_annotation/json_annotation.dart';
import 'book_model.dart';
part 'book_response_model.g.dart';

@JsonSerializable()
class BookResponseModel {
  @JsonKey(name: 'items')
  List<BookModel?>? bookDataList;

  BookResponseModel({
    this.bookDataList,
  });

  factory BookResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BookResponseModelFromJson(json);
}
