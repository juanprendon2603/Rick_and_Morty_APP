class Character {
  int id;
  String name;
  String status;
  String gender;
  String origin;
  String location;
  String image;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        gender: json['gender'],
        image: json['image'],
        origin: json['origin']['name'],
        location: json['location']['name'],
      );
}
