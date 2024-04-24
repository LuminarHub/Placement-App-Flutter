import 'package:flutter/material.dart';
import 'package:placement_app/core/constants/color_constants.dart';
import 'package:placement_app/presentation/tpo/student_screen/view/widget/title_name.dart';
import 'package:provider/provider.dart';

import '../../controller/tpo_manage_student_controller.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({super.key, required this.id});

  final String id;

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  fetchData() {
    Provider.of<TPOManageStudentController>(context, listen: false).fetchStudentDetails(context, widget.id);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TPOManageStudentController>(builder: (context, controller, _) {
      return controller.isLoadingSD
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: AppBar(
                backgroundColor: ColorTheme.white,
                title: Text("Student ID : ${controller.studentDetailsModel.data?.id}"),
                centerTitle: true,
              ),
              backgroundColor: ColorTheme.white,
              body: SingleChildScrollView(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TitleName(
                            title: 'First Name', name: '${controller.studentDetailsModel.data?.firstName}'),
                        SizedBox(width: 20),
                        TitleName(
                            title: "Last Name", name: "${controller.studentDetailsModel.data?.lastName}"),
                      ],
                    ),
                    TitleName(title: "Username", name: "${controller.studentDetailsModel.data?.username}"),
                    TitleName(title: "Phone", name: "${controller.studentDetailsModel.data?.phoneNo}"),
                    TitleName(title: "Email", name: "${controller.studentDetailsModel.data?.emailAddress}")
                  ],
                ),
              ),
            );
    });
  }
}
