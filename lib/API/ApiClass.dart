import 'dart:convert';

import 'package:airpmp_mobility/Constants/Classes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'Functions.dart';
import 'ResourceClasses.dart';

/// Call getIDs function to fetch IDs from local storage
class ApiClass {
  String projectID = '', userID = '';

  void getIDs() async {
    userID = await getUserId();
    projectID = await getProjectId();
  }

//<===========   Get Login Details     ==============>
  Future<LoginDetails> login(
      {required String username, required String password}) async {
    String url = "https://api.airpmo.co/api/login";
    Map<String, String> body = {
      "Email": username,
      "Password": password,
      "domain_name": "app.airpmo.co"
    };
    final credentialsJson = json.encode(body);

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    try {
      Response response = await post(Uri.tryParse(url) ?? Uri(),
          headers: headers, body: credentialsJson);
      debugPrint("response is working");
      int statuscode = response.statusCode;
      print(statuscode.toString());
      if (statuscode == 201) {
        saveCredentials(username, password);
        var jsonResponse = json.decode(response.body);
        print(response.body);
        LoginDetails loginDetails = LoginDetails.fromJson(jsonResponse);
        return loginDetails;
      } else
        return (LoginDetails(
            organization_id: "",
            userid: "",
            token: "",
            statuscode: statuscode));
    } catch (e) {
      debugPrint(e.toString());
    }
    return (LoginDetails(
        organization_id: "", userid: "", token: "", statuscode: 400));
  }

//<==============Get Project Details=================>

  Future<List<MyProject>?> getProjects(
      String token, String organization_id) async {
    var projectsJson;
    var aProject;
    List<MyProject> listOfProjects = [];
    String url = "https://api.airpmo.co/api/organization/" +
        organization_id +
        "/project";
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Accept': 'application/json',
      "Authorization": "Bearer " + token,
    };
    Response response = await get(Uri.tryParse(url) ?? Uri(), headers: headers);
    print("Response" + response.body);

    if (response.statusCode == 200) {
      print('sucessfully obtained projects....');
      projectsJson = jsonDecode(response.body);
      for (aProject in projectsJson) {
        listOfProjects.add(MyProject.fromJson(aProject));
      }
      int len = listOfProjects.length;
      print("number of projects = $len");
      return listOfProjects;
    } else
      return null;
  }

  /// Get Details of the current project in which the user is working.
  /// Condition: The user should only work on a single project at a time.
  Future<ProjectDetails?> getMyProject(
      String token, String projectID, String companyID) async {
    var projectsJson;
    var aProject;
    print("Helloooo" + companyID);
    String url =
        "https://api.airpmo.co/api/organization/" + companyID + "/project";
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Accept': 'application/json',
      "Authorization": "Bearer " + token,
    };
    Response response = await get(Uri.tryParse(url) ?? Uri(), headers: headers);

    if (response.statusCode == 200) {
      print('sucessfully obtained projects....');
      projectsJson = jsonDecode(response.body);
      for (aProject in projectsJson) {
        if (aProject['_id'] == projectID)
          return ProjectDetails.fromJson(aProject);
      }
    } else
      return null;
  }

  Future<List<MyJobCard>?> getMyJobCard(String token, String userID) async {
    print('getting job card from internet..');
    var myJobCardsJson;
    var aJobCard;
    List<MyJobCard> myJobCardsList = [];

    // -------------this will only get sama al jadaf 's job cards -------------------
    print(userID);
    String url = "https://api.airpmo.co/api/find_job_card_by_project/" + userID;
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Accept': 'application/json',
      "Authorization": "Bearer " + token,
    };
    try {
      Response response =
          await get(Uri.tryParse(url) ?? Uri(), headers: headers);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        print('sucessfully obtained jobcards....');
        myJobCardsJson = jsonDecode(response.body);
        for (aJobCard in myJobCardsJson) {
          myJobCardsList.add(MyJobCard.fromJson(aJobCard));
        }
      }
      int len = myJobCardsList.length;
      print("number of jc in obtained = $len");
      // return myJobCardsList;
      return myJobCardsList;
    } catch (e) {
      print(e);
      return null;
    }
  }

