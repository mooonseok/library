import 'package:client/design_system/components/atoms/progressing254_atom.dart';
import 'package:client/design_system/interfaces/infinite_scroll_interface.dart';
import 'package:client/design_system/models/result.dart';
import 'package:client/design_system/types/scroll_types.dart';
import 'package:client/design_system/utility/primary_methods/primart_method.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';


/// {@category Templates}
/// # 인피니트스크롤 생성해주는 클래스.
/// * [infiniteScrollBuilder] : 인피니트 스크롤의 데이터를 불러오는 메서드.
/// * [pageSize] : 한 번에 불러오는 양을 나타냅니다.
/// * [indicatorColor] : 인디케이터 색상 설정.
/// * [scrollType] : ListView 혹은 GridView 타입을 정합니다.
/// * [pagingController] : 페이지 컨트롤러를 나타냅니다.
/// * [scrollPhysics] : 스크롤 관련 설정을 나타냅니다.
/// * [noItemsFoundIndicatorBuilder] : 불러올 데이터가 없을 경우 보여줄 위젯을 나타냅니다.
/// * [firstPageErrorIndicatorBuilder] : 오류가 났을 경우 보여줄 위젯을 나타냅니다.
///
///
///인피니트스크롤의 경우, InfiniteScrollMethod<ListItem>을 이용해서 만들 데이타 및 위젯을 정의해줍니다.
/// ```
/// [사용 예시]
/// InfiniteScroll254Template<InfiniteScrollInfo>(
///         infiniteScrollBuilder: InfiniteScrollMethod(),
///         pageSize: 10,
///         indicatorColor: ColorType.primary.color,
///         noItemsFoundIndicatorBuilder: _makeNoItemsFoundIndicator,
/// );
///
///함수의 리턴타입을 Widget으로 받아와 그리도록 합니다.
/// Widget makeInfiniteItem(InfiniteScrollInfo info) {
///   return ListTile(
///     title: Text254(info.title, Typo254Types.body1),
///   );
/// }
///
/// [추상화 메소드 사용 예시]
///
///class MemoInfiniteScrollMethod extends InfiniteScrollMethod<Memo> {
///  @override
///  Future<List<Memo>> getInfiniteScrollItemData(
///      {int pageSize, int pageKey}) async {
///    return await memoTemporaryService(pageSize, pageKey);
///  }
///  @override
///  Widget setInfiniteScrollTileidget({item}) {
///    return makeInfiniteItemWidget(item);
///  }
///}
/// ```

class InfiniteScroll254Template<ItemType> extends StatefulWidget {
  final InfiniteScrollInterface<ItemType> infiniteScrollBuilder;
  final int pageSize;
  final Color indicatorColor;
  final ScrollTypes? scrollType;
  final ScrollPhysics? scrollPhysics;
  final PagingController<int, ItemType>? pagingController;
  final Widget Function(BuildContext)? noItemsFoundIndicatorBuilder;
  final Widget Function(BuildContext context, VoidCallback refresh)
      firstPageErrorIndicatorBuilder;
  final Widget Function(BuildContext)? firstPageProgressIndicatorBuilder;
  final SliverGridDelegate? gridDelegate;
  final int? status;

  const InfiniteScroll254Template({
    required this.infiniteScrollBuilder,
    required this.pageSize,
    required this.indicatorColor,
    Key? key,
    this.scrollType = ScrollTypes.listView,
    this.scrollPhysics,
    this.pagingController,
    this.noItemsFoundIndicatorBuilder,
    required this.firstPageErrorIndicatorBuilder,
    this.firstPageProgressIndicatorBuilder,
    this.gridDelegate,
    this.status,
  })  : assert((scrollType == ScrollTypes.gridView) ^ (gridDelegate == null)),
        super(key: key);
  @override
  State<InfiniteScroll254Template> createState() =>
      _InfiniteScroll254Template<ItemType>();
}

class _InfiniteScroll254Template<ItemType>
    extends State<InfiniteScroll254Template<ItemType>> {
  late PagingController<int, ItemType> _pagingController;
  Object? _activeCallbackIdentity;
  @override
  void initState() {
    _pagingController = widget.pagingController ??
        PagingController(firstPageKey: 0, invisibleItemsThreshold: 1);
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    /* _activeCallbackIdentity = callbackIdentity;
     페이징컨트롤러간 충돌 방지를 위해 작성한 오브젝트 */
    final callbackIdentity = Object();
    _activeCallbackIdentity = callbackIdentity;
    try {
      if (callbackIdentity == _activeCallbackIdentity) {
        List<ItemType> newItems =
            await widget.infiniteScrollBuilder.getInfiniteScrollItemData(
          pageKey: pageKey,
          pageSize: widget.pageSize,
        );
        final isLastPage = newItems.length < widget.pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = pageKey + newItems.length;
          _pagingController.appendPage(newItems, nextPageKey);
        }
      }
    } catch (error) {
      widget.infiniteScrollBuilder.onError(
        context,
        error,
        _pagingController.retryLastFailedRequest,
        statusCode: error is Error ? error.statusCode : null,
      );
      if (callbackIdentity == _activeCallbackIdentity) {
        _pagingController.error = error;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: widget.indicatorColor,
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: _makeScrollView(),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _activeCallbackIdentity = null;
    super.dispose();
  }

  Widget _makeScrollView() {
    Widget scrollWidget;
    switch (widget.scrollType!) {
      case ScrollTypes.listView:
        scrollWidget = PagedListView<int, ItemType>(
          physics: widget.scrollPhysics,
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<ItemType>(
            firstPageErrorIndicatorBuilder: (context) =>
                widget.firstPageErrorIndicatorBuilder(
                    context, _pagingController.refresh),
            firstPageProgressIndicatorBuilder: PrimaryMethod.check
                    .isNull(widget.firstPageProgressIndicatorBuilder)
                ? (context) => Progressing254Atom(widget.indicatorColor)
                : widget.firstPageProgressIndicatorBuilder!,
            itemBuilder: (context, item, index) {
              return widget.infiniteScrollBuilder
                  .setInfiniteScrollWidget(item: item, index: index);
            },
            noItemsFoundIndicatorBuilder: widget.noItemsFoundIndicatorBuilder,
          ),
        );

        break;

      case ScrollTypes.gridView:
        scrollWidget = PagedGridView<int, ItemType>(
          physics: widget.scrollPhysics,
          pagingController: _pagingController,
          shrinkWrap: true,
          builderDelegate: PagedChildBuilderDelegate<ItemType>(
            firstPageErrorIndicatorBuilder: (context) =>
                widget.firstPageErrorIndicatorBuilder(
                    context, _pagingController.refresh),
            itemBuilder: (context, item, index) {
              return widget.infiniteScrollBuilder
                  .setInfiniteScrollWidget(item: item, index: index);
            },
            firstPageProgressIndicatorBuilder: PrimaryMethod.check
                    .isNull(widget.firstPageProgressIndicatorBuilder!)
                ? (context) => Progressing254Atom(widget.indicatorColor)
                : widget.firstPageProgressIndicatorBuilder!,
            noItemsFoundIndicatorBuilder: widget.noItemsFoundIndicatorBuilder,
          ),
          gridDelegate: widget.gridDelegate!,
        );

        break;
    }

    return scrollWidget;
  }
}