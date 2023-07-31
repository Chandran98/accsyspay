class TicketPrintModal {
  final String status;
  final Message message;

  TicketPrintModal({ this.status,  this.message});

  factory TicketPrintModal.fromJson(Map<String, dynamic> json) {
    return TicketPrintModal(
      status: json['status'],
      message: Message.fromJson(json['message']),
    );
  }
}

class Message {
  final String bookingFee;
  final String busType;
  final String cancellationCalculationTimestamp;
  final String cancellationMessage;
  final String cancellationPolicy;
  final String dateOfIssue;
  final String destinationCity;
  final String destinationCityId;
  final String doj;
  final String dropLocation;
  final String dropLocationId;
  final String dropTime;
  final String firstBoardingPointTime;
  final String hasRTCBreakup;
  final String hasSpecialTemplate;
  final String inventoryId;
  final dynamic inventoryItems; // Can be either List or Map
  final String mTicketEnabled;
  final String partialCancellationAllowed;
  final String pickUpContactNo;
  final String pickUpLocationAddress;
  final String pickupLocation;
  final String pickupLocationId;
  final String pickupLocationLandmark;
  final String pickupTime;
  final String pnr;
  final String primeDepartureTime;
  final String primoBooking;
  final ReschedulingPolicy reschedulingPolicy;
  final String serviceCharge;
  final String sourceCity;
  final String sourceCityId;
  final String status;
  final String tin;
  final String travels;
  final String vaccinatedBus;
  final String vaccinatedStaff;

  Message({
     this.bookingFee,
     this.busType,
     this.cancellationCalculationTimestamp,
     this.cancellationMessage,
     this.cancellationPolicy,
     this.dateOfIssue,
     this.destinationCity,
     this.destinationCityId,
     this.doj,
     this.dropLocation,
     this.dropLocationId,
     this.dropTime,
     this.firstBoardingPointTime,
     this.hasRTCBreakup,
     this.hasSpecialTemplate,
     this.inventoryId,
     this.inventoryItems,
     this.mTicketEnabled,
     this.partialCancellationAllowed,
     this.pickUpContactNo,
     this.pickUpLocationAddress,
     this.pickupLocation,
     this.pickupLocationId,
     this.pickupLocationLandmark,
     this.pickupTime,
     this.pnr,
     this.primeDepartureTime,
     this.primoBooking,
     this.reschedulingPolicy,
     this.serviceCharge,
     this.sourceCity,
     this.sourceCityId,
     this.status,
     this.tin,
     this.travels,
     this.vaccinatedBus,
     this.vaccinatedStaff,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    dynamic inventoryItems = json['inventoryItems'];
    if (inventoryItems is List) {
      inventoryItems = inventoryItems.map((item) => InventoryItem.fromJson(item)).toList();
    } else if (inventoryItems is Map) {
      inventoryItems = InventoryItem.fromJson(inventoryItems);
    }

    return Message(
      bookingFee: json['bookingFee'],
      busType: json['busType'],
      cancellationCalculationTimestamp: json['cancellationCalculationTimestamp'],
      cancellationMessage: json['cancellationMessage'],
      cancellationPolicy: json['cancellationPolicy'],
      dateOfIssue: json['dateOfIssue'],
      destinationCity: json['destinationCity'],
      destinationCityId: json['destinationCityId'],
      doj: json['doj'],
      dropLocation: json['dropLocation'],
      dropLocationId: json['dropLocationId'],
      dropTime: json['dropTime'],
      firstBoardingPointTime: json['firstBoardingPointTime'],
      hasRTCBreakup: json['hasRTCBreakup'],
      hasSpecialTemplate: json['hasSpecialTemplate'],
      inventoryId: json['inventoryId'],
      inventoryItems: inventoryItems,
      mTicketEnabled: json['MTicketEnabled'],
      partialCancellationAllowed: json['partialCancellationAllowed'],
      pickUpContactNo: json['pickUpContactNo'],
      pickUpLocationAddress: json['pickUpLocationAddress'],
      pickupLocation: json['pickupLocation'],
      pickupLocationId: json['pickupLocationId'],
      pickupLocationLandmark: json['pickupLocationLandmark'],
      pickupTime: json['pickupTime'],
      pnr: json['pnr'],
      primeDepartureTime: json['primeDepartureTime'],
      primoBooking: json['primoBooking'],
      reschedulingPolicy: ReschedulingPolicy.fromJson(json['reschedulingPolicy']),
      serviceCharge: json['serviceCharge'],
      sourceCity: json['sourceCity'],
      sourceCityId: json['sourceCityId'],
      status: json['status'],
      tin: json['tin'],
      travels: json['travels'],
      vaccinatedBus: json['vaccinatedBus'],
      vaccinatedStaff: json['vaccinatedStaff'],
    );
  }
}

class InventoryItem {
  final String baseFare;
  final String fare;
  final String ladiesSeat;
  final String malesSeat;
  final String operatorServiceCharge;
  final Passenger passenger;
  final String seatName;
  final String serviceTax;

  InventoryItem({
     this.baseFare,
     this.fare,
     this.ladiesSeat,
     this.malesSeat,
     this.operatorServiceCharge,
     this.passenger,
     this.seatName,
     this.serviceTax,
  });

  factory InventoryItem.fromJson(Map<String, dynamic> json) {
    return InventoryItem(
      baseFare: json['baseFare'],
      fare: json['fare'],
      ladiesSeat: json['ladiesSeat'],
      malesSeat: json['malesSeat'],
      operatorServiceCharge: json['operatorServiceCharge'],
      passenger: Passenger.fromJson(json['passenger']),
      seatName: json['seatName'],
      serviceTax: json['serviceTax'],
    );
  }
}

class Passenger {
  final String address;
  final String age;
  final String email;
  final String gender;
  final String idNumber;
  final String idType;
  final String mobile;
  final String name;
  final String primary;
  final String singleLadies;
  final String title;

  Passenger({
     this.address,
     this.age,
     this.email,
     this.gender,
     this.idNumber,
     this.idType,
     this.mobile,
     this.name,
     this.primary,
     this.singleLadies,
     this.title,
  });

  factory Passenger.fromJson(Map<String, dynamic> json) {
    return Passenger(
      address: json['address'],
      age: json['age'],
      email: json['email'],
      gender: json['gender'],
      idNumber: json['idNumber'],
      idType: json['idType'],
      mobile: json['mobile'],
      name: json['name'],
      primary: json['primary'],
      singleLadies: json['singleLadies'],
      title: json['title'],
    );
  }
}

class ReschedulingPolicy {
  final String reschedulingCharge;
  final String windowTime;

  ReschedulingPolicy({ this.reschedulingCharge,  this.windowTime});

  factory ReschedulingPolicy.fromJson(Map<String, dynamic> json) {
    return ReschedulingPolicy(
      reschedulingCharge: json['reschedulingCharge'],
      windowTime: json['windowTime'],
    );
  }
}
