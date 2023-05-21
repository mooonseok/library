import 'package:client/design_system/components/templates/tab_bar254_template.dart';
import 'package:client/pages/home/home_view_model.dart';
import 'package:client/styles/color_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:flutter/material.dart';

class HomeTabBarTemplate extends StatelessWidget {
  final HomeViewModel vm;
  final List<Widget> tabBody;
  const HomeTabBarTemplate(
      {super.key, required this.vm, required this.tabBody});

  @override
  Widget build(BuildContext context) {
    return StickyHeader254Template(
      stickyTabMenuText: const ['도서목록', '도서관리'],
      scrollController: vm.homeControllerModel.scrollController,
      tabBody: tabBody,
      labelStyle: TypoType.subLine1B.getTextStyle(),
      labelColor: ColorType.systemWhite.color,
      unselectedLabelStyle: TypoType.subLine1B.getTextStyle(),
      unselectedLabelColor: ColorType.gray600.color,
      tabBarColor: ColorType.systemBlue.color,
      indicatorColor: ColorType.pastelOrange.color,
    );
  }
}
