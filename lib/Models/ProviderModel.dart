import 'package:airpmp_mobility/API/ResourceClasses.dart';
import 'package:airpmp_mobility/Constants/Classes.dart';
import 'package:airpmp_mobility/Constants/Enums.dart';
import 'package:flutter/material.dart';

class ProviderModel extends ChangeNotifier {
  Stage stageSelection = Stage.Not_Started;
  JobCardData _jobCardData = JobCardData();

  void changeStage(Stage st) {
    stageSelection = st;
    notifyListeners();
  }

  ProviderModel(LoginDetails details) {
    _jobCardData.updateLogin(details);
  }

  Future<void> fetchJobCards() async {
    await _jobCardData.fetchJobCards();
  }

  List<MyJobCard> getJobCards() {
    // switch (stageSelection) {
    //   case Stage.Approved:
    //     return _jobCardData.getStatusCards("Executed");
    //   case Stage.In_Progress:
    //     return _jobCardData.getStatusCards("In-Progress");
    //   case Stage.Waiting:
    //     return _jobCardData.getStatusCards("Waiting-for-Approval");
    //   case Stage.Not_Started:
        return _jobCardData.getStatusCards("Not-started");
    // }
  }

  Future<List> getEquipments(Resource res) {
    return _jobCardData.fetchEquipments(res == Resource.Equipment);
  }

  ProjectDetails get getProjectDetails {
    return _jobCardData.getProjectDetails;
  }

  void putResources(MyJobCard myJobCard, dynamic addResource, bool iseq) {
    _jobCardData.addResources(myJobCard, addResource, iseq);
    print("PutResources called against JobCard!");
  }
}
