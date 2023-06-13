class User {
  final int id;
  final String firstname;
  final String lastname;
  final String username;
  final String password;
  final String phone;
  final String role;
  final String description;
  final String imageUrl;
  final String birthDate;

  User(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.username,
      required this.password,
      required this.phone,
      required this.role,
      required this.description,
      required this.imageUrl,
      required this.birthDate});

  User.short({required String username, required String password})
      : this(
          id: 0,
          firstname: '-',
          lastname: '-',
          username: username,
          password: password,
          phone: '-',
          role: '-',
          description: '-',
          imageUrl: '-',
          birthDate: '-',
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstname": firstname,
      "lastname": lastname,
      "username": username,
      "password": password,
      "phone": phone,
      "role": role,
      "description": description,
      "imageUrl": imageUrl,
      "birthDate": birthDate,
    };
  }

  User.fromJson(Map<String, dynamic> json)
      : this.short(username: json['username'], password: json['password']);
}
