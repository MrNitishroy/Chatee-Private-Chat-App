
class StoryModel {
  String? useName;
  bool? isViewed;
  String? profileUrl;

  StoryModel({this.useName, this.isViewed, this.profileUrl});

  StoryModel.fromJson(Map<String, dynamic> json) {
    useName = json["useName"];
    isViewed = json["isViewed"];
    profileUrl = json["profileUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["useName"] = useName;
    _data["isViewed"] = isViewed;
    _data["profileUrl"] = profileUrl;
    return _data;
  }
}