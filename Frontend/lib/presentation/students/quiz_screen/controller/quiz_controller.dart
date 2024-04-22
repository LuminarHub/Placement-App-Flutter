import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/presentation/students/quiz_screen/view/result_screen.dart';
import 'package:placement_app/repository/api/student/quiz_screen/model/quiz_model.dart';
import 'package:placement_app/repository/api/student/quiz_screen/service/quiz_service.dart';

class QuizController extends ChangeNotifier {
  QuizModel quizModel = QuizModel();
  bool isLoading = false;

  //List<dynamic>? quizList;
  int questionNo = 0;
  bool isCorrect = false;
  int? tappedIndex;
  bool isTapped = false;
  int result = 0;

  fetchQuiz(context) {
    isLoading = true;
    notifyListeners();
    log("QuizController -> fetchData()");
    QuizService.fetchData().then((value) {
      if (value["status"] == 1) {
        quizModel = QuizModel.fromJson(value);
        isLoading = false;
      } else {
        AppUtils.oneTimeSnackBar("error", context: context);
      }
      notifyListeners();
    });
  }

  checkTapped(int index) {
    if (isTapped == false) {
      isCorrect = quizModel.data?[questionNo].options?[index].isCorrect ?? false;
      tappedIndex = index;
      isTapped = true;
      notifyListeners();
    }
  }

  nextQuestion(BuildContext context) {
    if (quizModel.data?[questionNo].options?[tappedIndex!].isCorrect == true) {
      result++;
      log("result is $result");
      notifyListeners();
    }
    if (questionNo != 4) {
      questionNo++;
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ResultScreen(correctAns: result, totalQst: quizModel.data!.length)));
      questionNo = 0;
    }
    tappedIndex = null;
    isTapped = false;
    notifyListeners();
  }
}
