import 'package:flutter_bloc/flutter_bloc.dart';

class BoolCubitInterface extends Cubit<bool> {
  BoolCubitInterface(super.initialState);

  void changeState() {
    emit(!state);
  }
}
