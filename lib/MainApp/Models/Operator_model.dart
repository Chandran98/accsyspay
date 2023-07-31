// To parse this JSON data, do
//
//     final operator = operatorFromJson(jsonString);

import 'dart:convert';

Operator operatorFromJson(String str) => Operator.fromJson(json.decode(str));

String operatorToJson(Operator data) => json.encode(data.toJson());

class Operator {
  Operator({
    this.status,
    this.message,
    this.mobile,
    this.operatorOperator,
    this.operatorId,
    this.circle,
    this.circleId,
  });

  String status;
  String message;
  String mobile;
  String operatorOperator;
  String operatorId;
  String circle;
  String circleId;

  factory Operator.fromJson(Map<String, dynamic> json) => Operator(
        status: json["status"],
        message: json["message"],
        mobile: json["mobile"],
        operatorOperator: json["Operator"],
        operatorId: json["OperatorId"],
        circle: json["Circle"],
        circleId: json["CircleId"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "mobile": mobile,
        "Operator": operatorOperator,
        "OperatorId": operatorId,
        "Circle": circle,
        "CircleId": circleId,
      };
}

// To parse this JSON data, do
//
//     final node = nodeFromJson(jsonString);

List<Node> nodeFromJson(String str) =>
    List<Node>.from(json.decode(str).map((x) => Node.fromJson(x)));

String nodeToJson(List<Node> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Node {
  Node({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

