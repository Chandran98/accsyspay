class BusTicketHistory {
  String status;
  List<Detail> details;

  BusTicketHistory({
   this.status,
   this.details,
  });

  factory BusTicketHistory.fromJson(Map<String, dynamic> json) {
    return BusTicketHistory(
      status: json['status'],
      details: List<Detail>.from(json['details'].map((x) => Detail.fromJson(x))),
    );
  }
}

class Detail {
  String category;
  double amount;
  String orderNo;
  String account;
  double walletAmount;
  double voucherAmount;
  String voucherCode;
  int status;
  String statusDesc;
  String payId;
  String createdAt;

  Detail({
     this.category,
     this.amount,
     this.orderNo,
     this.account,
     this.walletAmount,
     this.voucherAmount,
     this.voucherCode,
     this.status,
     this.statusDesc,
     this.payId,
     this.createdAt,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      category: json['category'],
      amount: json['amount'].toDouble(),
      orderNo: json['order_no'],
      account: json['account'],
      walletAmount: json['wallet_amount'].toDouble(),
      voucherAmount: json['voucher_amount'].toDouble(),
      voucherCode: json['voucher_code'],
      status: json['status'],
      statusDesc: json['status_desc'],
      payId: json['pay_id'],
      createdAt: json['created_at'],
    );
  }
}
