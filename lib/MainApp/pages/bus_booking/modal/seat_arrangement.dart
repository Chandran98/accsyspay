// To parse this JSON data, do
//
//     final seatArrangementModal = seatArrangementModalFromJson(jsonString);

import 'dart:convert';

SeatArrangementModal seatArrangementModalFromJson(String str) => SeatArrangementModal.fromJson(json.decode(str));

String seatArrangementModalToJson(SeatArrangementModal data) => json.encode(data.toJson());

class SeatArrangementModal {
    String status;
    Details details;

    SeatArrangementModal({
        this.status,
        this.details,
    });

    factory SeatArrangementModal.fromJson(Map<String, dynamic> json) => SeatArrangementModal(
        status: json["status"],
        details: Details.fromJson(json["details"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "details": details.toJson(),
    };
}

class Details {
    String availableSeats;
    String availableSingleSeat;
    List<IngTime> boardingTimes;
    String callFareBreakUpApi;
    List<IngTime> droppingTimes;
    List<FareDetail> fareDetails;
    String noSeatLayoutAvailableSeats;
    String noSeatLayoutEnabled;
    String primo;
    List<Seat> seats;
    String vaccinatedBus;
    String vaccinatedStaff;
    Layout layout;

    Details({
        this.availableSeats,
        this.availableSingleSeat,
        this.boardingTimes,
        this.callFareBreakUpApi,
        this.droppingTimes,
        this.fareDetails,
        this.noSeatLayoutAvailableSeats,
        this.noSeatLayoutEnabled,
        this.primo,
        this.seats,
        this.vaccinatedBus,
        this.vaccinatedStaff,
        this.layout,
    });

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        availableSeats: json["availableSeats"],
        availableSingleSeat: json["availableSingleSeat"],
        boardingTimes: List<IngTime>.from(json["boardingTimes"].map((x) => IngTime.fromJson(x))),
        callFareBreakUpApi: json["callFareBreakUpAPI"],
        droppingTimes: List<IngTime>.from(json["droppingTimes"].map((x) => IngTime.fromJson(x))),
        fareDetails: List<FareDetail>.from(json["fareDetails"].map((x) => FareDetail.fromJson(x))),
        noSeatLayoutAvailableSeats: json["noSeatLayoutAvailableSeats"],
        noSeatLayoutEnabled: json["noSeatLayoutEnabled"],
        primo: json["primo"],
        seats: List<Seat>.from(json["seats"].map((x) => Seat.fromJson(x))),
        vaccinatedBus: json["vaccinatedBus"],
        vaccinatedStaff: json["vaccinatedStaff"],
        layout: Layout.fromJson(json["layout"]),
    );

    Map<String, dynamic> toJson() => {
        "availableSeats": availableSeats,
        "availableSingleSeat": availableSingleSeat,
        "boardingTimes": List<dynamic>.from(boardingTimes.map((x) => x.toJson())),
        "callFareBreakUpAPI": callFareBreakUpApi,
        "droppingTimes": List<dynamic>.from(droppingTimes.map((x) => x.toJson())),
        "fareDetails": List<dynamic>.from(fareDetails.map((x) => x.toJson())),
        "noSeatLayoutAvailableSeats": noSeatLayoutAvailableSeats,
        "noSeatLayoutEnabled": noSeatLayoutEnabled,
        "primo": primo,
        "seats": List<dynamic>.from(seats.map((x) => x.toJson())),
        "vaccinatedBus": vaccinatedBus,
        "vaccinatedStaff": vaccinatedStaff,
        "layout": layout.toJson(),
    };
}

class IngTime {
    String address;
    String bpAmenities;
    String bpId;
    String bpIdentifier;
    String bpName;
    String contactNumber;
    String landmark;
    String location;
    String prime;
    String time;

