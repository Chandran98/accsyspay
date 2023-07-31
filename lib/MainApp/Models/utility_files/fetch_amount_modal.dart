class FetchBillModal {
  final String status;
  final CustomerDetails details;
  
  FetchBillModal({ this.status,  this.details});
  
  factory FetchBillModal.fromJson(Map<String, dynamic> json) {
    return FetchBillModal(
      status: json['status'],
      details: CustomerDetails.fromJson(json['details']),
    );
  }
}

class CustomerDetails {
  final String responseCode;
  final String responseMessage;
  final String transactionId;
  final String customerName;
  final String billNumber;
  final String billPeriod;
  final String billDate;
  final String billDueDate;
  final String billAmount;
  final List<CustomerParamDetails> customerParamsDetails;
  final List<BillDetails> billDetails;
  final List<AdditionalDetails> additionalDetails;
  
  CustomerDetails({
     this.responseCode,
     this.responseMessage,
     this.transactionId,
     this.customerName,
     this.billNumber,
     this.billPeriod,
     this.billDate,
     this.billDueDate,
     this.billAmount,
     this.customerParamsDetails,
     this.billDetails,
     this.additionalDetails,
  });
  
  factory CustomerDetails.fromJson(Map<String, dynamic> json) {
    return CustomerDetails(
      responseCode: json['ResponseCode'],
      responseMessage: json['ResponseMessage'],
      transactionId: json['TransactionId'],
      customerName: json['CustomerName'],
      billNumber: json['BillNumber'],
      billPeriod: json['BillPeriod'],
      billDate: json['BillDate'],
      billDueDate: json['BillDueDate'],
      billAmount: json['BillAmount'],
      customerParamsDetails: List<CustomerParamDetails>.from(
        json['CustomerParamsDetails'].map(
          (paramJson) => CustomerParamDetails.fromJson(paramJson)
        )
      ),
      // billDetails: List<BillDetails>.from(
      //   json['BillDetails'].map(
      //     (billJson) => BillDetails.fromJson(billJson)
      //   )
      // ),
      additionalDetails: List<AdditionalDetails>.from(
        json['AdditionalDetails'].map(
          (detailJson) => AdditionalDetails.fromJson(detailJson)
        )
      ),
    );
  }
}

class CustomerParamDetails {
  final String name;
  final String value;
  
  CustomerParamDetails({ this.name,  this.value});
  
  factory CustomerParamDetails.fromJson(Map<String, dynamic> json) {
    return CustomerParamDetails(
      name: json['Name'],
      value: json['Value'],
    );
  }
}

class BillDetails {
}

class AdditionalDetails {
  final String name;
  final String value;
  
  AdditionalDetails({ this.name,  this.value});
  
  factory AdditionalDetails.fromJson(Map<String, dynamic> json) {
    return AdditionalDetails(
      name: json['Name'],
      value: json['Value'],
    );
  }
}
