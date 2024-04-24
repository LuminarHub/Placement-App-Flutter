// To parse this JSON data, do
//
//     final tpoManageJobModel = tpoManageJobModelFromJson(jsonString);

import 'dart:convert';

TpoManageJobModel tpoManageJobModelFromJson(String str) => TpoManageJobModel.fromJson(json.decode(str));

String tpoManageJobModelToJson(TpoManageJobModel data) => json.encode(data.toJson());

class TpoManageJobModel {
  int? status;
  List<Datum>? data;

  TpoManageJobModel({
    this.status,
    this.data,
  });

  factory TpoManageJobModel.fromJson(Map<String, dynamic> json) => TpoManageJobModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  Student? student;
  Job? job;
  DateTime? appliedDate;
  String? status;

  Datum({
    this.id,
    this.student,
    this.job,
    this.appliedDate,
    this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    student: json["student"] == null ? null : Student.fromJson(json["student"]),
    job: json["job"] == null ? null : Job.fromJson(json["job"]),
    appliedDate: json["applied_date"] == null ? null : DateTime.parse(json["applied_date"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "student": student?.toJson(),
    "job": job?.toJson(),
    "applied_date": appliedDate?.toIso8601String(),
    "status": status,
  };
}

class Job {
  int? id;
  String? postedBy;
  String? position;
  String? description;
  String? requirements;
  String? location;
  String? salary;
  DateTime? postedDate;
  String? deadline;

  Job({
    this.id,
    this.postedBy,
    this.position,
    this.description,
    this.requirements,
    this.location,
    this.salary,
    this.postedDate,
    this.deadline,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json["id"],
    postedBy: json["posted_by"],
    position: json["position"],
    description: json["description"],
    requirements: json["requirements"],
    location: json["location"],
    salary: json["salary"],
    postedDate: json["posted_date"] == null ? null : DateTime.parse(json["posted_date"]),
    deadline: json["deadline"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "posted_by": postedBy,
    "position": position,
    "description": description,
    "requirements": requirements,
    "location": location,
    "salary": salary,
    "posted_date": postedDate?.toIso8601String(),
    "deadline": deadline,
  };
}

class Student {
  String? id;
  String? firstName;
  String? lastName;
  String? phoneNo;
  String? emailAddress;
  String? username;

  Student({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNo,
    this.emailAddress,
    this.username,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
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
