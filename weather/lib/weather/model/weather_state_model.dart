class Weather {
  late int id;
  late String main;
  late String description;
  late String weatherIcon;
  Weather(this.id, this.main, this.description, this.weatherIcon);

  Weather.fromJson(
    Map<String, dynamic> json,
  ) {
    id = json["id"];
    main = description = json["description"];
    weatherIcon = json["icon"];
  }
}

