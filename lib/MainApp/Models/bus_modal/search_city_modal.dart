// To parse this JSON data, do
//
//     final searchCityModal = searchCityModalFromJson(jsonString);

import 'dart:convert';


class City {
  final int id;
  final String cityName;
  final List<String> aliasNames;

  City({
    this.id,
    this.cityName,
    this.aliasNames,
  });
}