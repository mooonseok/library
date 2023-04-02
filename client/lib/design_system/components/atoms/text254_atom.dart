import 'package:flutter/material.dart';

/// {@category Atoms}
/// # 텍스트를 _design_system에 맞게 조절이 가능한 클래스
/// * [text] : 들어갈 텍스트를 입력합니다.
/// * [style] : 텍스트의 모양을 결정할 스타일을 불러옵니다.
/// * [key] : 키 값을 결정합니다.
/// * [strutStyle] : 기준선을 결정합니다. 최소 라인의 높이를 설정합니다.
/// * [textDirection] : 텍스트가 나타낼 방향을 결정합니다.
/// * [locale] : 언어에 대한 세팅을 불러옵니다.
/// * [softWrap] : 텍스트가 끊어지게 감싸지는지에 대한 여부를 가져옵니다.
/// * [overflow] : 텍스트가 넘칠 때의 상황을 결정합니다.
/// * [textScaleFactor] : 시스템에서의 텍스트 실제 사이즈를 결정합니다.
/// * [maxLines] : 최대 줄의 갯수를 불러옵니다.
/// * [semanticsLabel] : 진행률의 표시기를 나타냅니다.
/// * [textWidthBasis] : 렌더링 된 텍스트의 위드값을 나타냅니다.
/// * [textHeightBehavior] : 텍스트의 위아래에 적용하는 방법을 결정합니다.
/// * **ReturnType : Widget**
///
/// ```
/// [사용 예시]
/// Text254Atom(
/// 'Contents',style: TypoType.h2B.getTextStyle(textColor: ColorType.disabled.color),
/// );
/// ```
class Text254Atom extends Text {
  const Text254Atom(
    String text, {
    required super.style,
    super.key,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaleFactor,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
  }) : super(text);
}