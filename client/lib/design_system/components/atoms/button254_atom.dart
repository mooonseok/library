import 'package:client/design_system/types/button_types.dart';
import 'package:client/design_system/utility/primary_methods/primart_method.dart';
import 'package:flutter/material.dart';

/// {@category Atom}
/// # 버튼을 만드는 클래스
/// * [titleWidget] : 타이틀 위젯을 나타냅니다.
/// * [onPressed] : 버튼을 눌렀을 때 기능을 나타냅니다.
/// * [buttonType] : 버튼의 모양을 결정합니다.(옵션 =default 적용)
/// * [borderColor] : 버튼의 테두리의 색을 결정합니다.단, type에 line 포함시입니다.(옵션 =default 적용)
/// * [textColor] : 텍스트의 색상을 결정합니다.(옵션 =default 적용)
/// * [backgroundColor] : 버튼 배경의 색상을 결정합니다.(옵션 =default 적용)
/// * [widthFactor] : 버튼의 넓이값을 부모의 비율에 맞춰 조정합니다.(옵션 =default 적용)
/// * [groupLeft] : 버튼이 묶음으로 사용되고 우측일 때, 왼쪽 모서리의 둥근 형태를 변경합니다.(옵션 =default 적용)
/// * [groupRight] : 버튼이 묶음으로 사용되고 좌측일 때, 오른쪽 모서리의 둥근 형태를 변경합니다.(옵션 =default 적용)
///
///
/// ```
/// [사용 예시]
/// small이 포함된 상태의 경우, title/titleWidget에 따라 사이즈가 변경됩니다.
///Button254Atom(
///         title: "제목",
///      onPressed: () {},
///   buttonType: ButtonTypes.smallFillStyle,
///),
class Button254Atom extends StatelessWidget {
  final Widget titleWidget;
  final VoidCallback? onPressed;
  final ButtonTypes buttonType;
  final Color borderColor;
  final Color? splashColor;
  final Color backgroundColor;
  final double widthFactor;
  final EdgeInsets padding;
  final Size? fixedSize;
  final bool groupLeft, groupRight;
  final BorderRadius? customBorderRadius;
  final Color shadowColor;
  const Button254Atom({
    Key? key,
    required this.onPressed,
    required this.buttonType,
    required this.titleWidget,
    this.groupLeft = false,
    this.groupRight = false,
    this.widthFactor = 1,
    this.fixedSize,
    this.customBorderRadius,
    this.padding = EdgeInsets.zero,
    this.shadowColor = Colors.transparent,
    this.borderColor = Colors.blueAccent,
    this.backgroundColor = Colors.lightBlue,
    this.splashColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buttonType.name.contains("small") ||
            PrimaryMethod.check.isNotNull(fixedSize)
        ? button()
        : Material(
            color: Colors.transparent,
            child: FractionallySizedBox(
              widthFactor: widthFactor,
              child: button(),
            ),
          );
  }

  Radius borderRadius() {
    Radius radius =
        groupLeft || groupRight ? const Radius.circular(62) : Radius.zero;
    if (buttonType.name.contains("regular")) radius = const Radius.circular(12);
    if (buttonType.name.contains("small")) radius = const Radius.circular(10);

    return radius;
  }

  OutlinedBorder border() {
    return RoundedRectangleBorder(
      side: BorderSide(
          color: buttonType.name.contains("Line")
              ? borderColor
              : Colors.transparent,
          width: 1),
      borderRadius: PrimaryMethod.check.isNull(customBorderRadius)
          ? BorderRadius.horizontal(
              left: groupLeft ? Radius.zero : borderRadius(),
              right: groupRight ? Radius.zero : borderRadius(),
            )
          : customBorderRadius!,
    );
  }

  ElevatedButton button() {
    Color? onPrimary = PrimaryMethod.check.isNull(splashColor)
        ? (buttonType.name.contains("Line") ? borderColor : null)
        : splashColor;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: fixedSize,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shadowColor: shadowColor,
          padding: padding,
          onPrimary: onPrimary,
          primary:
              buttonType.name.contains("Line") ? Colors.white : backgroundColor,
          shape: border(),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: titleWidget);
  }
}
