class HomeLoginModel {
  String? message;
  String? access_token;
  HomeLoginUserDataModel? user;
  HomeLoginModel.fromJson(Map<String?, dynamic> json) {
    message = json["message"];
    access_token = json["access_token"] ?? null;
    user = json["user"] != null
        ? HomeLoginUserDataModel.fromJson(json["user"])
        : null;
  }
}

class HomeLoginUserDataModel {
  int? id;
  String? name;
  String? email;
  String? photo_path;
  double? wallet;
  int? role;
  HomeLoginUserDataModel.fromJson(Map<String?, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    photo_path = json["photo_path"];
    wallet = json["wallet"];
    role = json["role"];
  }
}
