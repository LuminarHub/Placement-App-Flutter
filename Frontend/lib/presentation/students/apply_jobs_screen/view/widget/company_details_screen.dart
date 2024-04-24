import 'package:flutter/material.dart';
import 'package:placement_app/config/app_config.dart';
import 'package:placement_app/core/constants/global_text_styles.dart';
import 'package:placement_app/presentation/students/apply_jobs_screen/controller/apply_job_controller.dart';
import 'package:provider/provider.dart';

class CompanyDetailsScreen extends StatefulWidget {
  const CompanyDetailsScreen({super.key, required this.id});

  final String id;

  @override
  State<CompanyDetailsScreen> createState() => _CompanyDetailsScreenState();
}

class _CompanyDetailsScreenState extends State<CompanyDetailsScreen> {
  fetchData() {
    Provider.of<ApplyJobsController>(context, listen: false).fetchCompanyDetails(context, widget.id);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Consumer<ApplyJobsController>(builder: (context, controller, _) {
      return controller.isLoadingCD
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: AppBar(
                title: Text("${controller.companyDetailsModel.data?.company?.name}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: size.width * .4,
                        width: size.width * .4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${AppConfig.mediaURL}${controller.companyDetailsModel.data?.company?.logo}"),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Description", style: GLTextStyles.companyDetailsTS),
                            SizedBox(height: 10),
                            Text("Founded", style: GLTextStyles.companyDetailsTS),
                            SizedBox(height: 10),
                            Text("Industry", style: GLTextStyles.companyDetailsTS),
                            SizedBox(height: 10),
                            Text("Headquarters", style: GLTextStyles.companyDetailsTS),
                            SizedBox(height: 10),
                            Text("Email", style: GLTextStyles.companyDetailsTS),
                            SizedBox(height: 10),
                            Text("Phone", style: GLTextStyles.companyDetailsTS),
                            SizedBox(height: 10),
                            Text(
                              "Job Openings",
                              style: GLTextStyles.companyDetailsTS,
                            )
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(": ${controller.companyDetailsModel.data?.company?.description}",
                                style: GLTextStyles.companyDetailsTS),
                            SizedBox(height: 10),
                            Text(": ${controller.companyDetailsModel.data?.company?.founded}",
                                style: GLTextStyles.companyDetailsTS),
                            SizedBox(height: 10),
                            Text(": ${controller.companyDetailsModel.data?.company?.industry}",
                                style: GLTextStyles.companyDetailsTS),
                            SizedBox(height: 10),
                            Text(": ${controller.companyDetailsModel.data?.company?.headquarters}",
                                style: GLTextStyles.companyDetailsTS),
                            SizedBox(height: 10),
                            Text(": ${controller.companyDetailsModel.data?.company?.emailAddress}",
                                style: GLTextStyles.companyDetailsTS),
                            SizedBox(height: 10),
                            Text(": ${controller.companyDetailsModel.data?.company?.phoneNo}",
                                style: GLTextStyles.companyDetailsTS),
                            SizedBox(height: 10),
                            Text(": ${controller.companyDetailsModel.data?.jobs?.length}",
                                style: GLTextStyles.companyDetailsTS)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
    });
  }
}
