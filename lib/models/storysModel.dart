class StorysModel {
  String? name;
  String? email;
  String? image;
  String? description;
  String? time;
  String? profileUrl;

  StorysModel({this.name, this.email, this.image,this.profileUrl, this.description, this.time});

  StorysModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    image = json["image"];
    description = json["description"];
    time = json["time"];
    profileUrl = json["profileUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["email"] = email;
    _data["image"] = image;
    _data["description"] = description;
    _data["time"] = time;
    _data["profileUrl"] = profileUrl;
    return _data;
  }
}
