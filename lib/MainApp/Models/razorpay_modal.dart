class PaymentResponse {
  final String status;
  final String message;
  final PaymentDetails details;

  PaymentResponse({
     this.status,
     this.message,
     this.details,
  });

  factory PaymentResponse.fromJson(Map<String, dynamic> json) {
    return PaymentResponse(
      status: json['status'],
      message: json['message'],
      details: PaymentDetails.fromJson(json['details']),
    );
  }
}

class PaymentDetails {
  final String vpa;
  final String amount;
  final String utr;

  PaymentDetails({
     this.vpa,
     this.amount,
     this.utr,
  });

  factory PaymentDetails.fromJson(Map<String, dynamic> json) {
    return PaymentDetails(
      vpa: json['vpa'],
      amount: json['amount'],
      utr: json['utr'],
    );
  }
}
