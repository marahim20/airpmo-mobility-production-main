import 'dart:async';

import 'package:airpmp_mobility/API/ApiClass.dart';
import 'package:airpmp_mobility/API/Functions.dart';
import 'package:airpmp_mobility/API/ResourceClasses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../functions.dart';

class LoginDetails {
  late int statuscode;
  late String userid;
  late String token;
  late String organization_id;
  LoginDetails(
      {required this.userid,
      required this.token,
      required this.organization_id,
      this.statuscode = 201});
  LoginDetails.empty() {
    this.token = "";
    this.userid = "";
    this.organization_id = "";
    this.statuscode = 201;
  }

  static LoginDetails fromJson(jsonResponse) {
    return LoginDetails(
      userid: jsonResponse['user']['_id'],
      organization_id: jsonResponse['user']['organization_id'],
      token: jsonResponse['access_token'],
    );
  }
}

class SecureStorage {
  final storage = FlutterSecureStorage();
  Future writeSecureData(String key, String value) async {
    print(
        "writing data to secure storage function called for $key with value $value");
    var writeData = await storage.write(key: key, value: value);
    print("writeData is done");
    return writeData;
  }

  Future readSecureData(String key) async {
    print("reading data from secure storage function called for $key");
    var readData = await storage.read(key: key);
    print("readData is ");
    return readData;
  }

  Future deleteSecureData(String key) async {
    var deleteData = await storage.delete(key: key);
    return deleteData;
  }
}

class MyJobCard2 {
  late String activity_id = "";
  late String project_id = "";
  late String max_hour = "";
  late String jc_id = "";
  late String employee_id = "";
  late String employee_name = "";
  late String designation = "";
  late String hour = "";
  late String remarks = "";
  late String organization_id = "";
  late String date = "";
  late bool create_employee = false;

  MyJobCard2();

  MyJobCard2.fromJson(Map<String, dynamic> json) {
    activity_id = json['activity_id'] ?? "";
    project_id = json['project_id'] ?? "";
    jc_id = json['jc_id'] ?? "";
    max_hour = json['max_hour'] ?? "";
    employee_id = json['employee_id'] ?? "";
    employee_name = json['employee_name'] ?? "";
    designation = json['designation'] ?? "";
    hour = json['hour'] ?? "";
    remarks = json['remarks'] ?? "";
    organization_id = json['organization_id'] ?? "";
    date = json['date'] ?? "";
    create_employee = json['create_employee'] ?? false;
  }
}

// <==============================================================>

class MyJobCard {
  // MyJobCard({this.activiyName, this.zone});
  late String jobCardNumber = "";
  late String activiyName = "";
  late String zone = "";
  late String jcStatus = "Not-started";
  late String activityCode = "";
  late String projectID = "";
  late double spi = 0, cpi = 0;
  // assingedDate is createdDate
  late String assignedDate = "";
  late String tobeAchievedQTY = "";
  late DateTime convertedCreatedDateTime;
  double achievedQTY = 0;
  List<ActualResource> actuals = [];
  List<PlannedvsActualResource> plannedvsactuals = [];
  // List<PlannedResource> plannedResource = [];
  // List<PlannedActualResource> plannedActualResource = [];
  // List<UnplannedResource> unplannedResource = [];
  MyJobCard();
  MyJobCard.fromJson(Map<String, dynamic> json) {
    jobCardNumber = json['_id'] ?? "";
    activiyName = json['activity_name'] ?? "";
    zone = json['zone'] ?? "";
    // jcStatus = json['JCStatus'] ?? "";
    activityCode = json['activity_code'] ?? "";
    // assignedDate = json['assignedDate'] ?? "";
    tobeAchievedQTY = json['quantity_to_be_achieved'] ?? "";
    projectID = json['project_id'] ?? "";
    spi = double.tryParse(json['total_overall_spi'] ?? "") ?? 0.04;
    cpi = double.tryParse(json['total_overall_cpi'] ?? "") ?? 0.04;
    // convertedCreatedDateTime = DateTime.parse(assignedDate);
    if (((json['actual_employees']) ?? []).length == 0 ||
        json['actual_employees'].first == "") {
      actuals = [];
    } else {
      actuals = List.generate((json['actual_employees'] ?? []).length,
          (index) => ActualResource.fromJson(json['actual_employees'][index]));
    }

    // if (((json['actual_equipments']) ?? []).length == 0 ||
    //     json['actual_equipments'].first == "") {
    //   actuals = [];
    // } else {
    //   actuals = List.generate((json['actual_equipments'] ?? []).length,
    //       (index) => SingleEquipment.fromJson(
    //         json['actual_equipments'][index]));
    // }

    if (((json['lanned_vs_allowable_vs_actual']) ?? []).length == 0 ||
        json['lanned_vs_allowable_vs_actual'].first.length == 0) {
      plannedvsactuals = [];
    } else {
      plannedvsactuals = List.generate(
          (json['alanned_vs_allowable_vs_actual'] ?? []).length,
          (index) => PlannedvsActualResource.fromJson(
              json['alanned_vs_allowable_vs_actual'][index]));
    }
    // List<Map<String, dynamic>> justplannedlist = (json['planned'] ?? [])
    //     .where((element) => (element['actualhours'] ?? 0) == 0);
    // plannedResource = List.generate(justplannedlist.length,
    //     (index) => PlannedResource.fromJson(justplannedlist[index]));

    // List<Map<String, dynamic>> plannedactuallist = (json['planned'] ?? [])
    //     .where((element) =>
    //         (element['actualhours'] ?? 0) > 0 &&
    //         !(element['unPlanned'] ?? false));
    // plannedResource = List.generate(plannedactuallist.length,
    //     (index) => PlannedResource.fromJson(plannedactuallist[index]));
    // List<Map<String, dynamic>> unplannedactuallist = (json['planned'] ?? [])
    //     .where((element) => (element['unPlanned'] ?? false));
    // plannedResource = List.generate(unplannedactuallist.length,
    //     (index) => PlannedResource.fromJson(unplannedactuallist[index]));
  }
  // fg(){List ij = actuals.where((element) =>element[])}
}
// <==============================================================>

