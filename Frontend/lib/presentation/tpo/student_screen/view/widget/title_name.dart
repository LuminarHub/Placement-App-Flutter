import 'package:flutter/material.dart';

import '../../../../../core/constants/color_constants.dart';

class TitleName extends StatelessWidget {
  const TitleName({
    super.key,
    required this.title,
    required this.name,
  });

  final String title;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title",
            style: TextStyle(fontSize: 18, color: ColorTheme.text),
          ),
          Text(
            "$name",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          //SizedBox(height: 10)
        ],
      ),
    );
  }
}
