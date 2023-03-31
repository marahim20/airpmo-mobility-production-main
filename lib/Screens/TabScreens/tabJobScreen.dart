import 'package:airpmp_mobility/API/ResourceClasses.dart';
import 'package:airpmp_mobility/Components/CustomRoundedButton.dart';
import 'package:airpmp_mobility/Components/simpleTable.dart';
import 'package:airpmp_mobility/Components/tableElement.dart';
import 'package:airpmp_mobility/Constants/Classes.dart';
import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:airpmp_mobility/functions.dart';
import 'package:flutter/material.dart';

class TabJobScreen extends StatelessWidget {
  // final Stage stage;
  final Function? onPush;
  final MyJobCard jobCard;
  const TabJobScreen({Key? key, this.onPush, required this.jobCard})
      : super(key: key);

  String totalAllowableResources() {
    double total = 0;
    for (PlannedvsActualResource res in jobCard.plannedvsactuals) {
      total += res.allowableResources ?? 0;
    }
    return total.toString();
  }

  String totalAllowableTotHrs() {
    double total = 0;
    for (PlannedvsActualResource res in jobCard.plannedvsactuals) {
      total += res.allowableResources ?? 0;
    }
    return total.toString();
  }

  String totalActualTotHours() {
    double total = 0;
    for (PlannedvsActualResource res in jobCard.plannedvsactuals) {
      total += res.allowableResources ?? 0;
    }
    return total.toString();
  }

  String totalActualTotCost() {
    double total = 0;
    for (PlannedvsActualResource res in jobCard.plannedvsactuals) {
      total += res.allowableResources ?? 0;
    }
    return total.toString();
  }

  String totalSpi() {
    double total = 0;
    for (PlannedvsActualResource res in jobCard.plannedvsactuals) {
      total += res.allowableResources ?? 0;
    }
    return total.toString();
  }

  String totalCpi() {
    double total = 0;
    for (PlannedvsActualResource res in jobCard.plannedvsactuals) {
      total += res.allowableResources ?? 0;
    }
    return total.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Job Screen",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            )),
      ),
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Icon(Icons.arrow_back),
              //       Spacer(),
              //       Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 18.0),
              //         child: Icon(
              //           Icons.notifications,
              //           size: 30,
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(right: 40.0),
              //         child: CircleAvatar(),
              //       )
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 50,
                  child: Card(
                    color: Color(0xffEDF1F6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                  color: CustomColors.secondary,
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(10))),
                              child: Center(
                                  child: Text(
                                jobCard.activityCode,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                                maxLines: 2,
                              ))),
                        ),
                        SizedBox(width: 1),
                        Expanded(
                          flex: 3,
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: CustomColors.secondary,
                              ),
                              child: Center(
                                  child: Text(
                                jobCard.activiyName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                                maxLines: 2,
                              ))),
                        ),
                        SizedBox(width: 1),
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: CustomColors.secondary,
                              ),
                              child: Center(
                                  child: Text(
                                jobCard.zone,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                                maxLines: 2,
                              ))),
                        ),
                        Expanded(
                            flex: 5,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                  margin: EdgeInsets.all(5),
                                  width: 200,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Search..",
                                        prefixIcon: Icon(Icons.search)),
                                  )),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          margin: EdgeInsets.all(5),
                          width: 200,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.bottom,
                            decoration: InputDecoration(
                                hintText: "JC Executed",
                                prefixIcon: Icon(Icons.calendar_today)),
                          )),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: CustomRoundedButton(
                            label: "Add Employee",
                            iconData: Icons.person_add,
                            onPressed: () {
                              onPush!(context, "actual_Employees",
                                  argument: jobCard);
                            },
                          ),
                        ),
                        Expanded(
                          child: CustomRoundedButton(
                            label: "Add Equipents",
                            iconData: Icons.person_add,
                            onPressed: () {
                              onPush!(context, "actual_Equipments",
                                  argument: jobCard);
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                flex: 48,
                child: SimpleTable(headings: [
                  TableElement("Designation", flex: 1),
                  TableElement("Allowable Resources", flex: 1),
                  TableElement("Allowable Total Hrs", flex: 1),
                  TableElement("Actual Total Hrs", flex: 1),
                  TableElement("Actual Cost", flex: 1),
                  TableElement("SPI", flex: 1),
                  TableElement("CPI", flex: 1),
                ], elements: [
                  for (PlannedvsActualResource res in jobCard.plannedvsactuals)
                    SimpleTableElement(
                      onTap: null,
                      datas: [
                        TableValueElement(res.designation),
                        TableValueElement(
                            (res.allowableResources ?? "-").toString()),
                        TableValueElement(
                            (res.allowableTotHrs ?? "-").toString()),
                        TableValueElement(res.actualTotHours),
                        TableValueElement(res.actualTotCost.toString()),
                        TableValueElement(res.spi.toString()),
                        TableValueElement(res.cpi.toString()),
                      ],
                    ),
                  SimpleTableElement(
                    color: CustomColors.backgroundcolor,
                    onTap: null,
                    datas: [
                      TableValueElement(
                        "Quantity to be acheived : ${jobCard.tobeAchievedQTY}",
                        flex: 5,
                        useCustomflex: true,
                        textAlign: TextAlign.left,
                      ),
                      TableValueElement(totalSpi(),
                          flex: 1, useCustomflex: true, color: Colors.green),
                      TableValueElement(totalCpi(),
                          flex: 1, useCustomflex: true, color: Colors.red),
                    ],
                  ),
                ]),
              ),
              if (jobCard.plannedvsactuals.length == 0)
                Expanded(
                  flex: 48,
                  child: Text(
                    "No Resoures in PlannedvsAllowedvsActuals!",
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
          Card(
              color: CustomColors.secondary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("Qty to be achieved",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    Container(
                        width: 100,
                        child: Padding(
                            padding: EdgeInsets.all(8), child: TextField())),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("Qty to be achieved",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    Container(
                        width: 100,
                        child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(jobCard.tobeAchievedQTY))),
                    CircleButton(
                        icon: Icon(
                      Icons.save,
                      size: 30,
                      color: CustomColors.secondary,
                    )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
