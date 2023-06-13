class Authentication {
  final String token;

  Authentication({required this.token});

  Authentication.fromJson(Map<String, dynamic> json)
      : this(token: json['token']);
}
