class AuthModel {
  String? userName;
  String? fullName;
  String? token;
  String? userId;

  AuthModel({
    this.userName,
    this.fullName,
    this.token,
    this.userId,
  });

  AuthModel copyWith({
    String? userName,
    String? fullName,
    String? token,
    String? userId,
  }) =>
      AuthModel(
        userName: userName ?? this.userName,
        fullName: fullName ?? this.fullName,
        token: token ?? this.token,
        userId: userId ?? this.userId,
      );

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    userName: json["user_name"],
    fullName: json["full_name"],
    token: json["token"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "user_name": userName,
    "full_name": fullName,
    "token": token,
    "user_id": userId,
  };
}