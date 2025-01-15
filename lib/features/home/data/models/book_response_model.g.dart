// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookResponseModel _$BookResponseModelFromJson(Map<String, dynamic> json) =>
    BookResponseModel(
      bookDataList: (json['items'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : BookModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookResponseModelToJson(BookResponseModel instance) =>
    <String, dynamic>{
      'items': instance.bookDataList,
    };
