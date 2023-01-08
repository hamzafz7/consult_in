class SearchModel {
  String? message;
  List<SearchExpertModel> users = [];
  SearchModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    if (message != "ما عنا حدا بهالاسم والله يا غالي") {
      json["data"].forEach((e) {
        users.add(SearchExpertModel.fromJson(e));
      });
    }
  }
}

class SearchExpertModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  int? wallet;
  int? role;
  String? address;
  String? photo;
  SearchExpertModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    wallet = json["wallet"];
    role = json["role"];
    address = json["address"];
    photo = json["photo"];
  }
}
