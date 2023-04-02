import 'package:client/design_system/interfaces/progress_screen_interface.dart';
import 'package:client/design_system/utility/primary_methods/primart_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

/// {@category Templates}
/// # 스티키헤더를 생성해주는 클래스.
/// * [disapearingHeader] : 위로 사라지는 위젯을 나타냅니다.
/// * [stickyTabMenuText] : 스티키헤더가 적용될 탭메뉴를 나타냅니다.
/// * [tabBody] : 각각의 탭에서 사용될 탭바디를 불러옵니다.
/// * [scrollController] : 스크롤되는 컨트롤러를 나타냅니다.
/// * [isTabBarScrollable] : 탭스크롤이 가능한지에 대한 여부를 나타냅니다.
/// * [indicator] : 탭을 가리키는 인디케이터를 결정합니다.
/// * [indicatorSize] : 탭을 가리키는 인디케이터의 사이즈를 결정합니다.
/// * [labelStyle] : 탭메뉴의 선택된 라벨스타일을 결정합니다.
/// * [labelColor] : 탭메뉴의 선택된 라벨색을 결정합니다.
/// * [unselectedLabelStyle] : 탭메뉴의 선택되지 않은 라벨스타일을 결정합니다.
/// * [unselectedLabelColor] : 탭메뉴의 선택되지 않은 라벨색을 결정합니다.
/// * [tabbarHeight] : 탭바의 높이를 결정합니다.
/// * [tabBarColor] : 탭바의 색상를 결정합니다.
/// * [onTap] : 탭시 기능을 불러옵니다.
///
///
///인피니트스크롤의 경우, InfiniteScrollMethod<ListItem>을 이용해서 만들 데이타 및 위젯을 정의해줍니다.
/// ```
/// [사용 예시]
/// StickyHeader254Template(
/// scrollController: scrollController,
/// disapearingHeader: Column(
///   children: [
///     Text254("테스트를 위한 텍스트입니다1", Typo254Types.header2),
///     Text254("테스트를 위한 텍스트입니다1", Typo254Types.header2),
///     Text254("테스트를 위한 텍스트입니다1", Typo254Types.header2),
///     Text254("테스트를 위한 텍스트입니다1", Typo254Types.header2),
///     Text254("테스트를 위한 텍스트입니다2", Typo254Types.header2),
///   ],
/// ),
/// stickyTabMenuText: const ['컴포넌트', '검색창', '인피니트 스크롤'] ,
/// tabBody: [
///   _projectListItemSection(scrollController),
///   _projectListItemSection(scrollController),
///   _projectListItemSection(scrollController),
///   _projectListItemSection(scrollController),
/// ],
/// );
///
/// ```
class StickyHeader254Template extends StatelessWidget {
  /// 스티키헤더의 탭메뉴의 경우, Tab으로 작성해야 컬러가 지정이 됩니다. 색이 변경이 필요한 부분은 탭으로 작성해 주시길 바랍니다.
  final List<String> stickyTabMenuText;
  final List<Widget> tabBody;
  final ScrollController scrollController;
  final Widget? disapearingHeader;
  final bool? isTabBarScrollable;
  final Decoration? indicator;
  final TabBarIndicatorSize? indicatorSize;
  final TextStyle labelStyle;
  final Color labelColor;
  final TextStyle unselectedLabelStyle;
  final Color unselectedLabelColor;
  final double? tabbarHeight;
  final Color tabBarColor;
  final Color indicatorColor;
  final void Function()? onTap;
  final bool? floating;
  final bool? pinned;
  final bool? snap;
  final bool? primary;
  final bool? centerTitle;
  const StickyHeader254Template({
    required this.stickyTabMenuText,
    required this.scrollController,
    required this.tabBody,
    required this.labelStyle,
    required this.labelColor,
    required this.unselectedLabelStyle,
    required this.unselectedLabelColor,
    required this.tabBarColor,
    required this.indicatorColor,
    this.disapearingHeader,
    this.onTap,
    this.isTabBarScrollable = false,
    this.indicator,
    this.tabbarHeight,
    this.indicatorSize = TabBarIndicatorSize.tab,
    this.floating = true,
    this.pinned = true,
    this.snap = false,
    this.primary = true,
    this.centerTitle = false,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int tabLength = stickyTabMenuText.length;
    Decoration indicator = this.indicator ??
        const UnderlineTabIndicator(
          borderSide: BorderSide(color: Colors.transparent, width: 0.0),
        );

    return DefaultStickyHeaderController(
      child: DefaultTabController(
        length: tabLength,
        child: Builder(
          builder: (context) {
            final tabController = DefaultTabController.of(context);

            tabController!.animation!.addListener(
              PrimaryMethod.check.isNull(onTap)
                  ? () {
                      _ProgressScreenCubit progressScreenCubit =
                          _ProgressScreenCubit(0);
                      BlocProvider(create: (context) => progressScreenCubit);
                      progressScreenCubit
                          .tabBarChanged(tabController.animation!.value);
                    }
                  : () {},
            );

            return NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverStickyHeader(
                    header: disapearingHeader,
                    sticky: true,
                  ),
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                      collapsedHeight: kToolbarHeight,
                      toolbarHeight: kToolbarHeight,
                      automaticallyImplyLeading: false,
                      backgroundColor: tabBarColor,
                      floating: floating!,
                      pinned: pinned!,
                      snap: snap!,
                      primary: primary!,
                      centerTitle: centerTitle,
                      title: TabBar(
                        labelPadding: EdgeInsets.zero,
                        onTap: (int i) => onTap,
                        isScrollable: isTabBarScrollable!,
                        indicator: indicator,
                        indicatorSize: indicatorSize,
                        indicatorWeight: 0, //인디케이터 두께
                        indicatorPadding: EdgeInsets.zero,
                        labelColor: labelColor,
                        labelStyle: labelStyle,
                        unselectedLabelStyle: unselectedLabelStyle,
                        unselectedLabelColor: unselectedLabelColor,
                        indicatorColor: indicatorColor, // 인디케이터 컬러
                        tabs: _makeTabMenuList(stickyTabMenuText, tabLength),
                      ),
                    ),
                  ),
                ];
              },
              body: Padding(
                padding: const EdgeInsets.only(top: kToolbarHeight),
                child: TabBarView(
                  controller: tabController,
                  children: tabBody,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _makeTabMenuList(List<String> stickyTabMenuText, int tabLength) {
    List<Widget> stickyTabMenuList = [];
    for (var tabMenu in stickyTabMenuText) {
      stickyTabMenuList.add(
        Tab(
          text: tabMenu,
        ),
      );
    }
    return stickyTabMenuList;
  }
}

class _ProgressScreenCubit extends ProgressScreenInterface {
  _ProgressScreenCubit(super.initialState);

  @override
  void tabBarChanged(double value) {
    emit(value.round().toDouble());
  }
}
