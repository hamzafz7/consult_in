import 'package:bloc/bloc.dart';
import 'package:consult_in/data/diohelper/diohelper.dart';
import 'package:consult_in/data/models/homeloginmodel.dart';
import 'package:consult_in/logic/bloc/appstates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/endpoints.dart';

class ConsultAppCubit extends Cubit<ConsultAppStates> {
  ConsultAppCubit() : super(InitialState());
  bool isfavourite = false;
  changefavourie() {
    isfavourite = !isfavourite;
    emit(ChangeFavouritState());
  }

  HomeLoginModel? homeloginmodel;
  void userlogin({required String email, required String password}) async {
    emit(LoadingLoginState());
    await DioHelper.post(
        url: login,
        query: {"email": email, "password": password}).then((value) {
      print(value.data);
      //   homeloginmodel = HomeLoginModel.fromJson(value.data);
      // print(homeloginmodel!.access_token);

      emit(SuccessLoginState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ErrorLoginState(error.toString()));
    });
  }
}
