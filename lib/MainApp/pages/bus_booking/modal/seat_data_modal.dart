class SeatData {
  String status;
  Details details;

  SeatData({this.status, this.details});

  SeatData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    details = Details.fromJson(json['details']);
  }
}

class Details {
  String availableSeats;
  String availableSingleSeat;
  List<BoardingTimes> boardingTimes;
  String callFareBreakUpAPI;
  List<DroppingTimes> droppingTimes;
  FareDetails fareDetails;
  String forcedSeats;
  String maxSeatsPerTicket;
  String noSeatLayoutEnabled;
  String primo;
  List<Seat> seats;

  Details(
      {this.availableSeats,
      this.availableSingleSeat,
      this.boardingTimes,
      this.callFareBreakUpAPI,
      this.droppingTimes,
      this.fareDetails,
      this.forcedSeats,
      this.maxSeatsPerTicket,
      this.noSeatLayoutEnabled,
      this.primo,
      this.seats});

  Details.fromJson(Map<String, dynamic> json) {
    availableSeats = json['availableSeats'];
    availableSingleSeat = json['availableSingleSeat'];
    if (json['boardingTimes'] != null) {
      boardingTimes = [];
      json['boardingTimes'].forEach((v) {
        boardingTimes.add(BoardingTimes.fromJson(v));
      });
    }
    callFareBreakUpAPI = json['callFareBreakUpAPI'];
    if (json['droppingTimes'] != null) {
      droppingTimes = [];
      json['droppingTimes'].forEach((v) {
        droppingTimes.add(DroppingTimes.fromJson(v));
      });
    }
    fareDetails = FareDetails.fromJson(json['fareDetails']);
    forcedSeats = json['forcedSeats'];
    maxSeatsPerTicket = json['maxSeatsPerTicket'];
    noSeatLayoutEnabled = json['noSeatLayoutEnabled'];
    primo = json['primo'];
    if (json['seats'] != null) {
      seats = [];
      json['seats'].forEach((v) {
        seats.add(Seat.fromJson(v));
      });
    }
  }
}

class BoardingTimes {
  String address;
  String bpId;
  String bpName;
  String city;
  String cityId;
  String contactNumber;
  String landmark;
  String location;
  String locationId;
  String prime;
  String time;

  BoardingTimes(
      {this.address,
      this.bpId,
      this.bpName,
      this.city,
      this.cityId,
      this.contactNumber,
      this.landmark,
      this.location,
      this.locationId,
      this.prime,
      this.time});

  BoardingTimes.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    bpId = json['bpId'];
    bpName = json['bpName'];
    city = json['city'];
    cityId = json['cityId'];
    contactNumber = json['contactNumber'];
    landmark = json['landmark'];
    location = json['location'];
    locationId = json['locationId'];
    prime = json['prime'];
    time = json['time'];
  }
}

class DroppingTimes {
  String address;
  String bpId;
  String bpName;
  String city;
  String cityId;
  String contactNumber;
  String landmark;
  String location;
  String locationId;
  String prime;
  String time;

  DroppingTimes(
      {this.address,
      this.bpId,
      this.bpName,
      this.city,
      this.cityId,
      this.contactNumber,
      this.landmark,
      this.location,
      this.locationId,
      this.prime,
      this.time});

  DroppingTimes.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    bpId = json['bpId'];
    bpName = json['bpName'];
    city = json['city'];
    cityId = json['cityId'];
    contactNumber = json['contactNumber'];
    landmark = json['landmark'];
    location = json['location'];
    locationId = json['locationId'];
    prime = json['prime'];
    time = json['time'];
  }
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

  FareDetails(
      {this.bankTrexAmt,
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
      this.totalFare});

  FareDetails.fromJson(Map<String, dynamic> json) {
    bankTrexAmt = json['bankTrexAmt'];
    baseFare = json['baseFare'];
    bookingFee = json['bookingFee'];
    childFare = json['childFare'];
    gst = json['gst'];
    levyFare = json['levyFare'];
    markupFareAbsolute = json['markupFareAbsolute'];
    markupFarePercentage = json['markupFarePercentage'];
    opFare = json['opFare'];
    opGroupFare = json['opGroupFare'];
    operatorServiceChargeAbsolute = json['operatorServiceChargeAbsolute'];
    operatorServiceChargePercentage = json['operatorServiceChargePercentage'];
    serviceCharge = json['serviceCharge'];
    serviceTaxAbsolute = json['serviceTaxAbsolute'];
    serviceTaxPercentage = json['serviceTaxPercentage'];
    srtFee = json['srtFee'];
    tollFee = json['tollFee'];
    totalFare = json['totalFare'];
  }
}

class Seat {
  String available;
  String baseFare;
  String column;
  String doubleBirth;
  String fare;
  String ladiesSeat;
  String length;
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
  String width;
  String zIndex;

  Seat(
      {this.available,
      this.baseFare,
      this.column,
      this.doubleBirth,
      this.fare,
      this.ladiesSeat,
      this.length,
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
      this.width,
      this.zIndex});

  Seat.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    baseFare = json['baseFare'];
    column = json['column'];
    doubleBirth = json['doubleBirth'];
    fare = json['fare'];
    ladiesSeat = json['ladiesSeat'];
    length = json['length'];
    malesSeat = json['malesSeat'];
    markupFareAbsolute = json['markupFareAbsolute'];
    markupFarePercentage = json['markupFarePercentage'];
    name = json['name'];
    operatorServiceChargeAbsolute = json['operatorServiceChargeAbsolute'];
    operatorServiceChargePercent = json['operatorServiceChargePercent'];
    reservedForSocialDistancing = json['reservedForSocialDistancing'];
    row = json['row'];
    serviceTaxAbsolute = json['serviceTaxAbsolute'];
    serviceTaxPercentage = json['serviceTaxPercentage'];
    width = json['width'];
    zIndex = json['zIndex'];
  }
}
