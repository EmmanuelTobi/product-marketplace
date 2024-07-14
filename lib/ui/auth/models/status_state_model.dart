class StatusState {
  int? code;
  String? message;
  bool? isLoading;
  bool? hasData;

  StatusState({
    this.code,
    this.message,
    this.isLoading,
    this.hasData,
  });

  StatusState copyWith({
    int? code,
    String? message,
    bool? isLoading,
    bool? hasData,
  }) =>
      StatusState(
        code: code ?? this.code,
        message: message ?? this.message,
        isLoading: isLoading ?? this.isLoading,
        hasData: hasData ?? this.hasData,
      );

  factory StatusState.fromJson(Map<String, dynamic> json) => StatusState(
    code: json["code"],
    message: json["message"],
    isLoading: json["is_loading"],
    hasData: json["has_data"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "is_loading": isLoading,
    "has_data": hasData,
  };
}