class StorysModel {
  String? name;
  String? email;
  String? image;
  String? description;
  String? time;

  StorysModel({this.name, this.email, this.image, this.description, this.time});

  StorysModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    image = json["image"];
    description = json["description"];
    time = json["time"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["email"] = email;
    _data["image"] = image;
    _data["description"] = description;
    _data["time"] = time;
    return _data;
  }
}
