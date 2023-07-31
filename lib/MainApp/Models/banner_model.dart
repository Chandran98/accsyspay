// // To parse this JSON data, do
// //
// //     final banners = bannersFromJson(jsonString);

// import 'dart:convert';

// Banners bannersFromJson(String str) => Banners.fromJson(json.decode(str));

// String bannersToJson(Banners data) => json.encode(data.toJson());

// class Banners {
//     String status;
//     Details details;

//     Banners({
//         required this.status,
//         required this.details,
//     });

//     factory Banners.fromJson(Map<String, dynamic> json) => Banners(
//         status: json["status"],
//         details: Details.fromJson(json["details"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "details": details.toJson(),
//     };
// }

// class Details {
//     String banner;
   

//     Details({
//          this.banner,
       
       
//     });

//     factory Details.fromJson(Map<String, dynamic> json) => Details(
//         banner: json["banner"],
        
//     );

//     Map<String, dynamic> toJson() => {
//         "banner": banner,
        
        
//     };
// }
