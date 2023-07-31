
import 'dart:convert';
class PackageDetails {
  final String status;
  final List<Details> details;

  PackageDetails({this.status, this.details});

  factory PackageDetails.fromJson(Map<String, dynamic> json) {
    var detailsList = json['details'] as List;
    List<Details> details =
        detailsList.map((i) => Details.fromJson(i)).toList();

    return PackageDetails(
      status: json['status'],
      details: details,
    );
  }
}

class Details {
  final int sno;
  final String operator;
  final String circle;
  final String amount;
  final String validity;
  final String descr;
  final String type;

  Details({
    this.sno,
    this.operator,
    this.circle,
    this.amount,
    this.validity,
    this.descr,
    this.type,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      sno: json['sno'],
      operator: json['operator'],
      circle: json['circle'],
      amount: json['amount'],
      validity: json['validity'],
      descr: json['descr'],
      type: json['type'],
    );
  }
}


// To parse this JSON data, do
//
//     final payRechargeModal = payRechargeModalFromJson(jsonString);


PayRechargeModal payRechargeModalFromJson(String str) => PayRechargeModal.fromJson(json.decode(str));

String payRechargeModalToJson(PayRechargeModal data) => json.encode(data.toJson());

class PayRechargeModal {
    PayRechargeModal({
         this.status,
         this.message,
    });

    String status;
    String message;

    factory PayRechargeModal.fromJson(Map<String, dynamic> json) => PayRechargeModal(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
