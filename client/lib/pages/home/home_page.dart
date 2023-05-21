import 'package:client/database/book/entities/book.dart';
import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/design_system/components/molecules/app_bar254_molecule.dart';
import 'package:client/design_system/components/templates/infinity_scroll_template254.dart';
import 'package:client/pages/book_add_page/book_add_page.dart';
import 'package:client/pages/home/cubits/book_infinite_scroll_funtion.dart';
import 'package:client/pages/home/cubits/book_infinite_scroll_method.dart';
import 'package:client/pages/home/home_view_model.dart';
import 'package:client/pages/home/models/management_menu_model.dart';
import 'package:client/pages/home/widgets/book_delete_modal_organism.dart';
import 'package:client/pages/home/widgets/book_list_tab_title_molecule.dart';
import 'package:client/pages/home/widgets/check_box_atom.dart';
import 'package:client/pages/home/widgets/error_notifier_molecule.dart';
import 'package:client/pages/home/widgets/home_tab_bar_template.dart';
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
      body: HomeTabBarTemplate(
        vm: vm,
        tabBody: [
          _BookListTemplate(vm: vm),
          _BookManageTemplate(vm: vm),
        ],
      ),
    );
  }
}
