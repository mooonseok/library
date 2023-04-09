import 'package:client/design_system/states/future_state.dart';
import 'package:client/design_system/utility/primary_methods/primart_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@category Template}
/// # 비동기 IO 상태에 따라 다른 위젯을 렌더하는 클래스
/// * [cubit] : 상태를 제어하는 객체
/// * [onSuccessBuilder] : 비동기 IO 성공 시 위젯
/// * [onErrorBuilder] : 비동기 IO 실패 시 위젯
/// * [onLoadingWidget] : 비동기 IO 진행 중 위젯
/// * [onInitialWidget] : 비동기 IO 요청 전 위젯
/// * [onSuccessCallback] : 비동기 IO 성공 시 콜백
/// * [onErrorCallback] : 비동기 IO 실패 시 콜백
/// * [onLoadingCallback] : 비동기 IO 진행 상태 시작 시 콜백
/// * [onInitialCallback] : [DataBlocConsumer254Template] 위젯 생성 시 콜백
/// ```
/// [사용 예시]
/// // data_consumer_templat.dart
/// class DataBlocConsumerTemplate<T> extends DataBlocConsumer254Template<T> {
///   DataBlocConsumerTemplate({
///     Key? key,
///     required super.cubit,
///     required super.onSuccessBuilder,
///     required super.onErrorBuilder,
///     super.onInitialWidget,
///     Widget? onLoadingWidget,
///     super.onErrorCallback,
///     super.onInitialCallback,
///     super.onLoadingCallback,
///     super.onSuccessCallback,
///   }) : super(
///           key: key,
///           onLoadingWidget: onLoadingWidget ?? ProgressingAtom(),
///         );
/// }
///
/// // home_page.dart
/// ...
/// Widget build(BuildContext context) {
///   return DataBlocConsumerTemplate<List<Photo>>(
///     cubit: photoDataCubit,
///     onLoadingWidget: _onLoadingWidget(),
///     onSuccessBuilder: _onSuccessBuilder,
///     onErrorBuilder: _onErrorBuilder,
///   );
/// }
/// ```

abstract class DataBlocConsumer254Template<ResultDataType>
    extends StatelessWidget {
  const DataBlocConsumer254Template({
    Key? key,
    required this.cubit,
    this.onSuccessBuilder,
    this.onErrorBuilder,
    this.onLoadingWidget,
    this.onInitialWidget,
    this.onSuccessCallback,
    this.onErrorCallback,
    this.onLoadingCallback,
    this.onInitialCallback,
  }) : super(key: key);

  final Cubit<FutureState> cubit;

  // builder
  final Widget Function(ResultDataType)? onSuccessBuilder;
  final Widget Function(String)? onErrorBuilder;
  final Widget? onLoadingWidget;
  final Widget? onInitialWidget;

  // listener
  final void Function(ResultDataType)? onSuccessCallback;
  final void Function(String, int?)? onErrorCallback;
  final VoidCallback? onLoadingCallback;
  final VoidCallback? onInitialCallback;

  @override
  Widget build(BuildContext context) {
    if (cubit.state is Init) onInitialCallback?.call();

    return BlocConsumer(
      bloc: cubit,
      listener: (context, FutureState state) {
        state.when(
          success: (data) => onSuccessCallback?.call(data),
          error: (message, statusCode) =>
              onErrorCallback?.call(message, statusCode),
          loading: () => onLoadingCallback?.call(),
          init: () => onInitialCallback?.call(),
        );
      },
      builder: (context, FutureState state) {
        return state.when(
          success: (data) => _makeBuilderNullsafe<ResultDataType>(
            builder: onSuccessBuilder,
            builderArgument: data,
          ),
          error: (message, _) => _makeBuilderNullsafe<String>(
            builder: onErrorBuilder,
            builderArgument: message,
          ),
          loading: () => onLoadingWidget ?? Container(),
          init: () => onInitialWidget ?? Container(),
        );
      },
    );
  }

  Widget _makeBuilderNullsafe<T>(
      {required Widget Function(T)? builder, required T builderArgument}) {
    if (PrimaryMethod.check.isNotNull(builder)) {
      return builder!(builderArgument);
    }
    if (PrimaryMethod.check.isNotNull(onInitialWidget)) {
      return onInitialWidget!;
    }
    return Container();
  }
}
