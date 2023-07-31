class SeatLayoutModal {
  String status;
  SeatLayoutDetails details;

  SeatLayoutModal({this.status, this.details});

  SeatLayoutModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    details =
        json['details'] != null ? SeatLayoutDetails.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    return data;
  }
}

class SeatLayoutDetails {
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
  String vaccinatedBus;
  String vaccinatedStaff;
  Layout layout;

  SeatLayoutDetails(
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
      this.seats,
      this.vaccinatedBus,
      this.vaccinatedStaff,
      this.layout});

  SeatLayoutDetails.fromJson(Map<String, dynamic> json) {
    availableSeats = json['availableSeats'];
    availableSingleSeat = json['availableSingleSeat'];
    boardingTimes = (json['boardingTimes'] != null
        ? BoardingTimes.fromJson(json['boardingTimes'])
        : null) as List<BoardingTimes>;
    callFareBreakUpAPI = json['callFareBreakUpAPI'];
    droppingTimes = (json['droppingTimes'] != null
        ? DroppingTimes.fromJson(json['droppingTimes'])
        : null) as List<DroppingTimes>;
    fareDetails = json['fareDetails'] != null
        ? FareDetails.fromJson(json['fareDetails'])
        : null;
    forcedSeats = json['forcedSeats'];
    maxSeatsPerTicket = json['maxSeatsPerTicket'];
    noSeatLayoutEnabled = json['noSeatLayoutEnabled'];
    primo = json['primo'];
    if (json['seats'] != null) {
      seats = <Seat>[];
      json['seats'].forEach((v) {
        seats.add(Seat.fromJson(v));
      });
    }
    vaccinatedBus = json['vaccinatedBus'];
    vaccinatedStaff = json['vaccinatedStaff'];
    layout =
        json['layout'] != null ? Layout.fromJson(json['layout']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['availableSeats'] = this.availableSeats;
    data['availableSingleSeat'] = this.availableSingleSeat;
    if (this.boardingTimes != null) {
      data['boardingTimes'] = boardingTimes;
    }
    data['callFareBreakUpAPI'] = this.callFareBreakUpAPI;
    if (this.droppingTimes != null) {
      data['droppingTimes'] = this.droppingTimes;
    }
    if (this.fareDetails != null) {
      data['fareDetails'] = this.fareDetails.toJson();
    }
    data['forcedSeats'] = this.forcedSeats;
    data['maxSeatsPerTicket'] = this.maxSeatsPerTicket;
    data['noSeatLayoutEnabled'] = this.noSeatLayoutEnabled;
    data['primo'] = this.primo;
    if (this.seats != null) {
      data['seats'] = this.seats.map((v) => v.toJson()).toList();
    }
    data['vaccinatedBus'] = this.vaccinatedBus;
    data['vaccinatedStaff'] = this.vaccinatedStaff;
    if (this.layout != null) {
      data['layout'] = this.layout.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['bpId'] = this.bpId;
    data['bpName'] = this.bpName;
    data['city'] = this.city;
    data['cityId'] = this.cityId;
    data['contactNumber'] = this.contactNumber;
    data['landmark'] = this.landmark;
    data['location'] = this.location;
    data['locationId'] = this.locationId;
    data['prime'] = this.prime;
    data['time'] = this.time;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['bpId'] = this.bpId;
    data['bpName'] = this.bpName;
    data['city'] = this.city;
    data['cityId'] = this.cityId;
    data['contactNumber'] = this.contactNumber;
    data['landmark'] = this.landmark;
    data['location'] = this.location;
    data['locationId'] = this.locationId;
    data['prime'] = this.prime;
    data['time'] = this.time;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bankTrexAmt'] = this.bankTrexAmt;
    data['baseFare'] = this.baseFare;
    data['bookingFee'] = this.bookingFee;
    data['childFare'] = this.childFare;
    data['gst'] = this.gst;
    data['levyFare'] = this.levyFare;
    data['markupFareAbsolute'] = this.markupFareAbsolute;
    data['markupFarePercentage'] = this.markupFarePercentage;
    data['opFare'] = this.opFare;
    data['opGroupFare'] = this.opGroupFare;
    data['operatorServiceChargeAbsolute'] = this.operatorServiceChargeAbsolute;
    data['operatorServiceChargePercentage'] =
        this.operatorServiceChargePercentage;
    data['serviceCharge'] = this.serviceCharge;
    data['serviceTaxAbsolute'] = this.serviceTaxAbsolute;
    data['serviceTaxPercentage'] = this.serviceTaxPercentage;
    data['srtFee'] = this.srtFee;
    data['tollFee'] = this.tollFee;
    data['totalFare'] = this.totalFare;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available'] = this.available;
    data['baseFare'] = this.baseFare;
    data['column'] = this.column;
    data['doubleBirth'] = this.doubleBirth;
    data['fare'] = this.fare;
    data['ladiesSeat'] = this.ladiesSeat;
    data['length'] = this.length;
    data['malesSeat'] = this.malesSeat;
    data['markupFareAbsolute'] = this.markupFareAbsolute;
    data['markupFarePercentage'] = this.markupFarePercentage;
    data['name'] = this.name;
    data['operatorServiceChargeAbsolute'] = this.operatorServiceChargeAbsolute;
    data['operatorServiceChargePercent'] = this.operatorServiceChargePercent;
    data['reservedForSocialDistancing'] = this.reservedForSocialDistancing;
    data['row'] = this.row;
    data['serviceTaxAbsolute'] = this.serviceTaxAbsolute;
    data['serviceTaxPercentage'] = this.serviceTaxPercentage;
    data['width'] = this.width;
    data['zIndex'] = this.zIndex;
    return data;
  }
}

class Layout {
  String seatTotalRow;
  String seatTotalColumn;
  int lowerTotalRow;
  int lowerTotalColumn;
  int upperTotalRow;
  int upperTotalColumn;
  int verticalLowerTotalRow;
  int verticalLowerTotalColumn;
  int verticalUpperTotalRow;
  int verticalUpperTotalColumn;
  List<Seating> seating;
  List<Lower> lower;
  List<Upper> upper;
  List<VerticalLower> verticalLower;
  List<VerticalUpper> verticalUpper;

  Layout(
      {this.seatTotalRow,
      this.seatTotalColumn,
      this.lowerTotalRow,
      this.lowerTotalColumn,
      this.upperTotalRow,
      this.upperTotalColumn,
      this.verticalLowerTotalRow,
      this.verticalLowerTotalColumn,
      this.verticalUpperTotalRow,
      this.verticalUpperTotalColumn,
      this.seating,
      this.lower,
      this.upper,
      this.verticalLower,
      this.verticalUpper});

  Layout.fromJson(Map<String, dynamic> json) {
    seatTotalRow = json['seatTotalRow'];
    seatTotalColumn = json['seatTotalColumn'];
    lowerTotalRow = json['lowerTotalRow'];
    lowerTotalColumn = json['lowerTotalColumn'];
    upperTotalRow = json['upperTotalRow'];
    upperTotalColumn = json['upperTotalColumn'];
    verticalLowerTotalRow = json['verticalLowerTotalRow'];
    verticalLowerTotalColumn = json['verticalLowerTotalColumn'];
    verticalUpperTotalRow = json['verticalUpperTotalRow'];
    verticalUpperTotalColumn = json['verticalUpperTotalColumn'];
    if (json['Seating'] != null) {
      seating = <Seating>[];
      json['Seating'].forEach((v) {
        seating.add(Seating.fromJson(v));
      });
    }
    if (json['lower'] != null) {
      lower = <Lower>[];
      json['lower'].forEach((v) {
        lower.add(Lower.fromJson(v));
      });
    }
    if (json['upper'] != null) {
      upper = <Upper>[];
      json['upper'].forEach((v) {
        upper.add(Upper.fromJson(v));
      });
    }
    if (json['verticalLower'] != null) {
      verticalLower = <VerticalLower>[];
      json['verticalLower'].forEach((v) {
        verticalLower.add(VerticalLower.fromJson(v));
      });
    }
    if (json['verticalUpper'] != null) {
      verticalUpper = <VerticalUpper>[];
      json['verticalUpper'].forEach((v) {
        verticalUpper.add(VerticalUpper.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seatTotalRow'] = this.seatTotalRow;
    data['seatTotalColumn'] = this.seatTotalColumn;
    data['lowerTotalRow'] = this.lowerTotalRow;
    data['lowerTotalColumn'] = this.lowerTotalColumn;
    data['upperTotalRow'] = this.upperTotalRow;
    data['upperTotalColumn'] = this.upperTotalColumn;
    data['verticalLowerTotalRow'] = this.verticalLowerTotalRow;
    data['verticalLowerTotalColumn'] = this.verticalLowerTotalColumn;
    data['verticalUpperTotalRow'] = this.verticalUpperTotalRow;
    data['verticalUpperTotalColumn'] = this.verticalUpperTotalColumn;
    if (this.seating != null) {
      data['Seating'] = this.seating.map((v) => v.toJson()).toList();
    }
    if (this.lower != null) {
      data['lower'] = this.lower.map((v) => v.toJson()).toList();
    }
    if (this.upper != null) {
      data['upper'] = this.upper.map((v) => v.toJson()).toList();
    }
    if (this.verticalLower != null) {
      data['verticalLower'] = this.verticalLower.map((v) => v.toJson()).toList();
    }
    if (this.verticalUpper != null) {
      data['verticalUpper'] = this.verticalUpper.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Seating {
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

  Seating(
      {this.row,
      this.column,
      this.totalFare,
      this.baseFare,
      this.serviceFarePercentage,
      this.serviceFareAmount,
      this.ladiesSeat,
      this.maleSeat,
      this.seatNo,
      this.available});

  Seating.fromJson(Map<String, dynamic> json) {
    row = json['row'];
    column = json['column'];
    totalFare = json['total_fare'];
    baseFare = json['base_fare'];
    serviceFarePercentage = json['service_fare_percentage'];
    serviceFareAmount = json['service_fare_amount'];
    ladiesSeat = json['ladiesSeat'];
    maleSeat = json['maleSeat'];
    seatNo = json['seatNo'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row'] = this.row;
    data['column'] = this.column;
    data['total_fare'] = this.totalFare;
    data['base_fare'] = this.baseFare;
    data['service_fare_percentage'] = this.serviceFarePercentage;
    data['service_fare_amount'] = this.serviceFareAmount;
    data['ladiesSeat'] = this.ladiesSeat;
    data['maleSeat'] = this.maleSeat;
    data['seatNo'] = this.seatNo;
    data['available'] = this.available;
    return data;
  }
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

  Lower(
      {this.row,
      this.column,
      this.totalFare,
      this.baseFare,
      this.serviceFarePercentage,
      this.serviceFareAmount,
      this.ladiesSeat,
      this.maleSeat,
      this.seatNo,
      this.available});

  Lower.fromJson(Map<String, dynamic> json) {
    row = json['row'];
    column = json['column'];
    totalFare = json['total_fare'];
    baseFare = json['base_fare'];
    serviceFarePercentage = json['service_fare_percentage'];
    serviceFareAmount = json['service_fare_amount'];
    ladiesSeat = json['ladiesSeat'];
    maleSeat = json['maleSeat'];
    seatNo = json['seatNo'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row'] = this.row;
    data['column'] = this.column;
    data['total_fare'] = this.totalFare;
    data['base_fare'] = this.baseFare;
    data['service_fare_percentage'] = this.serviceFarePercentage;
    data['service_fare_amount'] = this.serviceFareAmount;
    data['ladiesSeat'] = this.ladiesSeat;
    data['maleSeat'] = this.maleSeat;
    data['seatNo'] = this.seatNo;
    data['available'] = this.available;
    return data;
  }
}

class Upper {
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

  Upper(
      {this.row,
      this.column,
      this.totalFare,
      this.baseFare,
      this.serviceFarePercentage,
      this.serviceFareAmount,
      this.ladiesSeat,
      this.maleSeat,
      this.seatNo,
      this.available});

  Upper.fromJson(Map<String, dynamic> json) {
    row = json['row'];
    column = json['column'];
    totalFare = json['total_fare'];
    baseFare = json['base_fare'];
    serviceFarePercentage = json['service_fare_percentage'];
    serviceFareAmount = json['service_fare_amount'];
    ladiesSeat = json['ladiesSeat'];
    maleSeat = json['maleSeat'];
    seatNo = json['seatNo'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row'] = this.row;
    data['column'] = this.column;
    data['total_fare'] = this.totalFare;
    data['base_fare'] = this.baseFare;
    data['service_fare_percentage'] = this.serviceFarePercentage;
    data['service_fare_amount'] = this.serviceFareAmount;
    data['ladiesSeat'] = this.ladiesSeat;
    data['maleSeat'] = this.maleSeat;
    data['seatNo'] = this.seatNo;
    data['available'] = this.available;
    return data;
  }
}

class VerticalLower {
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

  VerticalLower(
      {this.row,
      this.column,
      this.totalFare,
      this.baseFare,
      this.serviceFarePercentage,
      this.serviceFareAmount,
      this.ladiesSeat,
      this.maleSeat,
      this.seatNo,
      this.available});

  VerticalLower.fromJson(Map<String, dynamic> json) {
    row = json['row'];
    column = json['column'];
    totalFare = json['total_fare'];
    baseFare = json['base_fare'];
    serviceFarePercentage = json['service_fare_percentage'];
    serviceFareAmount = json['service_fare_amount'];
    ladiesSeat = json['ladiesSeat'];
    maleSeat = json['maleSeat'];
    seatNo = json['seatNo'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row'] = this.row;
    data['column'] = this.column;
    data['total_fare'] = this.totalFare;
    data['base_fare'] = this.baseFare;
    data['service_fare_percentage'] = this.serviceFarePercentage;
    data['service_fare_amount'] = this.serviceFareAmount;
    data['ladiesSeat'] = this.ladiesSeat;
    data['maleSeat'] = this.maleSeat;
    data['seatNo'] = this.seatNo;
    data['available'] = this.available;
    return data;
  }
}

class VerticalUpper {
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

  VerticalUpper(
      {this.row,
      this.column,
      this.totalFare,
      this.baseFare,
      this.serviceFarePercentage,
      this.serviceFareAmount,
      this.ladiesSeat,
      this.maleSeat,
      this.seatNo,
      this.available});

  VerticalUpper.fromJson(Map<String, dynamic> json) {
    row = json['row'];
    column = json['column'];
    totalFare = json['total_fare'];
    baseFare = json['base_fare'];
    serviceFarePercentage = json['service_fare_percentage'];
    serviceFareAmount = json['service_fare_amount'];
    ladiesSeat = json['ladiesSeat'];
    maleSeat = json['maleSeat'];
    seatNo = json['seatNo'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['row'] = this.row;
    data['column'] = this.column;
    data['total_fare'] = this.totalFare;
    data['base_fare'] = this.baseFare;
    data['service_fare_percentage'] = this.serviceFarePercentage;
    data['service_fare_amount'] = this.serviceFareAmount;
    data['ladiesSeat'] = this.ladiesSeat;
    data['maleSeat'] = this.maleSeat;
    data['seatNo'] = this.seatNo;
    data['available'] = this.available;
    return data;
  }
}
