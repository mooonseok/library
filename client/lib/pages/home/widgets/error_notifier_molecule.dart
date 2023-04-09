import 'package:client/design_system/components/atoms/button254_atom.dart';
import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/design_system/types/button_types.dart';
import 'package:client/styles/typo_type.dart';
import 'package:client/utility/common_methods/common_method.dart';
import 'package:flutter/material.dart';

class ErrorNotifierMolecule extends StatelessWidget {
  final VoidCallback retryButtonCallback;

  const ErrorNotifierMolecule({
    Key? key,
    required this.retryButtonCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerPaddingValue = CommonMethod.calculate.relativeHeight(30);
    final bodyPaddingValue = CommonMethod.calculate.relativeHeight(93);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: headerPaddingValue),
          child: Text254Atom(
            '시스템 문제로 인하여\n오류가 발생하였습니다.',
            style: TypoType.headLine2M.getTextStyle(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: bodyPaddingValue),
          child: Text254Atom(
            '하단 버튼을 통해 페이지를 새로고침 해주세요.',
            style: TypoType.subLine1R.getTextStyle(),
          ),
        ),
        Button254Atom(
          onPressed: retryButtonCallback,
          titleWidget:
              Text254Atom('새로고침', style: TypoType.body1B.getTextStyle()),
          buttonType: ButtonTypes.smallFillStyle,
        )
      ],
    );
  }
}
