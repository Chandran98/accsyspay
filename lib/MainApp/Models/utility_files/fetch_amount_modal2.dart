// To parse this JSON data, do
//
//     final fetchAmountModal = fetchAmountModalFromJson(jsonString);

import 'dart:convert';

FetchAmountModal fetchAmountModalFromJson(String str) => FetchAmountModal.fromJson(json.decode(str));

String fetchAmountModalToJson(FetchAmountModal data) => json.encode(data.toJson());

class FetchAmountModal {
    String status;
    DetailsBiller details;

    FetchAmountModal({
         this.status,
         this.details,
    });

    factory FetchAmountModal.fromJson(Map<String, dynamic> json) => FetchAmountModal(
        status: json["status"],
        details: DetailsBiller.fromJson(json["details"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "details": details.toJson(),
    };
}

class DetailsBiller {
    String status;
    String biller;
    String type;
    String name;
    String billAmount;
    // List<Fetchdatum> fetchdata;
    String timestamp;
    String referenceId;
    // YourRequest yourRequest;

    DetailsBiller({
         this.status,
         this.biller,
         this.type,
         this.name,
         this.billAmount,
        //  this.fetchdata,
         this.timestamp,
         this.referenceId,
        //  this.yourRequest,
    });

    factory DetailsBiller.fromJson(Map<String, dynamic> json) => DetailsBiller(
        status: json["status"],
        biller: json["biller"],
        type: json["type"],
        name: json["name"],
        billAmount: json["billAmount"],
        // fetchdata: List<Fetchdatum>.from(json["fetchdata"].map((x) => Fetchdatum.fromJson(x))),
        timestamp: json["timestamp"],
        referenceId: json["reference_id"],
        // yourRequest: YourRequest.fromJson(json["your_request"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "biller": biller,
        "type": type,
        "name": name,
        "billAmount": billAmount,
        // "fetchdata": List<dynamic>.from(fetchdata.map((x) => x.toJson())),
        "timestamp": timestamp,
        "reference_id": referenceId,
        // "your_request": yourRequest.toJson(),
    };
}

class Fetchdatum {
    String label;
    String value;

    Fetchdatum({
         this.label,
         this.value,
    });

    factory Fetchdatum.fromJson(Map<String, dynamic> json) => Fetchdatum(
        label: json["label"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
    };
}

class YourRequest {
    String code;
    String account;
    String agentId;
    String optional1;
    String optional2;
    String optional3;

    YourRequest({
         this.code,
         this.account,
         this.agentId,
         this.optional1,
         this.optional2,
         this.optional3,
    });

    factory YourRequest.fromJson(Map<String, dynamic> json) => YourRequest(
        code: json["code"],
        account: json["account"],
        agentId: json["agent_id"],
        optional1: json["optional1"],
        optional2: json["optional2"],
        optional3: json["optional3"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "account": account,
        "agent_id": agentId,
        "optional1": optional1,
        "optional2": optional2,
        "optional3": optional3,
    };
}
