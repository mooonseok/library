// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      id: json['id'] as int,
      name: json['name'] as String,
      author: json['author'] as String,
      publisher: json['publisher'] as String,
      isAbleCheckOut: json['isAbleCheckOut'] as bool,
      borrower: json['borrower'] as String?,
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'publisher': instance.publisher,
      'isAbleCheckOut': instance.isAbleCheckOut,
      'borrower': instance.borrower,
    };
