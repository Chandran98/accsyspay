// To parse this JSON data, do
//
//     final mobileModal = mobileModalFromJson(jsonString);

import 'dart:convert';

List<MobileModal> mobileModalFromJson(String str) => List<MobileModal>.from(json.decode(str).map((x) => MobileModal.fromJson(x)));

String mobileModalToJson(List<MobileModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MobileModal {
    MobileModal({
         this.id,
         this.name,
    });

    int id;
    String name;

    factory MobileModal.fromJson(Map<String, dynamic> json) => MobileModal(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
