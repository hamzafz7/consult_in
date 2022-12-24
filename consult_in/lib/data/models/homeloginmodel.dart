class HomeLoginModel {
  String? message;
  String? access_token;
  HomeLoginUserDataModel? user;
  HomeLoginModel.fromJson(Map<String?, dynamic> json) {
    message = json["message"];
    access_token = json["token"] ?? null;
    user = json["user"] != null
        ? HomeLoginUserDataModel.fromJson(json["user"])
        : null;
  }
}

class HomeLoginUserDataModel {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? photo_path;
  int? wallet;
  int? role;
  HomeLoginUserDataModel.fromJson(Map<String?, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    photo_path = json["photo_path"];
    wallet = json["wallet"];
    role = json["role"];
  }
}
