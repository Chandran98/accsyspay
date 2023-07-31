// ignore_for_file: unnecessary_new, unnecessary_this

class PostpaidBillModal {
  String status;
  Details details;

  PostpaidBillModal({this.status, this.details});

  PostpaidBillModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
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

class Details {
  int responseCode;
  bool status;
  String amount;
  String name;
  String dueDate;
  String billDate;
  BillFetch billFetch;
  String message;

  Details(
      {this.responseCode,
      this.status,
      this.amount,
      this.name,
      this.dueDate,
      this.billDate,
      this.billFetch,
      this.message});

  Details.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    status = json['status'];
    amount = json['amount'];
    name = json['name'];
    dueDate = json['duedate'];
    billDate = json['billdate'];
    billFetch =
        json['bill_fetch'] != null ? new BillFetch.fromJson(json['bill_fetch']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = this.responseCode;
    data['status'] = this.status;
    data['amount'] = this.amount;
    data['name'] = this.name;
    data['duedate'] = this.dueDate;
    data['billdate'] = this.billDate;
    if (this.billFetch != null) {
      data['bill_fetch'] = this.billFetch.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class BillFetch {
  String billAmount;
  String billNetAmount;
  String billDate;
  String dueDate;
  bool acceptPayment;
  bool acceptPartPay;
  String cellNumber;
  String userName;

  BillFetch(
      {this.billAmount,
      this.billNetAmount,
      this.billDate,
      this.dueDate,
      this.acceptPayment,
      this.acceptPartPay,
      this.cellNumber,
      this.userName});

  BillFetch.fromJson(Map<String, dynamic> json) {
    billAmount = json['billAmount'];
    billNetAmount = json['billnetamount'];
    billDate = json['billdate'];
    dueDate = json['dueDate'];
    acceptPayment = json['acceptPayment'];
    acceptPartPay = json['acceptPartPay'];
    cellNumber = json['cellNumber'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['billAmount'] = this.billAmount;
    data['billnetamount'] = this.billNetAmount;
    data['billdate'] = this.billDate;
    data['dueDate'] = this.dueDate;
    data['acceptPayment'] = this.acceptPayment;
    data['acceptPartPay'] = this.acceptPartPay;
    data['cellNumber'] = this.cellNumber;
    data['userName'] = this.userName;
    return data;
  }
}
