// To parse this JSON data, do
//
//     final cancellationTicketModal = cancellationTicketModalFromJson(jsonString);

import 'dart:convert';

CancellationTicketModal cancellationTicketModalFromJson(String str) => CancellationTicketModal.fromJson(json.decode(str));

String cancellationTicketModalToJson(CancellationTicketModal data) => json.encode(data.toJson());

class CancellationTicketModal {
    String status;
    String message;
    String cancellationcharge;
    String refundAmount;
    String tin;

    CancellationTicketModal({
        this.status,
        this.message,
        this.cancellationcharge,
        this.refundAmount,
        this.tin,
    });

    factory CancellationTicketModal.fromJson(Map<String, dynamic> json) => CancellationTicketModal(
        status: json["status"],
        message: json["message"],
        cancellationcharge: json["cancellationcharge"],
        refundAmount: json["refundAmount"],
        tin: json["tin"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "cancellationcharge": cancellationcharge,
        "refundAmount": refundAmount,
        "tin": tin,
    };
}
