// To parse this JSON data, do

    // final walletHistoryModel = walletHistoryModelFromJson(jsonString);

import 'dart:convert';

List<WalletHistoryModel> walletHistoryModelFromJson(String str) =>
    List<WalletHistoryModel>.from(
        json.decode(str).map((x) => WalletHistoryModel.fromJson(x)));

String walletHistoryModelToJson(List<WalletHistoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WalletHistoryModel {
  WalletHistoryModel({
    this.description,
    this.amount,
    this.mode,
    this.openBal,
    this.closeBal,
    this.createdAt,
  });

  String description;
  num amount;
  int mode;
  num openBal;
  num closeBal;
  String createdAt;

  factory WalletHistoryModel.fromJson(Map<String, dynamic> json) =>
      WalletHistoryModel(
        description: json["description"],
        amount: json["amount"],
        mode: json["mode"],
        openBal: json["open_bal"],
        closeBal: json["close_bal"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "amount": amount,
        "mode": mode,
        "open_bal": openBal,
        "close_bal": closeBal,
        "created_at": createdAt,
      };
}


