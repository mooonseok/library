import 'dart:convert';
import 'dart:io';

import 'package:client/design_system/utility/primary_methods/primart_method.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success;
  const factory Result.error(String message, {int? statusCode}) = Error;

  static Result<T> byResponse<T>(Response response) {
    final statusCode = response.statusCode;
    final data = response.body.isNotEmpty ? jsonDecode(response.body) : "";

    switch (statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
        return Result<T>.success(data);
      default:
        final errorMessage = PrimaryMethod.check.isNotNull(data)
            ? data['message']
            : '서버 내부에서 예기치 못한 오류가 발생했습니다.';
        return Result.error(errorMessage, statusCode: statusCode);
    }
  }
}
