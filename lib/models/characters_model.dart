class Character {
  int id;
  String name;
  String status;
  String gender;
  String origin;
  String location;
  String image;
  String species;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.species,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        gender: json['gender'],
        image: json['image'],
        species: json['species'],
        origin: json['origin']['name'],
        location: json['location']['name'],
      );
}
