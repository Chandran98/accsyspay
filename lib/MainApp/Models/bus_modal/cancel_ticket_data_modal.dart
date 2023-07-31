// To parse this JSON data, do
//
//     final cancelTicketDataModal = cancelTicketDataModalFromJson(jsonString);

import 'dart:convert';

CancelTicketDataModal cancelTicketDataModalFromJson(String str) => CancelTicketDataModal.fromJson(json.decode(str));

String cancelTicketDataModalToJson(CancelTicketDataModal data) => json.encode(data.toJson());

class CancelTicketDataModal {
    String status;
    Message message;

    CancelTicketDataModal({
         this.status,
         this.message,
    });

    factory CancelTicketDataModal.fromJson(Map<String, dynamic> json) => CancelTicketDataModal(
        status: json["status"],
        message: Message.fromJson(json["message"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message.toJson(),
    };
}

class Message {
    String cancellable;
    CancellationCharges cancellationCharges;
    CancellationCharges fares;
    String freeCancellationTime;
    String partiallyCancellable;
    String serviceCharge;
    String serviceTaxOnCancellationCharge;
    String totalCancellationCharge;
    String totalRefundAmount;

    Message({
         this.cancellable,
         this.cancellationCharges,
         this.fares,
         this.freeCancellationTime,
         this.partiallyCancellable,
         this.serviceCharge,
         this.serviceTaxOnCancellationCharge,
         this.totalCancellationCharge,
         this.totalRefundAmount,
    });

    factory Message.fromJson(Map<String, dynamic> json) => Message(
        cancellable: json["cancellable"],
        cancellationCharges: CancellationCharges.fromJson(json["cancellationCharges"]),
        fares: CancellationCharges.fromJson(json["fares"]),
        freeCancellationTime: json["freeCancellationTime"],
        partiallyCancellable: json["partiallyCancellable"],
        serviceCharge: json["serviceCharge"],
        serviceTaxOnCancellationCharge: json["serviceTaxOnCancellationCharge"],
        totalCancellationCharge: json["totalCancellationCharge"],
        totalRefundAmount: json["totalRefundAmount"],
    );

    Map<String, dynamic> toJson() => {
        "cancellable": cancellable,
        "cancellationCharges": cancellationCharges.toJson(),
        "fares": fares.toJson(),
        "freeCancellationTime": freeCancellationTime,
        "partiallyCancellable": partiallyCancellable,
        "serviceCharge": serviceCharge,
        "serviceTaxOnCancellationCharge": serviceTaxOnCancellationCharge,
        "totalCancellationCharge": totalCancellationCharge,
        "totalRefundAmount": totalRefundAmount,
    };
}

class CancellationCharges {
    Entry entry;

    CancellationCharges({
         this.entry,
    });

    factory CancellationCharges.fromJson(Map<String, dynamic> json) => CancellationCharges(
        entry: Entry.fromJson(json["entry"]),
    );

    Map<String, dynamic> toJson() => {
        "entry": entry.toJson(),
    };
}

class Entry {
    String key;
    String value;

    Entry({
         this.key,
         this.value,
    });

    factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        key: json["key"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
    };
}
