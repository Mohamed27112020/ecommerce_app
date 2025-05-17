class TokenModel {
  final String token;

  TokenModel({required this.token});

  // Convert JSON to Dart Object
  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      token: json['token'] as String,
    );
  }

  // Convert Dart Object to JSON
  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}