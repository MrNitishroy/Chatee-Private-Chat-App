
class ChatModel {
  String? name;
  String? email;
  String? message;
  String? profileUrl;
  bool? isViewed;
  String? lastMessage;
  String? time;
  bool? isOnline;
  bool? isDelivered;
  bool? isSeen;
  bool? isTyping;
  int? notificationCount;

  ChatModel({this.name,this.message, this.email, this.profileUrl, this.isViewed, this.lastMessage, this.time, this.isOnline, this.isDelivered, this.isSeen, this.isTyping, this.notificationCount});

  ChatModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    profileUrl = json["profileUrl"];
    isViewed = json["isViewed"];
    lastMessage = json["lastMessage"];
    message = json["message"];
    time = json["time"];
    isOnline = json["isOnline"];
    isDelivered = json["isDelivered"];
    isSeen = json["isSeen"];
    isTyping = json["isTyping"];
    notificationCount = json["notificationCount"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["email"] = email;
    _data["profileUrl"] = profileUrl;
    _data["isViewed"] = isViewed;
    _data["lastMessage"] = lastMessage;
    _data["message"] = message;
    _data["time"] = time;
    _data["isOnline"] = isOnline;
    _data["isDelivered"] = isDelivered;
    _data["isSeen"] = isSeen;
    _data["isTyping"] = isTyping;
    _data["notificationCount"] = notificationCount;
    return _data;
  }
}