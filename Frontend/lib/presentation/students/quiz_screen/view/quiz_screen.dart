import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:placement_app/core/constants/color_constants.dart';
import 'package:placement_app/presentation/students/quiz_screen/controller/quiz_controller.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  fetchData() {
    Provider.of<QuizController>(context, listen: false).fetchQuiz(context);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 15,right: 15),
            child: Consumer<QuizController>(builder: (context, controller, _) {
              late var percent = ((controller.questionNo / controller.quizModel.data!.length) * 100);
              return controller.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: RoundedProgressBar(
                            style: RoundedProgressBarStyle(
                              widthShadow: 2,
                              borderWidth: 0,
                            ),
                            reverse: true,
                            percent: percent,
                            childLeft: Text("${percent.round()}%"),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${controller.quizModel.data?[controller.questionNo].question}",
                          style: TextStyle(fontSize: size.width * .06, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Container(
                          //color: Colors.blueGrey.shade100,
                          //height: size.width * .8,
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.quizModel.data?[controller.questionNo].options?.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    Provider.of<QuizController>(context, listen: false).checkTapped(index);
                                  },
                                  child: Container(
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 10),
                                    padding: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                        color: controller.tappedIndex == index
                                            ? controller.isCorrect
                                                ? Colors.green
                                                : Colors.red
                                            : Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(10)),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${index + 1}) ${controller.quizModel.data![controller.questionNo].options?[index].text}",
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold, fontSize: size.width * .04),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        InkWell(
                          onTap: () {
                            Provider.of<QuizController>(context, listen: false).nextQuestion(context);
                          },
                          splashColor: Colors.transparent,
                          child: Center(
                            child: Container(
                              height: 50,
                              width: size.width * .5,
                              decoration: BoxDecoration(
                                  color: ColorTheme.primary, borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                  child: Text(
                                "Next",
                                style: TextStyle(color: ColorTheme.white, fontSize: size.width * .05),
                              )),
                            ),
                          ),
                        )
                      ],
                    );
            }),
          ),
        ),
      ),
    );
  }
}
