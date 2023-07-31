class FetchBillerModal {
  String status;
  List<FetchBillerDetails> details;

  FetchBillerModal({this.status, this.details});

  factory FetchBillerModal.fromJson(Map<String, dynamic> json) {
    var list = json['details'] as List;
    List<FetchBillerDetails> detailsList =
        list.map((i) => FetchBillerDetails.fromJson(i)).toList();

    return FetchBillerModal(
      status: json['status'] as String,
      details: detailsList,
    );
  }
}

class FetchBillerDetails {
  int id;
  int billerCategory;
  String billerCategoryDesc;
  String billerMode;
  String billerId;
  String billerName;
  bool acceptAdHocPayment;
  String paymentAmtExactness;

  FetchBillerDetails(
      {this.id,
      this.billerCategory,
      this.billerCategoryDesc,
      this.billerMode,
      this.billerId,
      this.billerName,
      this.acceptAdHocPayment,
      this.paymentAmtExactness});

  factory FetchBillerDetails.fromJson(Map<String, dynamic> json) {
    return FetchBillerDetails(
      id: json['Id'] as int,
      billerCategory: json['BillerCategory'] as int,
      billerCategoryDesc: json['BillerCategoryDesc'] as String,
      billerMode: json['BillerMode'] as String,
      billerId: json['BillerId'] as String,
      billerName: json['BillerName'] as String,
      acceptAdHocPayment: json['AcceptAdHocPayment'] as bool,
      paymentAmtExactness: json['PaymentAmtExactness'] as String,
    );
  }
}


class Biller {
  final int id;
  final int billerCategory;
  final String billerCategoryDesc;
  final String billerMode;
  final String billerId;
  final String billerName;
  final bool acceptAdHocPayment;
  final String paymentAmtExactness;

  Biller({
    this.id,
    this.billerCategory,
    this.billerCategoryDesc,
    this.billerMode,
    this.billerId,
    this.billerName,
    this.acceptAdHocPayment,
    this.paymentAmtExactness,
  });

  factory Biller.fromJson(Map<String, dynamic> json) {
    return Biller(
      id: json['Id'],
      billerCategory: json['BillerCategory'],
      billerCategoryDesc: json['BillerCategoryDesc'],
      billerMode: json['BillerMode'],
      billerId: json['BillerId'],
      billerName: json['BillerName'],
      acceptAdHocPayment: json['AcceptAdHocPayment'],
      paymentAmtExactness: json['PaymentAmtExactness'],
    );
  }
}