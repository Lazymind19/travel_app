import 'package:bloc/bloc.dart';
import 'app_cubit_state.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits() : super(InitialState()) {
    emit(WelcomeState());
  }

}