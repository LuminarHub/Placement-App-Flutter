import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/color_constants.dart';
import '../controller/manage_job_application_controller.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Application"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Consumer<TPOManageJobController>(
                builder: (context, tJControl, child) {
                  return tJControl.tpoManageJobModel.data == null || tJControl.tpoManageJobModel.data!.isEmpty
                      ? Center(
                          child: Text(
                            "No Data Found",
                            style:
                                TextStyle(color: ColorTheme.red, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      : ListView.builder(
                          itemCount: tJControl.tpoManageJobModel.data?.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  left: size.width * .05, right: size.width * .05, bottom: 20),
                              child: Card(
                                color: ColorTheme.background,
                                child: ExpansionTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Name"),
                                          Text("Phone No"),
                                          Text("Email"),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              ":${tJControl.tpoManageJobModel.data?[index].student?.firstName} ${tJControl.tpoManageJobModel.data?[index].student?.lastName}"),
                                          Text(
                                              ":${tJControl.tpoManageJobModel.data?[index].student?.phoneNo}"),
                                          Text(
                                              ":${tJControl.tpoManageJobModel.data?[index].student?.emailAddress}"),
                                        ],
                                      )
                                    ],
                                  ),
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Job title'),
                                            Text('Description'),
                                            Text('Requirement'),
                                            Text('Salary'),
                                            Text('Last date'),
                                            Text("Location"),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text("Applied Data"),
                                            Text("Status"),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  ":${tJControl.tpoManageJobModel.data?[index].job?.position}"),
                                              Text(
                                                  ":${tJControl.tpoManageJobModel.data?[index].job?.description}",
                                                  overflow: TextOverflow.ellipsis),
                                              Text(
                                                  ":${tJControl.tpoManageJobModel.data?[index].job?.requirements}",
                                                  overflow: TextOverflow.ellipsis),
                                              Text(
                                                  ":${tJControl.tpoManageJobModel.data?[index].job?.salary}"),
                                              Text(
                                                  ":${tJControl.tpoManageJobModel.data?[index].job?.deadline}"),
                                              Text(
                                                  ":${tJControl.tpoManageJobModel.data?[index].job?.location}"),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  ":${tJControl.tpoManageJobModel.data?[index].appliedDate}"),
                                              Text(
                                                ": ${tJControl.tpoManageJobModel.data?[index].status}",
                                                style:
                                                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            Provider.of<TPOManageJobController>(context, listen: false)
                                                .onReject(context,
                                                    id: tJControl.tpoManageJobModel.data?[index].id);
                                            Timer(Duration(seconds: 4), () {
                                              setState(() {
                                                fetchData();
                                              });
                                            });
                                          },
                                          icon: Center(
                                            child: Icon(Icons.cancel_rounded, color: Colors.red),
                                          ),
                                          label: Text(''),
                                        ),
                                        // Text(" Schedule Interview"),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            Provider.of<TPOManageJobController>(context, listen: false)
                                                .onApprove(context,
                                                    id: tJControl.tpoManageJobModel.data?[index].id);
                                            Timer(Duration(seconds: 4), () {
                                              setState(() {
                                                fetchData();
                                              });
                                            });
                                          },
                                          icon: Center(
                                            child: Icon(Icons.check, color: Colors.green),
                                          ),
                                          label: Text(''),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                },
              );
            }
          }),
    );
  }

  fetchData() {
    Provider.of<TPOManageJobController>(context, listen: false).fetchJobData(context);
  }
}
