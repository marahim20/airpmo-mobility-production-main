import 'package:airpmp_mobility/Components/simpleTable.dart';
import 'package:airpmp_mobility/Components/tableElement.dart';
import 'package:airpmp_mobility/Constants/Classes.dart';
import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:airpmp_mobility/Constants/Enums.dart';
import 'package:airpmp_mobility/Constants/Fonts_Styles.dart';
import 'package:airpmp_mobility/Models/ProviderModel.dart';
import 'package:airpmp_mobility/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabMainScreen extends StatelessWidget {
  final Stage stage;
  final Function? onPush;
  const TabMainScreen({Key? key, required this.stage, this.onPush})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(
      builder: (context, values, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Align(
              alignment: Alignment.centerRight,
              child: Text(
                stageToString(
                    Provider.of<ProviderModel>(context).stageSelection)!,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 18,
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/images/appBarBG.png"),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20),
                  child: Text(values.getProjectDetails.clientName,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
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
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            decoration: BoxDecoration(
                                color: CustomColors.secondary,
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(10))),
                            child: Center(
                                child: Text(
                              values.getProjectDetails.projectName,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                              maxLines: 2,
                            ))),
                      ),
                      Expanded(
                          child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            margin: EdgeInsets.all(5),
                            width: 200,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Search..",
                                  suffixIcon: Icon(Icons.search)),
                            )),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 48,
              child: SimpleTable(headings: [
                TableElement("Activity ID", flex: 100),
                TableElement("Date", flex: 92),
                TableElement("Description", flex: 248),
                TableElement("Qty", flex: 40),
                TableElement("Zone", flex: 54),
                TableElement("Assigned", flex: 91),
                TableElement("SPI", flex: 40),
                TableElement("CPI", flex: 40),
              ], elements: [
                for (MyJobCard jobCard in values.getJobCards())
                  SimpleTableElement(
                    onTap: () {
                      // Navigator.pushNamed(context, "job_Card_Screen");
                      onPush!(context, "job_Card_Screen", argument: jobCard);
                    },
                    datas: [
                      TableValueElement(jobCard.activityCode),
                      TableValueElement("2019-10-09"),
                      TableValueElement(jobCard.activiyName),
                      TableValueElement(jobCard.tobeAchievedQTY),
                      TableValueElement(jobCard.zone),
                      TableValueElement("YES"),
                      TableValueElement(jobCard.spi.toString()),
                      TableValueElement(jobCard.cpi.toString()),
                    ],
                  ),
              ]),
            ),
            if (values.getJobCards().length == 0)
              Expanded(
                flex: 48,
                child: Text(
                  "No Assigned ${stageToString(values.stageSelection) ?? "Not Started"} Job Cards",
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