// < Complete -- UNDER TESTING >
  Future<int> addResources(
      MyJobCard job, String _token, dynamic resource, bool iseq) async {
    print("JobCardNumber: " + job.jobCardNumber);
    String url = 'https://api.airpmo.co/api/find_job_card/${job.jobCardNumber}';
    String url1;
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Accept': 'application/json',
      "Authorization": "Bearer " + _token,
    };
    String body;
    if (iseq) {
      url1 = "https://api.airpmo.co/api/create_my_job_card_equipments";
      body = jsonEncode({
        "activity_id": job.jobCardNumber,
        // "actual_equipments": [
        //   for (ActualResource ar in job.actuals) ar.toJson(),
        //   ActualResource(
        //       resource.id,
        //       "${resource.acthours}",
        //       resource.type,
        //       5.7, //TODO: Replace Hardcoded Value
        //       false,
        //       "${resource.make} ${resource.model}",
        //       6, //TODO: Replace Hardcoded Value
        //       resource.remarks,
        //       true)
        // ],
        "project_id": job.achievedQTY,
        "jc_id": "123",
        "employee_id": job.achievedQTY,
        "employee_name": job.achievedQTY,
        "designation": job.achievedQTY,
        "hour": job.achievedQTY,
        "max_hour": job.achievedQTY,
        "organization_id": job.achievedQTY,
        "date": job.achievedQTY,
        // "project_id": job.achievedQTY,
        // "project_id": job.achievedQTY,
        // "project_id": job.achievedQTY,
      });
    } else {
      url1 = "https://api.airpmo.co/api/create_my_job_card_employee";
      // print("Heloo");
      body = body = jsonEncode({
        "_id": job.jobCardNumber,
        "project_id": job.projectID,
        "jc_id": "123",
        "employee_id": job.achievedQTY,
        "employee_name": job.achievedQTY,
        "designation": job.achievedQTY,
        "max_hour": job.achievedQTY,
        "hour": job.achievedQTY,
        "organization_id": job.achievedQTY,
        "date": job.achievedQTY,
        // "actual_employees": [
        //   for (ActualResource ar in job.actuals) ar.toJson(),
        //   ActualResource(
        //       resource.id,
        //       "${resource.acthours}",
        //       resource.desig,
        //       5.7, //TODO: Replace Hardcoded Value
        //       false,
        //       "${resource.fname}",
        //       6, //TODO: Replace Hardcoded Value
        //       resource.remarks,
        //       true)
        // ],
        "quantity_to_be_achieved": job.achievedQTY,
        "alanned_vs_allowable_vs_actual": [
          for (PlannedvsActualResource par in job.plannedvsactuals)
            par.toJson(),
          PlannedvsActualResource(4, "5.7", 0, 0, 0, 0, "Developer", 1, 2, 3, 0,
              "") //TODO: Replace Hardcoded Value
        ]
      });
      // print("Heloo2");
    }
    try {
      print("Heloo2");
      Response response =
          await post(Uri.tryParse(url1) ?? Uri(), headers: headers, body: body);
      print(response.statusCode.toString() +
          " " +
          url1.toString() +
          " " +
          body.toString());

      if (response.statusCode == 201) {
        print('sucessfully added resources....');
        // myJobCardsJson = jsonDecode(response.body);
        // for (aJobCard in myJobCardsJson) {
        //   myJobCardsList.add(MyJobCard.fromJson(aJobCard));
        // }
      }
      return response.statusCode;
      // int len = myJobCardsList.length;
      // print("number of jc in obtained = $len");
      // // return myJobCardsList;
      // return {
      //   'myJobCardList': myJobCardsList,
      //   'numberOfJCs': myJobCardsList.length
      // };
    } catch (e) {
      print(e);
      return 300;
    }
  }

  Future<List> fetchEquipments(String token, bool iseq) async {
    String url = "https://api.airpmo.co/api/find_all_my_job_card_employee";
    if (iseq) url = 'https://api.airpmo.co/api/find_my_all_job_card_equipments';
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Accept': 'application/json',
      "Authorization": "Bearer " + token,
    };
    try {
      Response response =
          await get(Uri.tryParse(url) ?? Uri(), headers: headers);
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        if (iseq) {
          return jsonResponse
              .map((data) => SingleEquipment.fromJson(data))
              .toList();
        } else {
          print(SingleEmployee.fromJson(jsonResponse[0]));
          return jsonResponse
              .map((data) => SingleEmployee.fromJson(data))
              .toList();
        }
      } else {
        throw Exception('Unexpected error occured!');
      }
    } catch (e) {
      throw Exception('Unexpected error occured: ${e.toString()}!');
    }
  }

//<===========PUT RESOURCES===============>
// https://airpmo.herokuapp.com/api/jobcard/5d9db979c108b30004207c66

  Future<int> putResources(
      List<ActualResource> actuals, String token, String acheivedqty) async {
    String url =
        'https://airpmo.herokuapp.com/api/jobcard/5d9db979c108b30004207c66';
    Map<String, String> headers = {
      "Content-type": "application/json",
      'Accept': 'application/json',
      "Authorization": "Bearer " + token,
    };
    var body = jsonEncode({
      "_id": "5d9db979c108b30004207c66",
      "actuals": [
        for (ActualResource ar in actuals) ar.toJson(),
      ],
      "achievedQTY": acheivedqty,
      //plannedvsallocatedvsactual???
    });
    try {
      Response response =
          await put(Uri.tryParse(url) ?? Uri(), headers: headers, body: body);
    } catch (e) {
      print(e);
    }

    return 1;
  }
}
