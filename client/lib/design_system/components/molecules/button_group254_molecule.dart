import 'package:client/design_system/components/atoms/button254_atom.dart';
import 'package:client/design_system/utility/primary_methods/primart_method.dart';
import 'package:flutter/material.dart';

/// {@category Organisms}
/// # 버튼을 묶음으로 만들어주는 클래스
/// * [buttons] : 묶을 버튼을 List형태로 Button254를 받아옵니다.
/// * [flexes] : 각각 버튼의 비율칸을 나타냅니다.
/// * [widthFactor] : 버튼을 감싸는 위젯의 width값에 퍼센티지로 width비율을 결정합니다.
///
/// ```
/// [사용 예시]
/// ButtonGroup254Organism(
///   buttons:[
///     Button254(
///       "취소",
///       () {},
///       Button254Types.regularFillStyle,
///       theme: TextBoxTheme254.buttonGray,
///     ),
///     Button254("수정하기", () {}, Button254Types.regularFillStyle),
///   ],
///   flexes: [3, 7],
/// ),
/// ```
class Button254GroupMolecule extends StatelessWidget {
  // 여러 버튼을 받아서 하나의 그룹으로 만들어주는 클래스
  final List<Button254Atom> buttons;
  final List<int>? flexes;
  final double widthFactor;

  const Button254GroupMolecule({
    required this.buttons,
    this.flexes,
    this.widthFactor = 1.0,
    Key? key,
  })  : assert((flexes == null) ^ (flexes?.length == buttons.length)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> formattedButtons = [];

    for (int i = 0; i < buttons.length; i++) {
      formattedButtons.add(_buttonFormat(buttons[i],
          groupLeft: i == 0 ? false : true,
          groupRight: i == buttons.length - 1 ? false : true,
          flex: PrimaryMethod.check.isNull(flexes) ? 1 : flexes![i]));
    }
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: Row(
        children: formattedButtons,
      ),
    );
  }

  Widget _buttonFormat(Button254Atom button,
      {bool groupLeft = true, bool groupRight = true, int? flex}) {
    return Expanded(
      flex: flex!,
      child: Button254Atom(
        groupLeft: groupLeft,
        groupRight: groupRight,
        onPressed: button.onPressed,
        buttonType: button.buttonType,
        titleWidget: button.titleWidget,
        customBorderRadius: button.customBorderRadius,
        backgroundColor: button.backgroundColor,
        splashColor: button.splashColor,
        borderColor: button.borderColor,
        shadowColor: button.shadowColor,
      ),
    );
  }
}
