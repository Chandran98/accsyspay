class PrepaidPlanOfferModal {
  String status;
  List<Details> details;

  PrepaidPlanOfferModal({this.status, this.details});

  factory PrepaidPlanOfferModal.fromJson(Map<String, dynamic> json) {
    return PrepaidPlanOfferModal(
      status: json['status'],
      details:
          List<Details>.from(json['details'].map((x) => Details.fromJson(x))),
    );
  }
}

class Details {
  String rs;
  String desc;

  Details({this.rs, this.desc});

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      rs: json['rs'],
      desc: json['desc'],
    );
  }
}
