import 'package:airpmp_mobility/Components/scrollableTableElement.dart';
import 'package:airpmp_mobility/Constants/Classes.dart';
import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:flutter/material.dart';

class ScrollableTable extends StatelessWidget {
  final MyJobCard jobCard;
  const ScrollableTable({Key? key, required this.jobCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                      width: 80,
                      child: Text(
                        "Designation",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  VerticalDivider(),
                  Container(
                      width: 80,
                      child: Text(
                        "Allowable Resources",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Container(
                      width: 80,
                      child: Text(
                        "Allowable Total Hrs",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Container(
                      width: 80,
                      child: Text(
                        "Actual Total Hrs",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Container(
                      width: 80,
                      child: Text(
                        "Actual Cost",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Container(
                      width: 80,
                      child: Text(
                        "SPI",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Container(
                      width: 80,
                      child: Text(
                        "CPI",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                ],
              ),
            ),
          ),
          Container(
            width: 600,
            height: 3,
            color: Color(0xddB4BBC5),
          ),
          Expanded(
            child: Container(
              width: 600,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  if (index == jobCard.plannedvsactuals.length)
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: CustomColors.icon_not_selected),
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.stretch,

                            children: [
                              Container(
                                  width: 400,
                                  child: Text(
                                    "Quantity to be acheived : ${jobCard.tobeAchievedQTY}",
                                    textAlign: TextAlign.left,
                                  )),
                              VerticalDivider(),
                              Container(
                                  width: 80,
                                  child: Text(
                                    "1",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  width: 80,
                                  child: Text(
                                    "1.65",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        )
                      ],
                    );
                  return ScrollableTableElement(
                      res: jobCard.plannedvsactuals[index]);
                },
                itemCount: jobCard.plannedvsactuals.length + 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
