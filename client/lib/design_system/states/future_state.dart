import 'package:freezed_annotation/freezed_annotation.dart';

part 'future_state.freezed.dart';

@freezed
class FutureState<T> with _$FutureState {
  const factory FutureState.success(T data) = Success;
  const factory FutureState.error(String error, {int? statusCode}) = Error;
  const factory FutureState.loading() = Loading;
  const factory FutureState.init() = Init;
}
