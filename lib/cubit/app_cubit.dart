import 'package:bloc/bloc.dart';
import 'package:travel_app/model/data_model.dart';
import 'package:travel_app/services/data_services.dart';
import 'app_cubit_state.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.dataServices}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices dataServices;
  late final places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await dataServices.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(DataModel model){
    emit(DetailState(model));
  }
}
