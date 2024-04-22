import 'dart:developer';

import 'package:placement_app/repository/helper/api_helper.dart';

class QuizService {
  static Future<dynamic> fetchData() async {
    log("QuizService -> fetchData()");
    try {
      var decodedData = await ApiHelper.getQuiz();
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