    IngTime({
        this.address,
        this.bpAmenities,
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
        bpAmenities: json["bpAmenities"],
        bpId: json["bpId"],
        bpIdentifier: json["bpIdentifier"],
        bpName: json["bpName"],
        contactNumber: json["contactNumber"],
        landmark: json["landmark"],
        location: json["location"],
        prime: json["prime"],
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "bpAmenities": bpAmenities,
        "bpId": bpId,
        "bpIdentifier": bpIdentifier,
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

class Layout {
    int seatTotalRow;
    int seatTotalColumn;
    String lowerTotalRow;
    String lowerTotalColumn;
    int upperTotalRow;
    int upperTotalColumn;
    List<dynamic> seating;
    List<Lower> lower;
    List<dynamic> upper;

    Layout({
        this.seatTotalRow,
        this.seatTotalColumn,
        this.lowerTotalRow,
        this.lowerTotalColumn,
        this.upperTotalRow,
        this.upperTotalColumn,
        this.seating,
        this.lower,
        this.upper,
    });

    factory Layout.fromJson(Map<dynamic, dynamic> json) => Layout(
        seatTotalRow: json["seatTotalRow"],
        seatTotalColumn: json["seatTotalColumn"],
        lowerTotalRow: json["lowerTotalRow"],
        lowerTotalColumn: json["lowerTotalColumn"],
        upperTotalRow: json["upperTotalRow"],
        upperTotalColumn: json["upperTotalColumn"],
        seating: List<dynamic>.from(json["Seating"].map((x) => x)),
        lower: List<Lower>.from(json["lower"].map((x) => Lower.fromJson(x))),
        upper: List<dynamic>.from(json["upper"].map((x) => x)),
    );

    Map<dynamic, dynamic> toJson() => {
        "seatTotalRow": seatTotalRow,
        "seatTotalColumn": seatTotalColumn,
        "lowerTotalRow": lowerTotalRow,
        "lowerTotalColumn": lowerTotalColumn,
        "upperTotalRow": upperTotalRow,
        "upperTotalColumn": upperTotalColumn,
        "Seating": List<dynamic>.from(seating.map((x) => x)),
        "lower": List<dynamic>.from(lower.map((x) => x.toJson())),
        "upper": List<dynamic>.from(upper.map((x) => x)),
    };
}

class Lower {
    String row;
    String column;
    String totalFare;
    String baseFare;
    String serviceFarePercentage;
    String serviceFareAmount;
    String ladiesSeat;
    String maleSeat;
    String seatNo;
    String available;

    Lower({
        this.row,
        this.column,
        this.totalFare,
        this.baseFare,
        this.serviceFarePercentage,
        this.serviceFareAmount,
        this.ladiesSeat,
        this.maleSeat,
        this.seatNo,
        this.available,
    });

    factory Lower.fromJson(Map<dynamic, dynamic> json) => Lower(
        row: json["row"],
        column: json["column"],
        totalFare: json["total_fare"],
        baseFare: json["base_fare"],
        serviceFarePercentage: json["service_fare_percentage"],
        serviceFareAmount: json["service_fare_amount"],
        ladiesSeat: json["ladiesSeat"],
        maleSeat: json["maleSeat"],
        seatNo: json["seatNo"],
        available: json["available"],
    );

    Map<dynamic, dynamic> toJson() => {
        "row": row,
        "column": column,
        "total_fare": totalFare,
        "base_fare": baseFare,
        "service_fare_percentage": serviceFarePercentage,
        "service_fare_amount": serviceFareAmount,
        "ladiesSeat": ladiesSeat,
        "maleSeat": maleSeat,
        "seatNo": seatNo,
        "available": available,
    };
}

class Seat {
    String available;
    String bankTrexAmt;
    String baseFare;
    String childFare;
    String column;
    String concession;
    String doubleBirth;
    String fare;
    String ladiesSeat;
    String length;
    String levyFare;
    String malesSeat;
    String markupFareAbsolute;
    String markupFarePercentage;
    String name;
    String operatorServiceChargeAbsolute;
    String operatorServiceChargePercent;
    String reservedForSocialDistancing;
    String row;
    String serviceTaxAbsolute;
    String serviceTaxPercentage;
    String srtFee;
    String tollFee;
    String width;
    String zIndex;

    Seat({
        this.available,
        this.bankTrexAmt,
        this.baseFare,
        this.childFare,
        this.column,
        this.concession,
        this.doubleBirth,
        this.fare,
        this.ladiesSeat,
        this.length,
        this.levyFare,
        this.malesSeat,
        this.markupFareAbsolute,
        this.markupFarePercentage,
        this.name,
        this.operatorServiceChargeAbsolute,
        this.operatorServiceChargePercent,
        this.reservedForSocialDistancing,
        this.row,
        this.serviceTaxAbsolute,
        this.serviceTaxPercentage,
        this.srtFee,
        this.tollFee,
        this.width,
        this.zIndex,
    });

    factory Seat.fromJson(Map<String, dynamic> json) => Seat(
        available: json["available"],
        bankTrexAmt: json["bankTrexAmt"],
        baseFare: json["baseFare"],
        childFare: json["childFare"],
        column: json["column"],
        concession: json["concession"],
        doubleBirth: json["doubleBirth"],
        fare: json["fare"],
        ladiesSeat: json["ladiesSeat"],
        length: json["length"],
        levyFare: json["levyFare"],
        malesSeat: json["malesSeat"],
        markupFareAbsolute: json["markupFareAbsolute"],
        markupFarePercentage: json["markupFarePercentage"],
        name: json["name"],
        operatorServiceChargeAbsolute: json["operatorServiceChargeAbsolute"],
        operatorServiceChargePercent: json["operatorServiceChargePercent"],
        reservedForSocialDistancing: json["reservedForSocialDistancing"],
        row: json["row"],
        serviceTaxAbsolute: json["serviceTaxAbsolute"],
        serviceTaxPercentage: json["serviceTaxPercentage"],
        srtFee: json["srtFee"],
        tollFee: json["tollFee"],
        width: json["width"],
        zIndex: json["zIndex"],
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "bankTrexAmt": bankTrexAmt,
        "baseFare": baseFare,
        "childFare": childFare,
        "column": column,
        "concession": concession,
        "doubleBirth": doubleBirth,
        "fare": fare,
        "ladiesSeat": ladiesSeat,
        "length": length,
        "levyFare": levyFare,
        "malesSeat": malesSeat,
        "markupFareAbsolute": markupFareAbsolute,
        "markupFarePercentage": markupFarePercentage,
        "name": name,
        "operatorServiceChargeAbsolute": operatorServiceChargeAbsolute,
        "operatorServiceChargePercent": operatorServiceChargePercent,
        "reservedForSocialDistancing": reservedForSocialDistancing,
        "row": row,
        "serviceTaxAbsolute": serviceTaxAbsolute,
        "serviceTaxPercentage": serviceTaxPercentage,
        "srtFee": srtFee,
        "tollFee": tollFee,
        "width": width,
        "zIndex": zIndex,
    };
}
