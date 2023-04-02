import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:flutter/material.dart';

//인피니트스크롤 메소드의 추상화

abstract class InfiniteScrollInterface<ListItem> {
  Future<List<ListItem>> getInfiniteScrollItemData(
      {required int pageSize, required int pageKey});

  Widget setInfiniteScrollWidget({required ListItem item, int? index});

  void onError(BuildContext context, dynamic error, VoidCallback retry,
      {int? statusCode}) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text254Atom(
        '데이터를 가져오는 데 문제가 발생했습니다.',
        style: TextStyle(),
      )),
    );
  }
}