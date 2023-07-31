
class ModalResponse {
  String status;
  List<Modal> details;

  ModalResponse({
     this.status,
     this.details,
  });

  factory ModalResponse.fromJson(Map<String, dynamic> json) {
    // final Map<String, dynamic> jsonMap = json.decode(jsonString);

    var list = json['details'] as List;
    List<Modal> detailsList =
        list.map((i) => Modal.fromJson(i)).toList();
    return ModalResponse(
      status: json['status'] as String,
      details: detailsList,
    );
  }
}



class Modal {
  String name;
  int minLength;
  int maxLength;
  String fieldType;
  bool isMandatory;
  String regex;

  Modal({
     this.name,
     this.minLength,
     this.maxLength,
     this.fieldType,
     this.isMandatory,
     this.regex,
  });

  factory Modal.fromJson(Map<String, dynamic> json) {
    return Modal(
      name: json['name'] as String,
      minLength: json['MinLength'] as int,
      maxLength: json['MaxLength'] as int,
      fieldType: json['FieldType'] as String,
      isMandatory: json['IsMandatory'] as bool,
      regex: json['Regex'] as String,
    );
  }

  // static List<Modal> fromJsonArray(List<dynamic> jsonArray) {
  //   return jsonArray.map((json) => Modal.fromJson(json)).toList();
  // }
}
