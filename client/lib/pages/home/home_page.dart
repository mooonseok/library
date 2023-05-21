import 'package:client/database/book/entities/book.dart';
import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/design_system/components/molecules/app_bar254_molecule.dart';
import 'package:client/design_system/components/templates/infinity_scroll_template254.dart';
import 'package:client/design_system/components/templates/tab_bar254_template.dart';
import 'package:client/pages/book_add_page/book_add_page.dart';
import 'package:client/pages/home/cubits/book_infinite_scroll_funtion.dart';
import 'package:client/pages/home/cubits/book_infinite_scroll_method.dart';
import 'package:client/pages/home/home_view_model.dart';
import 'package:client/pages/home/models/management_menu_model.dart';
import 'package:client/pages/home/widgets/book_list_tab_title_molecule.dart';
import 'package:client/pages/home/widgets/check_out_check_box_atom.dart';
import 'package:client/pages/home/widgets/error_notifier_molecule.dart';
import 'package:client/pages/home/widgets/manage_list_tile_template.dart';
import 'package:client/pages/home/widgets/search_bar_molecule.dart';
import 'package:client/styles/color_type.dart';
import 'package:client/styles/regular_modal_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:client/utility/common_methods/common_method.dart';
import 'package:client/widgets/atoms/text_field_atom.dart';
import 'package:client/widgets/organisms/regular_modal_organism.dart';
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

    vm.bookInfiniteScrollCubit.init(
      vm.homeControllerModel.pagingController,
      BookInfiniteScrollFunction(getData: _getBookListData(vm)),
    );
    BookInfiniteScrollMethod bookInfiniteScrollMethod =
        BookInfiniteScrollMethod(
      dataCubit: vm.bookInfiniteScrollCubit,
    );

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
        tabBody: [
          _BookListTemplate(bookInfiniteScrollMethod: bookInfiniteScrollMethod),
          _BookManageTemplate(vm: vm),
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

  _getBookListData(
    HomeViewModel vm,
  ) =>
      ({
        required int pageKey,
        required int pageSize,
        bool? isAbleToCheckOut,
        String? keyword,
      }) async {
        final result = await _getBookList(
          pageKey: pageKey,
          pageSize: pageSize,
          vm: vm,
        );
        List<dynamic> dataList = [];
        dataList = result;
        return dataList;
      };

  Future<List<Book>> _getBookList({
    required int pageKey,
    required int pageSize,
    required HomeViewModel vm,
  }) async {
    return await vm.bookApiRepository.getBooks(
      pageSize: pageSize,
      pageKey: pageKey,
      isAbleToCheckOut: vm.checkBorrowedCubit.state ? true : null,
      keyword: vm.homeControllerModel.searchTextEdittingController.text,
    );
  }
}
