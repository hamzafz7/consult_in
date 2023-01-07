class ExpertModel {
  int? userid;
  String? name;
  int? experience_exp_id;
  var description;
  var cost;
  String? address;
  String? photo;
  String? email;
  String? phone;
  ExpertModel.fromJson(Map<String?, dynamic> json) {
    userid = json["user_id"];
    name = json["name"];
    experience_exp_id = json["experience_expert_id"];
    description = json["description"];
    cost = json["cost"];
    address = json["address"];
    photo = json["photo"];
    email = json["email"];
    phone = json["phone"];
  }
}
