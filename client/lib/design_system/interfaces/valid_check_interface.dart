import 'package:flutter_bloc/flutter_bloc.dart';

class ValidCheckInterface extends Cubit<bool> {
  ValidCheckInterface(super.initialState);

  void validState() {
    emit(true);
  }

  void invalidState() {
    emit(false);
  }

  void changeState(bool state) {
    emit(state);
  }
}
