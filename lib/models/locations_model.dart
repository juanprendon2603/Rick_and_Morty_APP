class Locations {
  int id;
  String name;
  String type;
  String dimension;

  Locations({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
  });

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        id: json['id'],
        name: json['name'],
        type: json['type'],
        dimension: json['dimension'],
      );
}
