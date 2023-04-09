import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NumberStateCubitInterface<T extends num> extends Cubit<T> {
  NumberStateCubitInterface(super.initialState);

  void changeState(T newValue) {
    emit(newValue);
  }
}
