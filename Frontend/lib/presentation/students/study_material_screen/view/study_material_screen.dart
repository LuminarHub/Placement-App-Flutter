import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/constants/color_constants.dart';

class StudyMaterialScreen extends StatefulWidget {
  const StudyMaterialScreen({super.key});

  @override
  State<StudyMaterialScreen> createState() => _StudyMaterialScreenState();
}

class _StudyMaterialScreenState extends State<StudyMaterialScreen> {
  final List<String> _title = ["Flutter", "Django", "MERN Stack", "Data Science", "Software Testing"];

  final List<YoutubePlayerController> _controllers = [
    'uMf1Y9VtgNk',
    'C1OfG7IK5jo',
    'j6jWMxlquEI',
    'tTAieUcNHdY',
    'Zkeqvl8cxGc',
  ]
      .map<YoutubePlayerController>(
        (videoId) => YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Study Material"),
        centerTitle: true,
      ),
      // body: ListView.builder(
      //     itemCount: _title.length,
      //     itemBuilder: (context, index) {
      //       return Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(_title[index],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      //           YoutubePlayer(
      //             controller: _controllers[index],
      //             showVideoProgressIndicator: true,
      //             progressIndicatorColor: Colors.amber,
      //             progressColors: ProgressBarColors(
      //               playedColor: ColorTheme.red,
      //               handleColor: ColorTheme.red,
      //             ),
      //           ),
      //         ],
      //       );
      //     }),
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
              itemCount: _title.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(left: 10,right: 10,bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_title[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      YoutubePlayer(
                        controller: _controllers[index],
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Colors.amber,
                        progressColors: ProgressBarColors(
                          playedColor: ColorTheme.red,
                          handleColor: ColorTheme.red,
                        ),
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
