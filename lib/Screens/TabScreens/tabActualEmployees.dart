import 'package:airpmp_mobility/API/ResourceClasses.dart';
import 'package:airpmp_mobility/Components/simpleTable.dart';
import 'package:airpmp_mobility/Components/tableElement.dart';
import 'package:airpmp_mobility/Constants/Classes.dart';
import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:airpmp_mobility/Constants/Enums.dart';
import 'package:airpmp_mobility/Models/ProviderModel.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabActualResources extends StatelessWidget {
  final Function onPush;
  final Resource resource;
  final MyJobCard jobCard;
  const TabActualResources(
      {Key? key,
      required this.resource,
      required this.onPush,
      required this.jobCard})
      : super(key: key);
  bool isSameResource(bool iseq) {
    if (iseq && resource == Resource.Equipment)
      return true;
    else if (!iseq && resource == Resource.Employee)
      return true;
    else
      return false;
  }

  void openPopUp(SingleEquipment singleEquipment, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            contentPadding: const EdgeInsets.all(15.0),
            children: [
              Text(
                singleEquipment.make + " " + singleEquipment.model,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                singleEquipment.id,
              ),
              Container(
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(hintText: "Number of Hours"),
                ),
              ),
              TextField(
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(hintText: "Remarks"),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  TextButton(
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  MaterialButton(
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: CustomColors.secondary,
                    onPressed: () {
                      //TODO: PUT FUNTION HERE
                    },
                  ),
                ],
              )
            ],
          );
        });
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
      body: Column(
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
                            "Actual Employees",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 2,
                          ))),
                    ),
                    Expanded(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            width: 200,
                            child: FutureBuilder<List>(
                                future: Provider.of<ProviderModel>(context)
                                    .getEquipments(resource),
                                initialData: [],
                                builder: (futcontext, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    print(snapshot.data!.length);
                                    return DropdownSearch<dynamic>(
                                        mode: Mode.MENU,
                                        dropdownSearchDecoration:
                                            InputDecoration(

                                                // border: InputBorder.none,
                                                suffixIcon: Icon(Icons.search),
                                                enabled: true),
                                        dropDownButton: Container(),
                                        itemAsString: (se) {
                                          if (resource == Resource.Equipment)
                                            return "[" +
                                                se!.id +
                                                "] " +
                                                se.type;
                                          else
                                            return "[" +
                                                se!.id +
                                                "] " +
                                                se.desig;
                                        },
                                        items: snapshot.data,
                                        showSearchBox: true,
                                        maxHeight: 300,
                                        onChanged: (s) {
                                          openPopUp(s!, context);
                                        },
                                        emptyBuilder: (context, e) {
                                          return Center(
                                              child: Icon(Icons.hourglass_top));
                                        },
                                        loadingBuilder: (context, e) {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        });
                                  } else
                                    return Center(
                                        child: CircularProgressIndicator());
                                }),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 48,
            child: SimpleTable(headings: [
              TableElement("ID", flex: 2),
              TableElement("Name", flex: 3),
              TableElement("Designation", flex: 3),
              TableElement("Total Hrs", flex: 2, maxLines: 2),
              TableElement("Remarks", flex: 2),
            ], elements: [
              for (ActualResource resource in jobCard.actuals)
                if (isSameResource(resource.isEquipment))
                  SimpleTableElement(
                    onTap: null,
                    datas: [
                      TableValueElement(resource.iD),
                      TableValueElement(resource.name, maxLines: 2),
                      TableValueElement(resource.designation, maxLines: 2),
                      TableValueElement(resource.actualHours),
                      TableValueElement(resource.remarks),
                    ],
                  ),
            ]),
          ),
        ],
      ),
    );
  }
}
