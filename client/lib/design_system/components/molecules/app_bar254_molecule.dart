import 'package:flutter/material.dart';

/// {@category Molecules}
/// # 텍스트를 _design_system에 맞게 조절이 가능한 클래스
/// * [title] : 앱바에 드러날 타이틀위젯을 가져옵니다.
/// * [leading] : 앞 부분에 나올 내용을 결정합니다.
/// * [key] : 키 값을 결정합니다.
/// * [automaticallyImplyLeading] : 자동 정렬을 나타냅니다.
/// * [actions] : 타이틀 이후에 나올 위젯들을 불러옵니다.
/// * [flexibleSpace] : 탭 표시줄 뒤에 쌓이는 위젯을 불러옵니다.
/// * [bottom] : 앱바 아래에 포함될 위젯을 불러옵니다.
/// * [shadowColor] : 앱바의 그림자진 색을 가져옵니다.
/// * [shape] : 앱바의 모양 및 그림자등을 불러옵니다.
/// * [backgroundColor] : 배경색을 설정합니다.
/// * [foregroundColor] : 전경색을 설정합니다.
/// * [iconTheme] : 툴바 아이콘에서 사용될 아이콘의 테마를 결정합니다.
/// * [primary] : 앱바가 화면 상단에 표시될지의 여부를 나타냅니다.
/// * [centerTitle] : 타이틀이 중앙에 위치할지를 결정합니다.
/// * [excludeHeaderSemantics] : 텍스트의 위아래에 적용하는 방법을 결정합니다.
/// * [titleSpacing] : 컨텐츠의 간격을 결정합니다.
/// * [toolbarOpacity] : 툴바의 투명도를 나타냅니다.
/// * [bottomOpacity] : 툴바 아래 생성된 위젯의 투명도를 나타냅니다.
/// * [toolbarHeight] : 툴바의 높이를 결정합니다.
/// * [leadingWidth] : 앞 부분에 나올 내용의 위드값을 결정합니다.
/// * [elevation] : z값 속성으로 클수록 다른 위젯들보다 가장 앞에 나타납니다.
/// * [toolbarTextStyle] : 툴바의 기본 텍스트스타일을 결정합니다.
/// * [systemOverlayStyle] : 앱바와 겹치는 시스템오버레이를 결정합니다.
/// * [actionsIconTheme] : 앱바에서 사용될 아이콘의 색상, 불투명도 및 크기를 나타냅니다.
/// * **ReturnType : Widget**
///
/// ```
/// [사용 예시]
/// AppBar254Molecule(titleText: "앱바 부분입니다.");
/// ```

class AppBar254Molecule extends AppBar {
  AppBar254Molecule({
    required super.title,
    super.key,
    super.leading,
    super.automaticallyImplyLeading = true,
    super.actions,
    super.flexibleSpace,
    super.bottom,
    super.shadowColor,
    super.shape,
    super.backgroundColor = Colors.transparent,
    super.foregroundColor,
    super.iconTheme,
    super.actionsIconTheme,
    super.primary,
    super.centerTitle,
    super.excludeHeaderSemantics,
    super.titleSpacing,
    super.toolbarOpacity,
    super.bottomOpacity,
    super.toolbarHeight,
    super.leadingWidth,
    super.elevation,
    super.toolbarTextStyle,
    super.systemOverlayStyle,
  }) : super();
}
