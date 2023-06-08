import 'package:client/database/book/dto/update_book_dto.dart';
import 'package:client/database/book/entities/book.dart';
import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/design_system/utility/primary_methods/primart_method.dart';
import 'package:client/pages/home/home_view_model.dart';
import 'package:client/pages/home/widgets/check_out_contents_column.dart';
import 'package:client/widgets/organisms/regular_modal_organism.dart';
import 'package:client/styles/color_type.dart';
import 'package:client/styles/regular_modal_type.dart';
import 'package:client/styles/typo_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookListRowMolecule extends StatelessWidget {
  final Book book;
  const BookListRowMolecule({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _checkOutModal(context);
      },
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(color: ColorType.gray300.color, width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getBookInformationCell(text: book.id.toString(), flex: 80),
            _getBookInformationCell(text: book.name, flex: 120),
            _getBookInformationCell(text: book.author, flex: 150),
            _getBookInformationCell(text: book.isAbleCheckOut! ? '가능' : '대출 중'),
            _getBookInformationCell(
              text: PrimaryMethod.check.isNull(book.borrower)
                  ? '-'
                  : book.borrower!,
            ),
          ],
        ),
      ),
    );
  }

  Expanded _getBookInformationCell({int? flex = 130, required String text}) {
    return Expanded(
      flex: 130,
      child: Text254Atom(
        PrimaryMethod.check.isNull(book.borrower) ? '-' : book.borrower!,
        style: TypoType.body1M.getTextStyle(),
        textAlign: TextAlign.center,
      ),
    );
  }

  static Widget buildWidget({
    required Book book,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: BookListRowMolecule(
        book: book,
      ),
    );
  }

  _checkOutModal(BuildContext context) {
    final vm = Provider.of<HomeViewModel>(context, listen: false);

    regularModalOrganism(
      context,
      titleText: book.isAbleCheckOut! ? '대출' : '반납',
      contentsWidget: CheckOutContentsColumn(book: book, vm: vm),
      regularModalType: RegularModalTypes.basic,
      buttonsData: {
        '취소': () {
          Navigator.pop(context);
        },
        book.isAbleCheckOut! ? '대출' : '반납': () async {
          try {
            await vm.bookApiRepository.updateBookBorrower(
              UpdateBookDTO(
                id: book.id,
                borrower: vm.homeControllerModel.borrowerController.text,
              ),
            );
            vm.homeControllerModel.borrowerController.clear();
            vm.homeControllerModel.pagingController.refresh();
          } catch (e) {
            Navigator.pop(context);
            _onErrorModal(context);
          }
          // ignore: use_build_context_synchronously
          Navigator.pop(context);
        }
      },
    );
  }

  _onErrorModal(BuildContext context) {
    return regularModalOrganism(
      context,
      titleText: '실패',
      titleColor: ColorType.systemRed.color,
      contentText: book.isAbleCheckOut! ? '대출' : '반납' '에 실패하였습니다 다시 시도해주세요.',
      regularModalType: RegularModalTypes.basic,
      buttonsData: {
        '다시시도': () {
          Navigator.pop(context);
        },
      },
    );
  }
}
