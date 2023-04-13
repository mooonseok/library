import 'package:client/design_system/components/atoms/text254_atom.dart';
import 'package:client/pages/home/home_view_model.dart';
import 'package:client/styles/typo_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutCheckBoxAtom extends StatelessWidget {
  final HomeViewModel vm;
  const CheckOutCheckBoxAtom({
    super.key,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder(
          bloc: vm.checkBorrowedCubit,
          builder: (context, bool checkState) {
            return Checkbox(
              value: checkState,
              onChanged: (value) {
                vm.checkBorrowedCubit.changeState();
                vm.homeControllerModel.pagingController.refresh();
              },
            );
          },
        ),
        Text254Atom('대출중인 도서 보기', style: TypoType.body1B.getTextStyle()),
      ],
    );
  }
}
