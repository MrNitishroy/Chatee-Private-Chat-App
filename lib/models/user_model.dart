class UserModel {
  String? name;
  String? createdAt;
  bool? isOnline;
  bool? isTyping;
  String? email;
  String? bio;
  String? profileUrl;
  String? token;
  String? lastSeen;
  String? lastMessage;

  UserModel(
      {this.name,
      this.lastMessage,
      this.createdAt,
      this.isOnline,
      this.isTyping,
      this.email,
      this.bio,
      this.profileUrl,
      this.token,
      this.lastSeen});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    createdAt = json["createdAt"];
    isOnline = json["isOnline"];
    isTyping = json["isTyping"];
    email = json["email"];
    bio = json["bio"];
    profileUrl = json["profileUrl"];
    token = json["token"];
    lastSeen = json["lastSeen"];
    lastSeen = json["lastMessage"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["createdAt"] = createdAt;
    _data["isOnline"] = isOnline;
    _data["isTyping"] = isTyping;
    _data["email"] = email;
    _data["bio"] = bio;
    _data["profileUrl"] = profileUrl;
    _data["token"] = token;
    _data["lastSeen"] = lastSeen;
    _data["lastMessage"] = lastMessage;
    return _data;
  }
}
