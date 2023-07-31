class TransactionHistoryModel {
 final String status;
 final List<Detail> details;

  TransactionHistoryModel({this.status, this.details});

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) {
    var detailsList = json['details'] as List;
    List<Detail> details = detailsList.map((i) => Detail.fromJson(i)).toList();
    return TransactionHistoryModel(
      status: json['status'],
      details: details,
    );
  }
}

class Detail {
 final String category;
 final num amount;
 final String orderNo;
 final String account;
 final num walletAmount;
 final num voucherAmount;
 final String voucherCode;
 final num status;
 final String statusDesc;
 final String payId;
 final String createdAt;

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
      amount: json['amount'],
      orderNo: json['order_no'],
      account: json['account'],
      walletAmount: json['wallet_amount'],
      voucherAmount: json['voucher_amount'],
      voucherCode: json['voucher_code'],
      status: json['status'],
      statusDesc: json['status_desc'],
      payId: json['pay_id'],
      createdAt: json['created_at'],
    );
  }
}
