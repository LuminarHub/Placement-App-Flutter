import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:placement_app/core/constants/color_constants.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: RoundedProgressBar(),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "This is the Question",
                    style: TextStyle(fontSize: size.width * .06,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    //color: Colors.blueGrey.shade100,
                    //height: size.width * .8,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {},
                            child: Container(
                              height: 50,
                              margin: EdgeInsets.only(bottom: 10),
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: Colors.green.shade100, borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              child: Text(
                                "Option ${index + 1}",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.width * .04),
                              ),
                            ),
                          );
                        }),
                  ),
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,
                    child: Center(
                      child: Container(
                        height: 50,
                        width: size.width * .5,
                        decoration:
                            BoxDecoration(color: ColorTheme.primary, borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Text(
                          "Next",
                          style: TextStyle(color: ColorTheme.white, fontSize: size.width * .05),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
