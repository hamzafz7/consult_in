import 'dart:convert';
import 'dart:io';

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
  Future<void> userlogin(
      {required String email, required String password}) async {
    emit(LoadingLoginState());
    await DioHelper.post(
        url: login,
        query: {"email": email, "password": password}).then((value) {
      homeloginmodel = HomeLoginModel.fromJson(value.data);
      // print(value.data);
      print(homeloginmodel!.message);
      emit(SuccessLoginState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ErrorLoginState(error.toString()));
    });
  }

  void userRegister(
      {required String email,
      required String password,
      required name,
      required phone}) async {
    emit(LoadingUserRegisterState());
    await DioHelper.post(url: userregister, query: {
      "email": email,
      "password": password,
      "name": name,
      "role": 0,
      "password_confirmation": password,
      "phone": phone
    }).then((value) {
      print(value.data);
      //   homeloginmodel = HomeLoginModel.fromJson(value.data);
      // print(homeloginmodel!.access_token);

      emit(SuccessUserRegisterState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ErrorUserRegisterState(error.toString()));
    });
  }

  void useregister(
      {required String email,
      required String password,
      required name,
      required phone,
      File? image,
      required address}) async {
    emit(LoadingUserRegisterState());
    await DioHelper.post(url: userregister, query: {
      "photo_path": image,
      "email": email,
      "password": password,
      "name": name,
      "role": 1,
      "password_confirmation": password,
      "phone": phone
    }).then((value) {
      print(value.data);
      //   homeloginmodel = HomeLoginModel.fromJson(value.data);
      // print(homeloginmodel!.access_token);

      emit(SuccessUserRegisterState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ErrorUserRegisterState(error.toString()));
    });
  }
}
