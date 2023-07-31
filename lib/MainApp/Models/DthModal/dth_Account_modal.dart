// // To parse this JSON data, do
// //
// //     final dthAccountModal = dthAccountModalFromJson(jsonString);

// import 'dart:convert';

// DthAccountModal dthAccountModalFromJson(String str) => DthAccountModal.fromJson(json.decode(str));

// String dthAccountModalToJson(DthAccountModal data) => json.encode(data.toJson());

// class DthAccountModal {
//     String accountNo;
//     int status;
//     String customerName;
//     String currentPlan;
//     double balance;
//     int monthlyRecharge;
//     DateTime nextRecharge;
//     String accountStatus;
//     String dthAccountModalOperator;

//     DthAccountModal({
//          this.accountNo,
//          this.status,
//          this.customerName,
//          this.currentPlan,
//          this.balance,
//          this.monthlyRecharge,
//          this.nextRecharge,
//          this.accountStatus,
//          this.dthAccountModalOperator,
//     });

//     factory DthAccountModal.fromJson(Map<String, dynamic> json) => DthAccountModal(
//         accountNo: json["accountNo"],
//         status: json["status"],
//         customerName: json["customerName"],
//         currentPlan: json["CurrentPlan"],
//         balance: json["Balance"]?.toDouble(),
//         monthlyRecharge: json["MonthlyRecharge"],
//         nextRecharge: DateTime.parse(json["NextRecharge"]),
//         accountStatus: json["accountStatus"],
//         dthAccountModalOperator: json["operator"],
//     );

//     Map<String, dynamic> toJson() => {
//         "accountNo": accountNo,
//         "status": status,
//         "customerName": customerName,
//         "CurrentPlan": currentPlan,
//         "Balance": balance,
//         "MonthlyRecharge": monthlyRecharge,
//         "NextRecharge": "${nextRecharge.year.toString().padLeft(4, '0')}-${nextRecharge.month.toString().padLeft(2, '0')}-${nextRecharge.day.toString().padLeft(2, '0')}",
//         "accountStatus": accountStatus,
//         "operator": dthAccountModalOperator,
//     };
// }

class DthAccountModal {
  String status;
  Details details;

  DthAccountModal({this.status, this.details});

  DthAccountModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    details = Details.fromJson(json['details']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['details'] = this.details.toJson();
    return data;
  }
}

class Details {
  String customerName;
  String currentPlan;
  String balance;
  String monthlyRecharge;
  String nextRechargeOn;
  String accountStatus;

  Details({
    this.customerName,
    this.currentPlan,
    this.balance,
    this.monthlyRecharge,
    this.nextRechargeOn,
    this.accountStatus,
  });

  Details.fromJson(Map<String, dynamic> json) {
    customerName = json['CustomerName'];
    currentPlan = json['CurrentPlan'];
    balance = json['Balance'];
    monthlyRecharge = json['MonthlyRecharge'];
    nextRechargeOn = json['NextRechargeOn'];
    accountStatus = json['accountstatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CustomerName'] = this.customerName;
    data['CurrentPlan'] = this.currentPlan;
    data['Balance'] = this.balance;
    data['MonthlyRecharge'] = this.monthlyRecharge;
    data['NextRechargeOn'] = this.nextRechargeOn;
    data['accountstatus'] = this.accountStatus;
    return data;
  }
}
