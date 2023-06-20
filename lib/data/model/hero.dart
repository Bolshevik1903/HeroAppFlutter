class Hero {
  final String id;
  final String name;
  final String poster;
  final String fullName;

  const Hero(
      {required this.id,
      required this.name,
      required this.fullName,
      required this.poster});

  Hero.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          poster: json['image']['url'],
          fullName: json['biography']['full-name'],
        );

  Hero.fromMap(Map<String, dynamic> map)
      : this(
          id: map['id'],
          name: map['name'],
          poster: map['poster_url'],
          fullName: map['full_name'],
        );

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'poster': poster, 'full_name': fullName};
  }
}
