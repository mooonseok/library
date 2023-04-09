import 'package:client/design_system/interfaces/infinite_scroll_function_interface.dart';
import 'package:client/design_system/interfaces/number_cubit_interface.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

abstract class InfiniteScrollCubitInterface
    extends NumberStateCubitInterface<int> {
  late PagingController<int, dynamic> controller;
  late InfiniteScrollFunctionInterface function;

  InfiniteScrollCubitInterface(super.initialState);

  void init(PagingController<int, dynamic> controller,
      InfiniteScrollFunctionInterface function) {
    this.controller = controller;
    this.function = function;
  }
}
