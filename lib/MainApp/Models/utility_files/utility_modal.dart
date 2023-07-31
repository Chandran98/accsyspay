
class UtilityOperatorModal {
  String status;
  List<Details> details;

  UtilityOperatorModal({this.status, this.details});

  factory UtilityOperatorModal.fromJson(Map<String, dynamic> json) {
    return UtilityOperatorModal(
      status: json['status'],
      details: List<Details>.from(
        json['details'].map(
          (details) => Details.fromJson(details),
        ),
      ),
    );
  }
}

class Details {
  String operatorName;
  String operatorId;
  String logo;

  Details({
    this.operatorName,
    this.operatorId,
    this.logo,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      operatorName: json['operator'],
      operatorId: json['operatorId'],
      logo: json['logo'],
    );
  }
}