// <==============================================================>

class MyProject {
  MyProject({required this.name, required this.id, required this.active});
  late String id;
  late String name;
  late bool active;

  MyProject.fromJson(Map<String, dynamic> json) {
    name = json['project_name'];
    id = json['_id'];
    active = !json['isDeleted'];
  }
}

class JobCardData {
  ValueNotifier<bool> valueNotifier = ValueNotifier(false);
  FutureOr<bool>? completed;
  List<MyProject> listOfProjects = [];
  List<MyJobCard> _myJobCards = [];
  LoginDetails _loginDetails =
      LoginDetails(userid: "", token: "", organization_id: "");
  ProjectDetails _projectDetails = ProjectDetails();

  Future fetchJobCards() async {
    print("FetchJobCards called!");
    listOfProjects = (await ApiClass()
            .getProjects(_loginDetails.token, _loginDetails.organization_id)) ??
        [];
    //for future
    print("Hello : " + listOfProjects[0].id);
    _myJobCards = await ApiClass()
            .getMyJobCard(_loginDetails.token, listOfProjects[0].id) ??
        [];
    if (_myJobCards.length > 0)
      _projectDetails = await ApiClass().getMyProject(_loginDetails.token,
              _myJobCards[0].projectID, _loginDetails.organization_id) ??
          ProjectDetails();
  }

  Future addResources(MyJobCard myJobCard, dynamic resource, bool iseq) async {
    print("AddResources in classes called!");
    await ApiClass()
        .addResources(myJobCard, _loginDetails.token, resource, iseq);
  }

  Future<List> fetchEquipments(bool iseq) async {
    return ApiClass().fetchEquipments(_loginDetails.token, iseq);
  }

  ProjectDetails get getProjectDetails {
    return _projectDetails;
  }

  List<MyJobCard> get getJobCards {
    return _myJobCards;
  }

  void updateLogin(LoginDetails details) async {
    _loginDetails = details;
    // if (details.company == "") {
    //   details = LoginDetails(
    //     token: details.token,
    //     userid: await getUserId(),
    //     company: await getCompanyId(),
    //   );
    //   _loginDetails = details;
    //   completed = true;
    // } else {
    //   completed = true;

    await saveToken(details.token);
    await saveCompanyId(details.organization_id);
    await saveUserId(details.userid);
    // }
  }

  List<MyJobCard> getStatusCards(String status) {
    List<MyJobCard> list = [];

    for (MyJobCard aJC in _myJobCards) {
      // if (aJC.jcStatus == status) {
      list.add(aJC);
      // }
    }
    return list;
  }
}

class ProjectDetails {
  String projectName = "",
      clientName = "",
      projectDescription = "",
      projectId = "";
  ProjectDetails(
      {this.projectName = "",
      this.clientName = "",
      this.projectDescription = "",
      this.projectId = ""});

  ProjectDetails.fromJson(Map json) {
    projectName = json['project_name'] ?? "";
    clientName = json['client_name'] ?? "";
    projectDescription = json['discription'] ?? "";
    projectId = json['_id'];
  }
}
