// To parse this JSON data, do
//
//     final dthOperatorModel = dthOperatorModelFromJson(jsonString);

import 'dart:convert';

List<DthOperatorModel> dthOperatorModelFromJson(String str) => List<DthOperatorModel>.from(json.decode(str).map((x) => DthOperatorModel.fromJson(x)));

String dthOperatorModelToJson(List<DthOperatorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DthOperatorModel {
    int id;
    String name;

    DthOperatorModel({
        this.id,
        this.name,
    });

    factory DthOperatorModel.fromJson(Map<String, dynamic> json) => DthOperatorModel(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
