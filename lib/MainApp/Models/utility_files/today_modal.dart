// class TodayModal {
//   final String status;
//   final Details details;

//   TodayModal({
//      this.status,
//      this.details,
//   });

//   factory TodayModal.fromJson(Map<String, String> json) {
//     return TodayModal(
//       status: json['status'],
//       details: Details.fromJson(json['details']),
//     );
//   }
// }

import 'dart:convert';

class ModalDetails {
  final String responseCode;
  final String responseMessage;
  final String transactionId;
  final String customerName;
  final String billNumber;
  final String billPeriod;
  final String billDate;
  final String billDueDate;
  final String billAmount;
  // final List<CustomerParamsDetails> customerParamsDetails;
  // final List<dynamic> billDetails;
  // final List<dynamic> additionalDetails;

  ModalDetails({
     this.responseCode,
     this.responseMessage,
     this.transactionId,
     this.customerName,
     this.billNumber,
     this.billPeriod,
     this.billDate,
     this.billDueDate,
     this.billAmount,
    //  this.customerParamsDetails,
    //  this.billDetails,
    //  this.additionalDetails,
  });

  factory ModalDetails.fromJson(Map<String, String> json) {
    return ModalDetails(
      responseCode: json['ResponseCode'],
      responseMessage: json['ResponseMessage'],
      transactionId: json['TransactionId'],
      customerName: json['CustomerName'],
      billNumber: json['BillNumber'],
      billPeriod: json['BillPeriod'],
      billDate: json['BillDate'],
      billDueDate: json['BillDueDate'],
      billAmount: json['BillAmount'],
      // customerParamsDetails: List<CustomerParamsDetails>.from(
      //   json['CustomerParamsDetails']
      //       .map((x) => CustomerParamsDetails.fromJson(x)),
      // ),
      // billDetails: json['BillDetails'],
      // additionalDetails: json['AdditionalDetails'],
    );
  }
}

// class CustomerParamsDetails {
//   final String name;
//   final String value;

//   CustomerParamsDetails({
//    this.name,
//    this.value,
//   });

//   factory CustomerParamsDetails.fromJson(Map<String, dynamic> json) {
//     return CustomerParamsDetails(
//       name: json['Name'],
//       value: json['Value'],
//     );
//   }
// }


// To parse this JSON data, do
//
//     final charges = chargesFromJson(jsonString);


Charges chargesFromJson(String str) => Charges.fromJson(json.decode(str));

String chargesToJson(Charges data) => json.encode(data.toJson());

class Charges {
    String status;
    int charges;

    Charges({
         this.status,
         this.charges,
    });

    factory Charges.fromJson(Map<String, dynamic> json) => Charges(
        status: json["status"],
        charges: json["charges"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "charges": charges,
    };
}
