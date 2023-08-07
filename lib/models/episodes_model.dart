class Episodes {
  int id;
  String name;
  String airDate;
  String episode;

  Episodes({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
  });

  factory Episodes.fromJson(Map<String, dynamic> json) => Episodes(
        id: json['id'],
        name: json['name'],
        airDate: json['air_date'],
        episode: json['episode'],
      );
}
