// To parse this JSON data, do
//
//     final busCities = busCitiesFromJson(jsonString);

import 'dart:convert';

BusCities busCitiesFromJson(String str) => BusCities.fromJson(json.decode(str));

String busCitiesToJson(BusCities data) => json.encode(data.toJson());

class BusCities {
    List<City> cities;

    BusCities({
         this.cities,
    });

    factory BusCities.fromJson(Map<String, dynamic> json) => BusCities(
        cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
    };
}

class City {
    String id;
    String name;

    City({
         this.id,
         this.name,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
