// To parse this JSON data, do
//
//     final companyDetailsModel = companyDetailsModelFromJson(jsonString);

import 'dart:convert';

CompanyDetailsModel companyDetailsModelFromJson(String str) => CompanyDetailsModel.fromJson(json.decode(str));

String companyDetailsModelToJson(CompanyDetailsModel data) => json.encode(data.toJson());

class CompanyDetailsModel {
  int? status;
  Data? data;

  CompanyDetailsModel({
    this.status,
    this.data,
  });

  factory CompanyDetailsModel.fromJson(Map<String, dynamic> json) => CompanyDetailsModel(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };
}

class Data {
  Company? company;
  List<Job>? jobs;

  Data({
    this.company,
    this.jobs,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    company: json["company"] == null ? null : Company.fromJson(json["company"]),
    jobs: json["jobs"] == null ? [] : List<Job>.from(json["jobs"]!.map((x) => Job.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "company": company?.toJson(),
    "jobs": jobs == null ? [] : List<dynamic>.from(jobs!.map((x) => x.toJson())),
  };
}

class Company {
  String? id;
  String? name;
  String? description;
  String? industry;
  String? emailAddress;
  String? phoneNo;
  String? headquarters;
  int? founded;
  String? logo;
  String? website;
  String? username;

  Company({
    this.id,
    this.name,
    this.description,
    this.industry,
    this.emailAddress,
    this.phoneNo,
    this.headquarters,
    this.founded,
    this.logo,
    this.website,
    this.username,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    industry: json["industry"],
    emailAddress: json["email_address"],
    phoneNo: json["phone_no"],
    headquarters: json["Headquarters"],
    founded: json["founded"],
    logo: json["logo"],
    website: json["website"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "industry": industry,
    "email_address": emailAddress,
    "phone_no": phoneNo,
    "Headquarters": headquarters,
    "founded": founded,
    "logo": logo,
    "website": website,
    "username": username,
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
