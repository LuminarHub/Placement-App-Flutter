import 'dart:developer';

import 'package:placement_app/core/utils/app_utils.dart';
import 'package:placement_app/repository/helper/api_helper.dart';

class ApplyJobsService {
  static Future<dynamic> fetchApplyJobs() async {
    log("ApplyJobsService -> fetchApplyJobs()");
    try {
      var decodedData = await ApiHelper.getData(
          endPoint: "student/jobs/", header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> postApplyJob(id) async {
    log("ApplyJobsService -> postApplyJob(id)");
    try {
      var decodedData = await ApiHelper.postData(
          endPoint: "student/jobs/$id/apply_job/",
          header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }

  static Future<dynamic> fetchCompanyDetails(id) async {
    try {
      var decodedData = await ApiHelper.getData(
          endPoint: "student/companies/$id/",
          header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
