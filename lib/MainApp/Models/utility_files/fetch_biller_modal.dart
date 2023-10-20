// class FetchBillerModal {
//   String status;
//   List<FetchBillerDetails> details;

//   FetchBillerModal({this.status, this.details});

//   factory FetchBillerModal.fromJson(Map<String, dynamic> json) {
//     var list = json['details'] as List;
//     List<FetchBillerDetails> detailsList =
//         list.map((i) => FetchBillerDetails.fromJson(i)).toList();

//     return FetchBillerModal(
//       status: json['status'] as String,
//       details: detailsList,
//     );
//   }
// }

// class FetchBillerDetails {
//   int id;
//   int billerCategory;
//   String billerCategoryDesc;
//   String billerMode;
//   String billerId;
//   String billerName;
//   bool acceptAdHocPayment;
//   String paymentAmtExactness;

//   FetchBillerDetails(
//       {this.id,
//       this.billerCategory,
//       this.billerCategoryDesc,
//       this.billerMode,
//       this.billerId,
//       this.billerName,
//       this.acceptAdHocPayment,
//       this.paymentAmtExactness});

//   factory FetchBillerDetails.fromJson(Map<String, dynamic> json) {
//     return FetchBillerDetails(
//       id: json['Id'] as int,
//       billerCategory: json['BillerCategory'] as int,
//       billerCategoryDesc: json['BillerCategoryDesc'] as String,
//       billerMode: json['BillerMode'] as String,
//       billerId: json['BillerId'] as String,
//       billerName: json['BillerName'] as String,
//       acceptAdHocPayment: json['AcceptAdHocPayment'] as bool,
//       paymentAmtExactness: json['PaymentAmtExactness'] as String,
//     );
//   }
// }


// class Biller {
//   final int id;
//   final int billerCategory;
//   final String billerCategoryDesc;
//   final String billerMode;
//   final String billerId;
//   final String billerName;
//   final bool acceptAdHocPayment;
//   final String paymentAmtExactness;

//   Biller({
//     this.id,
//     this.billerCategory,
//     this.billerCategoryDesc,
//     this.billerMode,
//     this.billerId,
//     this.billerName,
//     this.acceptAdHocPayment,
//     this.paymentAmtExactness,
//   });

//   factory Biller.fromJson(Map<String, dynamic> json) {
//     return Biller(
//       id: json['Id'],
//       billerCategory: json['BillerCategory'],
//       billerCategoryDesc: json['BillerCategoryDesc'],
//       billerMode: json['BillerMode'],
//       billerId: json['BillerId'],
//       billerName: json['BillerName'],
//       acceptAdHocPayment: json['AcceptAdHocPayment'],
//       paymentAmtExactness: json['PaymentAmtExactness'],
//     );
//   }
// }



// To parse this JSON data, do
//
//     final utilityBillModal = utilityBillModalFromJson(jsonString);

import 'dart:convert';

UtilityBillModal utilityBillModalFromJson(String str) => UtilityBillModal.fromJson(json.decode(str));

String utilityBillModalToJson(UtilityBillModal data) => json.encode(data.toJson());

class UtilityBillModal {
    String status;
    List<DetailModal> details;

    UtilityBillModal({
         this.status,
         this.details,
    });

    factory UtilityBillModal.fromJson(Map<String, dynamic> json) => UtilityBillModal(
        status: json["status"],
        details: List<DetailModal>.from(json["details"].map((x) => DetailModal.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
    };
}

class DetailModal {
    String code;
    String service;
    String param;
    String optional1;
    String optional2;
    String optional3;
    String amountRange;
    String min;
    String max;
    String type;
    String billFetch;
    String bbps;
    String isText;
    String bbpsStatus;

    DetailModal({
        this.code,
        this.service,
        this.param,
        this.optional1,
        this.optional2,
        this.optional3,
        this.amountRange,
        this.min,
        this.max,
        this.type,
        this.billFetch,
        this.bbps,
        this.isText,
        this.bbpsStatus,
    });

    factory DetailModal.fromJson(Map<String, dynamic> json) => DetailModal(
        code: json["code"],
        service: json["service"],
        param: json["param"],
        optional1: json["optional1"],
        optional2: json["optional2"],
        optional3: json["optional3"],
        amountRange: json["amount_range"],
        min: json["min"],
        max: json["max"],
        type: json["type"],
        billFetch: json["bill_fetch"],
        bbps: json["bbps"],
        isText: json["isText"],
        bbpsStatus: json["bbpsStatus"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "service": service,
        "param": param,
        "optional1": optional1,
        "optional2": optional2,
        "optional3": optional3,
        "amount_range": amountRange,
        "min": min,
        "max": max,
        "type": type,
        "bill_fetch": billFetch,
        "bbps": bbps,
        "isText": isText,
        "bbpsStatus": bbpsStatus,
    };
}
