// To parse this JSON data, do
//
//     final quizModel = quizModelFromJson(jsonString);

import 'dart:convert';

QuizModel quizModelFromJson(String str) => QuizModel.fromJson(json.decode(str));

String quizModelToJson(QuizModel data) => json.encode(data.toJson());

class QuizModel {
  int? status;
  List<Datum>? data;

  QuizModel({
    this.status,
    this.data,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? question;
  List<Option>? options;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.question,
    this.options,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    question: json["question"],
    options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "question": question,
    "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Option {
  String? text;
  bool? isCorrect;
  String? id;

  Option({
    this.text,
    this.isCorrect,
    this.id,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    text: json["text"],
    isCorrect: json["isCorrect"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "isCorrect": isCorrect,
    "_id": id,
  };
}
