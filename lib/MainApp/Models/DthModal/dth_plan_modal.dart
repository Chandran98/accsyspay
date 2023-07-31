class DthPlanModal {
  String status;
  List<Pack> details;

  DthPlanModal({ this.status,  this.details});

  factory DthPlanModal.fromJson(Map<String, dynamic> json) {
    return DthPlanModal(
      status: json['status'],
      details: List<Pack>.from(json['details'].map((x) => Pack.fromJson(x))),
    );
  }
}

class Pack {
  String packname;
  String plantype;
  String description;
  String amount;
  String validity;

  Pack({
     this.packname,
     this.plantype,
     this.description,
     this.amount,
     this.validity,
  });

  factory Pack.fromJson(Map<String, dynamic> json) {
    return Pack(
      packname: json['packname'],
      plantype: json['plantype'],
      description: json['description'],
      amount: json['amount'],
      validity: json['validity'],
    );
  }
}
