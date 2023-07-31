// To parse this JSON data, do
//
//     final availableBusModal = availableBusModalFromJson(jsonString);

import 'dart:convert';

AvailableBusModal availableBusModalFromJson(String str) =>
    AvailableBusModal.fromJson(json.decode(str));

String availableBusModalToJson(AvailableBusModal data) =>
    json.encode(data.toJson());

class AvailableBusModal {
  String status;
  Details details;

  AvailableBusModal({
    this.status,
    this.details,
  });

  factory AvailableBusModal.fromJson(Map<String, dynamic> json) =>
      AvailableBusModal(
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
        availableTrips: List<AvailableTrip>.from(
            json["availableTrips"].map((x) => AvailableTrip.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "agentMappedToCp": agentMappedToCp,
        "agentMappedToEarning": agentMappedToEarning,
        "availableTrips":
            List<dynamic>.from(availableTrips.map((x) => x.toJson())),
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
  IngTimes boardingTimes;
  String bookable;
  String bpDpSeatLayout;
  String busCancelled;
  String busImageCount;
  String busRoutes;
  String busType;
  String busTypeId;
  String callFareBreakUpApi;
  String cancellationCalculationTimestamp;
  String cancellationPolicy;
  String departureTime;
  String destination;
  DateTime doj;
  String dropPointMandatory;
  IngTimes droppingTimes;
  String duration;
  String exactSearch;
  List<FareDetail> fareDetails;
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
  String singleLadies;
  String sleeper;
  String source;
  String tatkalTime;
  String travels;
  String unAvailable;
  String vaccinatedBus;
  String vaccinatedStaff;
  String vehicleType;
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
    this.busType,
    this.busTypeId,
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
    this.singleLadies,
    this.sleeper,
    this.source,
    this.tatkalTime,
    this.travels,
    this.unAvailable,
    this.vaccinatedBus,
    this.vaccinatedStaff,
    this.vehicleType,
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
        boardingTimes: IngTimes.fromJson(json["boardingTimes"]),
        bookable: json["bookable"],
        bpDpSeatLayout: json["bpDpSeatLayout"],
        busCancelled: json["busCancelled"],
        busImageCount: json["busImageCount"],
        busRoutes: json["busRoutes"],
        busType: json["busType"],
        busTypeId: json["busTypeId"],
        callFareBreakUpApi: json["callFareBreakUpAPI"],
        cancellationCalculationTimestamp:
            json["cancellationCalculationTimestamp"],
        cancellationPolicy: json["cancellationPolicy"],
        departureTime: json["departureTime"],
        destination: json["destination"],
        doj: DateTime.parse(json["doj"]),
        dropPointMandatory: json["dropPointMandatory"],
        droppingTimes: IngTimes.fromJson(json["droppingTimes"]),
        duration: json["duration"],
        exactSearch: json["exactSearch"],
        fareDetails: List<FareDetail>.from(
            json["fareDetails"].map((x) => FareDetail.fromJson(x))),
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
        singleLadies: json["singleLadies"],
        sleeper: json["sleeper"],
        source: json["source"],
        tatkalTime: json["tatkalTime"],
        travels: json["travels"],
        unAvailable: json["unAvailable"],
        vaccinatedBus: json["vaccinatedBus"],
        vaccinatedStaff: json["vaccinatedStaff"],
        vehicleType: json["vehicleType"],
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
        "boardingTimes": boardingTimes.toJson(),
        "bookable": bookable,
        "bpDpSeatLayout": bpDpSeatLayout,
        "busCancelled": busCancelled,
        "busImageCount": busImageCount,
        "busRoutes": busRoutes,
        "busType": busType,
        "busTypeId": busTypeId,
        "callFareBreakUpAPI": callFareBreakUpApi,
        "cancellationCalculationTimestamp": cancellationCalculationTimestamp,
        "cancellationPolicy": cancellationPolicy,
        "departureTime": departureTime,
        "destination": destination,
        "doj": doj.toIso8601String(),
        "dropPointMandatory": dropPointMandatory,
        "droppingTimes": droppingTimes.toJson(),
        "duration": duration,
        "exactSearch": exactSearch,
        "fareDetails": List<dynamic>.from(fareDetails.map((x) => x.toJson())),
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
        "singleLadies": singleLadies,
        "sleeper": sleeper,
        "source": source,
        "tatkalTime": tatkalTime,
        "travels": travels,
        "unAvailable": unAvailable,
        "vaccinatedBus": vaccinatedBus,
        "vaccinatedStaff": vaccinatedStaff,
        "vehicleType": vehicleType,
        "zeroCancellationTime": zeroCancellationTime,
        "mTicketEnabled": mTicketEnabled,
      };
}

class IngTimes {
  String address;
  String bpId;
  String bpName;
  String contactNumber;
  String landmark;
  String location;
  String prime;
  String time;

  IngTimes({
    this.address,
    this.bpId,
    this.bpName,
    this.contactNumber,
    this.landmark,
    this.location,
    this.prime,
    this.time,
  });

  factory IngTimes.fromJson(Map<String, dynamic> json) => IngTimes(
        address: json["address"],
        bpId: json["bpId"],
        bpName: json["bpName"],
        contactNumber: json["contactNumber"],
        landmark: json["landmark"],
        location: json["location"],
        prime: json["prime"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "bpId": bpId,
        "bpName": bpName,
        "contactNumber": contactNumber,
        "landmark": landmark,
        "location": location,
        "prime": prime,
        "time": time,
      };
}

class FareDetail {
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

  FareDetail({
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

  factory FareDetail.fromJson(Map<String, dynamic> json) => FareDetail(
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
        operatorServiceChargePercentage:
            json["operatorServiceChargePercentage"],
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
