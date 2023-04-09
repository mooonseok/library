import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/design_system/components/molecules/app_bar254_molecule.dart';
import 'package:client/design_system/components/templates/infinity_scroll_template254.dart';
import 'package:client/design_system/components/templates/tab_bar254_template.dart';
import 'package:client/pages/home/home_view_model.dart';
import 'package:client/pages/home/models/management_menu_model.dart';
import 'package:client/pages/home/widgets/book_list_tab_title_molecule.dart';
import 'package:client/pages/home/widgets/error_notifier_molecule.dart';
import 'package:client/pages/home/widgets/manage_list_tile_template.dart';
import 'package:client/pages/home/widgets/search_bar_molecule.dart';
import 'package:client/styles/color_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:client/utility/common_methods/common_method.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

part 'widgets/parts/home_page.book_list_template.dart';
part 'widgets/parts/home_page.book_manage_template.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home_page";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context);
    vm.init();

    return Scaffold(
      appBar: AppBar254Molecule(
        title: Text254Atom(
          '도서관',
          style: TypoType.headLine1B.getTextStyle(),
        ),
      ),
      body: StickyHeader254Template(
        stickyTabMenuText: const ['도서목록', '도서관리'],
        scrollController: vm.homeControllerModel.scrollController,
        isTabBarScrollable: false,
        tabBody: const [
          _BookListTemplate(),
          _BookManageTemplate(),
        ],
        labelStyle: TypoType.subLine1B.getTextStyle(),
        labelColor: ColorType.systemWhite.color,
        unselectedLabelStyle: TypoType.subLine1B.getTextStyle(),
        unselectedLabelColor: ColorType.gray600.color,
        tabBarColor: ColorType.systemBlue.color,
        indicatorColor: ColorType.pastelOrange.color,
      ),
    );
  }
}
