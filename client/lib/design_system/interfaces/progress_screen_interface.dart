import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ProgressScreenInterface extends Cubit<double> {
  ProgressScreenInterface(super.initialState);

  void tabBarChanged(double value);
}
