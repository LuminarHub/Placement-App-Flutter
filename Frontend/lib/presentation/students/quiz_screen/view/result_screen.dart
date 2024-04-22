import 'package:flutter/material.dart';
import 'package:placement_app/presentation/students/bottom_navigation_screen/view/student_bottom_navigation_screen.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.correctAns, required this.totalQst});

  final int correctAns;
  final int totalQst;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  var totalResult;
  var isPass;

  @override
  void initState() {
    totalResult = ((widget.correctAns / widget.totalQst) * 100);
    if (totalResult > 50) {
      isPass = true;
    } else {
      isPass = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${totalResult}% Score",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: isPass ? Colors.green : Colors.red,
            ),
          ),
          Text("Quiz Completed"),
          SizedBox(height: 5),
          Text(
            "You attempted ${widget.totalQst} Questions and \nout of that ${widget.correctAns} answer is correct.",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => StudentBottomNavigationScreen()), (route) => false);
            },
            child: Center(
              child: Text(
                "Try again",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
