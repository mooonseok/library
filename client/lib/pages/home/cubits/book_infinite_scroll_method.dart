import 'package:client/design_system/interfaces/infinite_scroll_cubit_interface.dart';
import 'package:client/design_system/interfaces/infinite_scroll_function_interface.dart';
import 'package:client/design_system/interfaces/infinite_scroll_interface.dart';
import 'package:client/pages/home/widgets/book_list_row_molecule.dart';
import 'package:flutter/material.dart';

class BookInfiniteScrollMethod extends InfiniteScrollInterface<dynamic> {
  final InfiniteScrollCubitInterface dataCubit;
  late InfiniteScrollFunctionInterface functionProps;
  BookInfiniteScrollMethod({
    required this.dataCubit,
  }) {
    functionProps = dataCubit.function;
  }

  @override
  Future<List<dynamic>> getInfiniteScrollItemData({
    required int pageSize,
    required int pageKey,
    bool? isAbleToCheckOut,
    String? keyword,
  }) async {
    return functionProps.getData!(
      pageKey: pageKey,
      pageSize: pageSize,
    );
  }

  @override
  Widget setInfiniteScrollWidget({
    required dynamic item,
    int? index,
  }) {
    return BookListRowMolecule.buildWidget(
      book: item,
    );
  }

  @override
  void onError(BuildContext context, error, VoidCallback retry,
      {int? statusCode}) {
    if (error is Error) {
      print(error);
    } else {
      super.onError(context, error, retry);
    }
  }
}
