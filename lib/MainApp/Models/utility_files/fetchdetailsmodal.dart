class DummyModal {
  String status;
  Details details;

  DummyModal({ this.status,  this.details});

  factory DummyModal.fromJson(Map<String, dynamic> json) {
    return DummyModal(
      status: json['status'],
      details: Details.fromJson(json['details']),
    );
  }
}

class Details {
  String responseCode;
  String responseMessage;
  String transactionId;
  String customerName;
  String billNumber;
  String billPeriod;
  String billDate;
  String billDueDate;
  String billAmount;
  // List<CustomerParamsDetails> customerParamsDetails;
  // List<dynamic> billDetails;
  // List<dynamic> additionalDetails;

  Details({
     this.responseCode,
     this.responseMessage,
     this.transactionId,
     this.customerName,
     this.billNumber,
     this.billPeriod,
     this.billDate,
     this.billDueDate,
     this.billAmount,
    //  this.customerParamsDetails,
    //  this.billDetails,
    //  this.additionalDetails,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      responseCode: json['ResponseCode'],
      responseMessage: json['ResponseMessage'],
      transactionId: json['TransactionId'],
      customerName: json['CustomerName'],
      billNumber: json['BillNumber'],
      billPeriod: json['BillPeriod'],
      billDate: json['BillDate'],
      billDueDate: json['BillDueDate'],
      billAmount: json['BillAmount']);
    //   customerParamsDetails: (json['CustomerParamsDetails'] as List<dynamic>)
    //       .map((e) => CustomerParamsDetails.fromJson(e))
    //       .toList(),
    //   billDetails: json['BillDetails'] as List<dynamic>,
    //   additionalDetails: json['AdditionalDetails'] as List<dynamic>,
    // );
  }
}

// class CustomerParamsDetails {
//   String name;
//   String value;

//   CustomerParamsDetails({required this.name, required this.value});

//   factory CustomerParamsDetails.fromJson(Map<String, dynamic> json) {
//     return CustomerParamsDetails(
//       name: json['Name'],
//       value: json['Value'],
//     );
//   }
// }
