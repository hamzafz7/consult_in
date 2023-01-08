import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:consult_in/data/diohelper/diohelper.dart';
import 'package:consult_in/data/models/expertmodel.dart';
import 'package:consult_in/data/models/homeloginmodel.dart';
import 'package:consult_in/data/models/searchexpertmodel.dart';
import 'package:consult_in/logic/bloc/appstates.dart';
import 'package:flutter/cupertino.dart';
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
      homeloginmodel = HomeLoginModel.fromJson((value.data));
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
      homeloginmodel = HomeLoginModel.fromJson(value.data);
      print(value.data);

      emit(SuccessUserRegisterState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ErrorUserRegisterState(error.toString()));
    });
  }

  void expertregister(
      {required String email,
      required String password,
      required name,
      required phone,
      required data,
      required address,
      required experience,
      required id,
      required cost}) async {
    List uncoded = [
      {"experience_id": id, "description": experience, "cost": cost}
    ];
    var coded = jsonEncode(uncoded);

    emit(LoadingExpertRegisterState());
    await DioHelper.post(
        url: userregister,
        query: {
          "email": email,
          "password": password,
          "name": name,
          "role": 1,
          "password_confirmation": password,
          "phone": phone,
          "address": address,
          "experience_expert": coded
        },
        body: data,
        header: {"Content-Type": "multipart/form-data"}).then((value) {
      print(value.data);
      homeloginmodel = HomeLoginModel.fromJson(value.data);
      emit(SuccessExpertRegisterState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(ErrorExpertRegisterState(error.toString()));
    });
  }

  List<ExpertModel> exp_experts = [];
  getexperts(int id) async {
    exp_experts = [];
    emit(GetExpertsLoadingState());
    return await DioHelper.get(url: experts, query: {"experience_id": id})
        .then((value) {
      var coded = value.data;
      if (value.data == "") {}
      coded.forEach((e) {
        exp_experts.add(ExpertModel.fromJson(e));
      });
      print(exp_experts[0].address);
      emit(GetExpertsSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(GetExpertsErrorState());
    });
  }

  SearchModel? searchModel;
  searchexpert(String name) async {
    emit(SearchExpertsLoadingState());
    await DioHelper.get(url: search, query: {"name": name}).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchExpertsSuccessState());
    }).onError((error, stackTrace) {
      print(error.toString());
      emit(SearchExpertsErrorState());
    });
  }

  logout({required String token}) async {
    emit(LoadingLogoutState());
    return await DioHelper.post(url: Logout, header: {
      "Accept": 'application/json',
      "Authentication": "Bearer $token"
    }).then((value) {
      emit(SuccessLogoutState());
    }).onError((error, stackTrace) {
      emit(ErrorLogoutState(error));
    });
  }
}
