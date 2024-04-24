// To parse this JSON data, do
//
//     final studentDetailsModel = studentDetailsModelFromJson(jsonString);

import 'dart:convert';

StudentDetailsModel studentDetailsModelFromJson(String str) => StudentDetailsModel.fromJson(json.decode(str));

String studentDetailsModelToJson(StudentDetailsModel data) => json.encode(data.toJson());

class StudentDetailsModel {
  int? status;
  Data? data;

  StudentDetailsModel({
    this.status,
    this.data,
  });

  factory StudentDetailsModel.fromJson(Map<String, dynamic> json) => StudentDetailsModel(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };
}

class Data {
  String? id;
  String? firstName;
  String? lastName;
  String? phoneNo;
  String? emailAddress;
  String? username;

  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNo,
    this.emailAddress,
    this.username,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    firstName: json["First_name"],
    lastName: json["Last_name"],
    phoneNo: json["phone_no"],
    emailAddress: json["email_address"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "First_name": firstName,
    "Last_name": lastName,
    "phone_no": phoneNo,
    "email_address": emailAddress,
    "username": username,
  };
}
