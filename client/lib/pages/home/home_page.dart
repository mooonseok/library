import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/design_system/components/molecules/app_bar254_molecule.dart';
import 'package:client/design_system/components/templates/tab_bar254_template.dart';
import 'package:client/styles/color_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home_page";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: AppBar254Molecule(
        title: Text254Atom(
          '도서관',
          style: TypoType.headLine1B.getTextStyle(),
        ),
      ),
      body: StickyHeader254Template(
        stickyTabMenuText: ['1', '2'],
        scrollController: scrollController,
        tabBody: [
          Container(),
          Container(),
        ],
        labelStyle: TypoType.body1R.getTextStyle(),
        labelColor: ColorType.pastelBlue.color,
        unselectedLabelStyle: TypoType.body1R.getTextStyle(),
        unselectedLabelColor: ColorType.gray300.color,
        tabBarColor: ColorType.systemBlue.color,
        indicatorColor: ColorType.pastelOrange.color,
      ),
    );
  }
}
