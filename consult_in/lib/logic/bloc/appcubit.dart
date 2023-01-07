import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:consult_in/data/diohelper/diohelper.dart';
import 'package:consult_in/data/models/expertmodel.dart';
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
      homeloginmodel = HomeLoginModel.fromJson(jsonDecode((value.data)));
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
    emit(GetExpertsLoadingState());
    return await DioHelper.get(url: experts, query: {"experience_id": id})
        .then((value) {
      var coded = value.data;
      //  print(value.data);
      //   List<Map<String, dynamic>> coded = jsonDecode(value.data.toString());
      // print(coded);
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
}
