// To parse this JSON data, do
//
//     final busAvailableModal = busAvailableModalFromJson(jsonString);

import 'dart:convert';

BusAvailableModal busAvailableModalFromJson(String str) => BusAvailableModal.fromJson(json.decode(str));

String busAvailableModalToJson(BusAvailableModal data) => json.encode(data.toJson());

class BusAvailableModal {
    String status;
    Details details;

    BusAvailableModal({
        this.status,
        this.details,
    });

    factory BusAvailableModal.fromJson(Map<String, dynamic> json) => BusAvailableModal(
        status: json["status"],
        details: Details.fromJson(json["details"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "details": details.toJson(),
    };
}

class Details {
    String agentMappedToCp;
    String agentMappedToEarning;
    List<AvailableTrip> availableTrips;

    Details({
        this.agentMappedToCp,
        this.agentMappedToEarning,
        this.availableTrips,
    });

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        agentMappedToCp: json["agentMappedToCp"],
        agentMappedToEarning: json["agentMappedToEarning"],
        availableTrips: List<AvailableTrip>.from(json["availableTrips"].map((x) => AvailableTrip.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "agentMappedToCp": agentMappedToCp,
        "agentMappedToEarning": agentMappedToEarning,
        "availableTrips": List<dynamic>.from(availableTrips.map((x) => x.toJson())),
    };
}

class AvailableTrip {
    String ac;
    String additionalCommission;
    String agentServiceCharge;
    String agentServiceChargeAllowed;
    String arrivalTime;
    String availCatCard;
    String availSrCitizen;
    String availableSeats;
    String availableSingleSeat;
    String avlWindowSeats;
    String boCommission;
    String boPriorityOperator;
    List<IngTime> boardingTimes;
    String bookable;
    String bpDpSeatLayout;
    String busCancelled;
    String busImageCount;
    String busRoutes;
    String busServiceId;
    String busType;
    String busTypeId;
    Businfo businfo;
    String callFareBreakUpApi;
    String cancellationCalculationTimestamp;
    String cancellationPolicy;
    String departureTime;
    String destination;
    DateTime doj;
    String dropPointMandatory;
    List<IngTime> droppingTimes;
    String duration;
    String exactSearch;
    FareDetails fareDetails;
    String fares;
    String flatComApplicable;
    String flatSsComApplicable;
    String gdsCommission;
    String groupOfferPriceEnabled;
    String happyHours;
    String id;
    String idProofRequired;
    String imagesMetadataUrl;
    String isLmbAllowed;
    String liveTrackingAvailable;
    String maxSeatsPerTicket;
    String nextDay;
    String noSeatLayoutAvailableSeats;
    String noSeatLayoutEnabled;
    String nonAc;
    String offerPriceEnabled;
    String availableTripOperator;
    String otgEnabled;
    String partialCancellationAllowed;
    String partnerBaseCommission;
    String primaryPaxCancellable;
    String primo;
    String routeId;
    String rtc;
    String ssAgentAccount;
    String seater;
    String selfInventory;
    DateTime serviceStartTime;
    String singleLadies;
    String sleeper;
    String socialDistancing;
    String source;
    String subBusType;
    String tatkalTime;
    String travels;
    String unAvailable;
    String vaccinatedBus;
    String vaccinatedStaff;
    String vehicleType;
    String viaRoutes;
    String zeroCancellationTime;
    String mTicketEnabled;

    AvailableTrip({
        this.ac,
        this.additionalCommission,
        this.agentServiceCharge,
        this.agentServiceChargeAllowed,
        this.arrivalTime,
        this.availCatCard,
        this.availSrCitizen,
        this.availableSeats,
        this.availableSingleSeat,
        this.avlWindowSeats,
        this.boCommission,
        this.boPriorityOperator,
        this.boardingTimes,
        this.bookable,
        this.bpDpSeatLayout,
        this.busCancelled,
        this.busImageCount,
        this.busRoutes,
        this.busServiceId,
        this.busType,
        this.busTypeId,
        this.businfo,
        this.callFareBreakUpApi,
        this.cancellationCalculationTimestamp,
        this.cancellationPolicy,
        this.departureTime,
        this.destination,
        this.doj,
        this.dropPointMandatory,
        this.droppingTimes,
        this.duration,
        this.exactSearch,
        this.fareDetails,
        this.fares,
        this.flatComApplicable,
        this.flatSsComApplicable,
        this.gdsCommission,
        this.groupOfferPriceEnabled,
        this.happyHours,
        this.id,
        this.idProofRequired,
        this.imagesMetadataUrl,
        this.isLmbAllowed,
        this.liveTrackingAvailable,
        this.maxSeatsPerTicket,
        this.nextDay,
        this.noSeatLayoutAvailableSeats,
        this.noSeatLayoutEnabled,
        this.nonAc,
        this.offerPriceEnabled,
        this.availableTripOperator,
        this.otgEnabled,
        this.partialCancellationAllowed,
        this.partnerBaseCommission,
        this.primaryPaxCancellable,
        this.primo,
        this.routeId,
        this.rtc,
        this.ssAgentAccount,
        this.seater,
        this.selfInventory,
        this.serviceStartTime,
        this.singleLadies,
        this.sleeper,
        this.socialDistancing,
        this.source,
        this.subBusType,
        this.tatkalTime,
        this.travels,
        this.unAvailable,
        this.vaccinatedBus,
        this.vaccinatedStaff,
        this.vehicleType,
        this.viaRoutes,
        this.zeroCancellationTime,
        this.mTicketEnabled,
    });

    factory AvailableTrip.fromJson(Map<String, dynamic> json) => AvailableTrip(
        ac: json["AC"],
        additionalCommission: json["additionalCommission"],
        agentServiceCharge: json["agentServiceCharge"],
        agentServiceChargeAllowed: json["agentServiceChargeAllowed"],
        arrivalTime: json["arrivalTime"],
        availCatCard: json["availCatCard"],
        availSrCitizen: json["availSrCitizen"],
        availableSeats: json["availableSeats"],
        availableSingleSeat: json["availableSingleSeat"],
        avlWindowSeats: json["avlWindowSeats"],
        boCommission: json["boCommission"],
        boPriorityOperator: json["boPriorityOperator"],
        boardingTimes: List<IngTime>.from(json["boardingTimes"].map((x) => IngTime.fromJson(x))),
        bookable: json["bookable"],
        bpDpSeatLayout: json["bpDpSeatLayout"],
        busCancelled: json["busCancelled"],
        busImageCount: json["busImageCount"],
        busRoutes: json["busRoutes"],
        busServiceId: json["busServiceId"],
        busType: json["busType"],
        busTypeId: json["busTypeId"],
        businfo: Businfo.fromJson(json["businfo"]),
        callFareBreakUpApi: json["callFareBreakUpAPI"],
        cancellationCalculationTimestamp: json["cancellationCalculationTimestamp"],
        cancellationPolicy: json["cancellationPolicy"],
        departureTime: json["departureTime"],
        destination: json["destination"],
        doj: DateTime.parse(json["doj"]),
        dropPointMandatory: json["dropPointMandatory"],
        droppingTimes: List<IngTime>.from(json["droppingTimes"].map((x) => IngTime.fromJson(x))),
        duration: json["duration"],
        exactSearch: json["exactSearch"],
        fareDetails: FareDetails.fromJson(json["fareDetails"]),
        fares: json["fares"],
        flatComApplicable: json["flatComApplicable"],
        flatSsComApplicable: json["flatSSComApplicable"],
        gdsCommission: json["gdsCommission"],
        groupOfferPriceEnabled: json["groupOfferPriceEnabled"],
        happyHours: json["happyHours"],
        id: json["id"],
        idProofRequired: json["idProofRequired"],
        imagesMetadataUrl: json["imagesMetadataUrl"],
        isLmbAllowed: json["isLMBAllowed"],
        liveTrackingAvailable: json["liveTrackingAvailable"],
        maxSeatsPerTicket: json["maxSeatsPerTicket"],
        nextDay: json["nextDay"],
        noSeatLayoutAvailableSeats: json["noSeatLayoutAvailableSeats"],
        noSeatLayoutEnabled: json["noSeatLayoutEnabled"],
        nonAc: json["nonAC"],
        offerPriceEnabled: json["offerPriceEnabled"],
        availableTripOperator: json["operator"],
        otgEnabled: json["otgEnabled"],
        partialCancellationAllowed: json["partialCancellationAllowed"],
        partnerBaseCommission: json["partnerBaseCommission"],
        primaryPaxCancellable: json["primaryPaxCancellable"],
        primo: json["primo"],
        routeId: json["routeId"],
        rtc: json["rtc"],
        ssAgentAccount: json["SSAgentAccount"],
        seater: json["seater"],
        selfInventory: json["selfInventory"],
        serviceStartTime: DateTime.parse(json["serviceStartTime"]),
        singleLadies: json["singleLadies"],
        sleeper: json["sleeper"],
        socialDistancing: json["socialDistancing"],
        source: json["source"],
        subBusType: json["subBusType"],
        tatkalTime: json["tatkalTime"],
        travels: json["travels"],
        unAvailable: json["unAvailable"],
        vaccinatedBus: json["vaccinatedBus"],
        vaccinatedStaff: json["vaccinatedStaff"],
        vehicleType: json["vehicleType"],
        viaRoutes: json["viaRoutes"],
        zeroCancellationTime: json["zeroCancellationTime"],
        mTicketEnabled: json["mTicketEnabled"],
    );

    Map<String, dynamic> toJson() => {
        "AC": ac,
        "additionalCommission": additionalCommission,
        "agentServiceCharge": agentServiceCharge,
        "agentServiceChargeAllowed": agentServiceChargeAllowed,
        "arrivalTime": arrivalTime,
        "availCatCard": availCatCard,
        "availSrCitizen": availSrCitizen,
        "availableSeats": availableSeats,
        "availableSingleSeat": availableSingleSeat,
        "avlWindowSeats": avlWindowSeats,
        "boCommission": boCommission,
        "boPriorityOperator": boPriorityOperator,
        "boardingTimes": List<dynamic>.from(boardingTimes.map((x) => x.toJson())),
        "bookable": bookable,
        "bpDpSeatLayout": bpDpSeatLayout,
        "busCancelled": busCancelled,
        "busImageCount": busImageCount,
        "busRoutes": busRoutes,
        "busServiceId": busServiceId,
        "busType": busType,
        "busTypeId": busTypeId,
        "businfo": businfo.toJson(),
        "callFareBreakUpAPI": callFareBreakUpApi,
        "cancellationCalculationTimestamp": cancellationCalculationTimestamp,
        "cancellationPolicy": cancellationPolicy,
        "departureTime": departureTime,
        "destination": destination,
        "doj": doj.toIso8601String(),
        "dropPointMandatory": dropPointMandatory,
        "droppingTimes": List<dynamic>.from(droppingTimes.map((x) => x.toJson())),
        "duration": duration,
        "exactSearch": exactSearch,
        "fareDetails": fareDetails.toJson(),
        "fares": fares,
        "flatComApplicable": flatComApplicable,
        "flatSSComApplicable": flatSsComApplicable,
        "gdsCommission": gdsCommission,
        "groupOfferPriceEnabled": groupOfferPriceEnabled,
        "happyHours": happyHours,
        "id": id,
        "idProofRequired": idProofRequired,
        "imagesMetadataUrl": imagesMetadataUrl,
        "isLMBAllowed": isLmbAllowed,
        "liveTrackingAvailable": liveTrackingAvailable,
        "maxSeatsPerTicket": maxSeatsPerTicket,
        "nextDay": nextDay,
        "noSeatLayoutAvailableSeats": noSeatLayoutAvailableSeats,
        "noSeatLayoutEnabled": noSeatLayoutEnabled,
        "nonAC": nonAc,
        "offerPriceEnabled": offerPriceEnabled,
        "operator": availableTripOperator,
        "otgEnabled": otgEnabled,
        "partialCancellationAllowed": partialCancellationAllowed,
        "partnerBaseCommission": partnerBaseCommission,
        "primaryPaxCancellable": primaryPaxCancellable,
        "primo": primo,
        "routeId": routeId,
        "rtc": rtc,
        "SSAgentAccount": ssAgentAccount,
        "seater": seater,
        "selfInventory": selfInventory,
        "serviceStartTime": serviceStartTime.toIso8601String(),
        "singleLadies": singleLadies,
        "sleeper": sleeper,
        "socialDistancing": socialDistancing,
        "source": source,
        "subBusType": subBusType,
        "tatkalTime": tatkalTime,
        "travels": travels,
        "unAvailable": unAvailable,
        "vaccinatedBus": vaccinatedBus,
        "vaccinatedStaff": vaccinatedStaff,
        "vehicleType": vehicleType,
        "viaRoutes": viaRoutes,
        "zeroCancellationTime": zeroCancellationTime,
        "mTicketEnabled": mTicketEnabled,
    };
}

class IngTime {
    String address;
    String bpId;
    String bpIdentifier;
    String bpName;
    String contactNumber;
    Landmark landmark;
    String location;
    String prime;
    String time;

    IngTime({
        this.address,
        this.bpId,
        this.bpIdentifier,
        this.bpName,
        this.contactNumber,
        this.landmark,
        this.location,
        this.prime,
        this.time,
    });

    factory IngTime.fromJson(Map<String, dynamic> json) => IngTime(
        address: json["address"],
        bpId: json["bpId"],
        bpIdentifier: json["bpIdentifier"],
        bpName: json["bpName"],
        contactNumber: json["contactNumber"],
        landmark: landmarkValues.map[json["landmark"]],
        location: json["location"],
        prime: json["prime"],
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "bpId": bpId,
        "bpIdentifier": bpIdentifier,
        "bpName": bpName,
        "contactNumber": contactNumber,
        "landmark": landmarkValues.reverse[landmark],
        "location": location,
        "prime": prime,
        "time": time,
    };
}

enum Landmark { EMPTY, OPP_SAVOURY_SEA_SHELL_HOTEL, FRONT_OF_OASIS_MALL, FRONT_OF_CANARA_BANK }

final landmarkValues = EnumValues({
    " ": Landmark.EMPTY,
    "Front of Canara Bank": Landmark.FRONT_OF_CANARA_BANK,
    " Front of oasis mall": Landmark.FRONT_OF_OASIS_MALL,
    "Opp Savoury sea shell Hotel": Landmark.OPP_SAVOURY_SEA_SHELL_HOTEL
});

class Businfo {
    String busNumber;
    String driverMobile;
    String driverName;

    Businfo({
        this.busNumber,
        this.driverMobile,
        this.driverName,
    });

    factory Businfo.fromJson(Map<String, dynamic> json) => Businfo(
        busNumber: json["busNumber"],
        driverMobile: json["driverMobile"],
        driverName: json["driverName"],
    );

    Map<String, dynamic> toJson() => {
        "busNumber": busNumber,
        "driverMobile": driverMobile,
        "driverName": driverName,
    };
}

class FareDetails {
    String bankTrexAmt;
    String baseFare;
    String bookingFee;
    String childFare;
    String gst;
    String levyFare;
    String markupFareAbsolute;
    String markupFarePercentage;
    String opFare;
    String opGroupFare;
    String operatorServiceChargeAbsolute;
    String operatorServiceChargePercentage;
    String serviceCharge;
    String serviceTaxAbsolute;
    String serviceTaxPercentage;
    String srtFee;
    String tollFee;
    String totalFare;

    FareDetails({
        this.bankTrexAmt,
        this.baseFare,
        this.bookingFee,
        this.childFare,
        this.gst,
        this.levyFare,
        this.markupFareAbsolute,
        this.markupFarePercentage,
        this.opFare,
        this.opGroupFare,
        this.operatorServiceChargeAbsolute,
        this.operatorServiceChargePercentage,
        this.serviceCharge,
        this.serviceTaxAbsolute,
        this.serviceTaxPercentage,
        this.srtFee,
        this.tollFee,
        this.totalFare,
    });

    factory FareDetails.fromJson(Map<String, dynamic> json) => FareDetails(
        bankTrexAmt: json["bankTrexAmt"],
        baseFare: json["baseFare"],
        bookingFee: json["bookingFee"],
        childFare: json["childFare"],
        gst: json["gst"],
        levyFare: json["levyFare"],
        markupFareAbsolute: json["markupFareAbsolute"],
        markupFarePercentage: json["markupFarePercentage"],
        opFare: json["opFare"],
        opGroupFare: json["opGroupFare"],
        operatorServiceChargeAbsolute: json["operatorServiceChargeAbsolute"],
        operatorServiceChargePercentage: json["operatorServiceChargePercentage"],
        serviceCharge: json["serviceCharge"],
        serviceTaxAbsolute: json["serviceTaxAbsolute"],
        serviceTaxPercentage: json["serviceTaxPercentage"],
        srtFee: json["srtFee"],
        tollFee: json["tollFee"],
        totalFare: json["totalFare"],
    );

    Map<String, dynamic> toJson() => {
        "bankTrexAmt": bankTrexAmt,
        "baseFare": baseFare,
        "bookingFee": bookingFee,
        "childFare": childFare,
        "gst": gst,
        "levyFare": levyFare,
        "markupFareAbsolute": markupFareAbsolute,
        "markupFarePercentage": markupFarePercentage,
        "opFare": opFare,
        "opGroupFare": opGroupFare,
        "operatorServiceChargeAbsolute": operatorServiceChargeAbsolute,
        "operatorServiceChargePercentage": operatorServiceChargePercentage,
        "serviceCharge": serviceCharge,
        "serviceTaxAbsolute": serviceTaxAbsolute,
        "serviceTaxPercentage": serviceTaxPercentage,
        "srtFee": srtFee,
        "tollFee": tollFee,
        "totalFare": totalFare,
    };
}

class EnumValues<T> {
    Map<String, T> map;
     Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
