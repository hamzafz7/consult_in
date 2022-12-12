import 'package:bloc/bloc.dart';
import 'package:consult_in/logic/bloc/appstates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsultAppCubit extends Cubit<ConsultAppStates> {
  ConsultAppCubit() : super(InitialState());
  bool isfavourite = false;
  changefavourie() {
    isfavourite = !isfavourite;
    emit(ChangeFavouritState());
  }
}
