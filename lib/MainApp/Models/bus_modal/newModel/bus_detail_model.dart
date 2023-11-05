// To parse this JSON data, do
//
//     final busDetails = busDetailsFromJson(jsonString);

import 'dart:convert';

BusDetails busDetailsFromJson(String str) => BusDetails.fromJson(json.decode(str));

String busDetailsToJson(BusDetails data) => json.encode(data.toJson());

class BusDetails {
    String status;
    List<Detail> details;

    BusDetails({
         this.status,
         this.details,
    });

    factory BusDetails.fromJson(Map<String, dynamic> json) => BusDetails(
        status: json["status"],
        details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
    };
}

class Detail {
    int inventoryType;
    String routeScheduleId;
    String serviceId;
    String fare;
    String departureTime;
    String arrivalTime;
    int availableSeats;
    String operatorName;
    String cancellationPolicy;
    // List<IngPoint> boardingPoints;
    // List<IngPoint> droppingPoints;
    String busType;
    bool partialCancellationAllowed;
    bool idProof;
    int operatorId;
    double commPct;
    bool mTicketAllowed;
    bool isRtc;
    bool isOpTicketTemplate;
    bool isOpLogo;
    bool isFareUpdate;
    bool isChildConcession;
    bool isGetLayoutByBpdp;
    bool socialDistancing;
    int durationInMins;
    dynamic busAmenities;

    Detail({
         this.inventoryType,
         this.routeScheduleId,
         this.serviceId,
         this.fare,
         this.departureTime,
         this.arrivalTime,
         this.availableSeats,
         this.operatorName,
         this.cancellationPolicy,
        //  this.boardingPoints,
        //  this.droppingPoints,
         this.busType,
         this.partialCancellationAllowed,
         this.idProof,
         this.operatorId,
         this.commPct,
         this.mTicketAllowed,
         this.isRtc,
         this.isOpTicketTemplate,
         this.isOpLogo,
         this.isFareUpdate,
         this.isChildConcession,
         this.isGetLayoutByBpdp,
         this.socialDistancing,
         this.durationInMins,
         this.busAmenities,
    });

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        inventoryType: json["inventoryType"],
        routeScheduleId: json["routeScheduleId"],
        serviceId: json["serviceId"],
        fare: json["fare"],
        departureTime: json["departureTime"],
        arrivalTime: json["arrivalTime"],
        availableSeats: json["availableSeats"],
        operatorName: json["operatorName"],
        cancellationPolicy: json["cancellationPolicy"],
        // boardingPoints: List<IngPoint>.from(json["boardingPoints"].map((x) => IngPoint.fromJson(x))),
        // droppingPoints: List<IngPoint>.from(json["droppingPoints"].map((x) => IngPoint.fromJson(x))),
        busType: json["busType"],
        partialCancellationAllowed: json["partialCancellationAllowed"],
        idProof: json["idProof"],
        operatorId: json["operatorId"],
        commPct: json["commPCT"]?.toDouble(),
        mTicketAllowed: json["mTicketAllowed"],
        isRtc: json["isRTC"],
        isOpTicketTemplate: json["isOpTicketTemplate"],
        isOpLogo: json["isOpLogo"],
        isFareUpdate: json["isFareUpdate"],
        isChildConcession: json["is_child_concession"],
        isGetLayoutByBpdp: json["isGetLayoutByBPDP"],
        socialDistancing: json["socialDistancing"],
        durationInMins: json["durationInMins"],
        busAmenities: json["busAmenities"],
    );

    Map<String, dynamic> toJson() => {
        "inventoryType": inventoryType,
        "routeScheduleId": routeScheduleId,
        "serviceId": serviceId,
        "fare": fare,
        "departureTime": departureTime,
        "arrivalTime": arrivalTime,
        "availableSeats": availableSeats,
        "operatorName": operatorName,
        "cancellationPolicy": cancellationPolicy,
        // "boardingPoints": List<dynamic>.from(boardingPoints.map((x) => x.toJson())),
        // "droppingPoints": List<dynamic>.from(droppingPoints.map((x) => x.toJson())),
        "busType": busType,
        "partialCancellationAllowed": partialCancellationAllowed,
        "idProof": idProof,
        "operatorId": operatorId,
        "commPCT": commPct,
        "mTicketAllowed": mTicketAllowed,
        "isRTC": isRtc,
        "isOpTicketTemplate": isOpTicketTemplate,
        "isOpLogo": isOpLogo,
        "isFareUpdate": isFareUpdate,
        "is_child_concession": isChildConcession,
        "isGetLayoutByBPDP": isGetLayoutByBpdp,
        "socialDistancing": socialDistancing,
        "durationInMins": durationInMins,
        "busAmenities": busAmenities,
    };
}

class IngPoint {
    String id;
    String location;
    String time;

    IngPoint({
         this.id,
         this.location,
         this.time,
    });

    factory IngPoint.fromJson(Map<String, dynamic> json) => IngPoint(
        id: json["id"],
        location: json["location"],
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "location": location,
        "time": time,
    };
}
