import 'package:airpmp_mobility/Constants/Classes.dart';
import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:airpmp_mobility/Constants/Fonts_Styles.dart';
import 'package:flutter/material.dart';

import '../functions.dart';
import 'CustomRoundedButton.dart';

class JobProceedButton extends StatefulWidget {
  final VoidCallback onClosed;
  final Function onqtyChanged;
  final double qty;
  final MyJobCard jobCard;
  JobProceedButton(
      {Key? key,
      required this.qty,
      required this.jobCard,
      required this.onClosed,
      required this.onqtyChanged})
      : super(key: key);

  @override
  _JobProceedButtonState createState() => _JobProceedButtonState();
}

class _JobProceedButtonState extends State<JobProceedButton> {
  TextEditingController tc = TextEditingController();
  DateTime date = DateTime.now();

  Future<DateTime?> dateSelector(DateTime dt) {
    return showDatePicker(
      context: context,
      initialDate: dt,
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime(2050, 1, 1),
      helpText: "Enter the Date of Execution",
    );
  }

  @override
  void initState() {
    super.initState();
    print("${widget.qty}");
    // tc = TextEditingController(text: "${widget.qty}");
  }

  @override
  Widget build(BuildContext context) {
    print("${widget.qty}");
    tc.value = TextEditingValue(text: "${widget.qty}");
    return Container(
      //Floating button has a default padding from right and bottom, so left padding should be adjusted to that
      margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
      padding: EdgeInsets.all(10),
      // height: 250,
      decoration: BoxDecoration(
          color: CustomColors.secondary,
          borderRadius: BorderRadius.circular(24)),
      //outer column containing the proceed and close button, with the main column
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, color: Colors.white),
                      Text(
                        " JC Executed ",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            child: Text(
                              "${dateToString(date)}",
                              style: CustomTextStyles.CardText.copyWith(
                                  // decoration: TextDecoration.underline
                                  ),
                            ),
                          ),
                        ),
                        Icon(Icons.edit, color: Colors.white),
                      ],
                    ),
                    onPressed: () async {
                      date = await dateSelector(date) ?? date;

                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(Icons.analytics, color: Colors.white),
                      Text(
                        " Qty achived",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 60,
                          child: TextField(
                            controller: tc,
                            onChanged: (s) {
                              widget.onqtyChanged(
                                  double.tryParse(s) ?? widget.qty);
                            },
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration:
                                InputDecoration(focusColor: Colors.white),
                            maxLines: 1,
                            cursorColor: Colors.white,
                            style: CustomTextStyles.CardText.copyWith(
                                fontSize: 21),
                          )),
                      Text(
                        " / ${widget.jobCard.tobeAchievedQTY}",
                        style: CustomTextStyles.CardText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //Main Column
          // Expanded(
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       // Text part of main Column
          //       Column(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           children: [
          //             Text(
          //               " JC Executed ",
          //               style: TextStyle(fontSize: 18, color: Colors.white),
          //               overflow: TextOverflow.ellipsis,
          //             ),
          //             Text(
          //               "Qty achived",
          //               style: TextStyle(fontSize: 18, color: Colors.white),
          //               overflow: TextOverflow.ellipsis,
          //             ),
          //           ]),
          //       // Text Field part of main column
          //       Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           TextButton(
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 Icon(Icons.calendar_today, color: Colors.white),
          //                 Padding(
          //                   padding:
          //                       const EdgeInsets.symmetric(horizontal: 8.0),
          //                   child: Container(
          //                     child: Text(
          //                       "${dateToString(date)}",
          //                       style: CustomTextStyles.CardText.copyWith(
          //                           decoration: TextDecoration.underline),
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             ),
          //             onPressed: () async {
          //               date = await dateSelector(date) ?? date;

          //               setState(() {});
          //             },
          //           ),
          //           // Text(jobCard.tobeAchievedQTY),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               Container(
          //                   width: 60,
          //                   height: 20,
          //                   child: TextField(
          //                     controller: tc,
          //                     textAlign: TextAlign.center,
          //                     keyboardType: TextInputType.number,
          //                     decoration: InputDecoration(),
          //                     style: CustomTextStyles.CardText.copyWith(
          //                         fontSize: 21),
          //                   )),
          //               Text(
          //                 " / ${widget.jobCard.tobeAchievedQTY}",
          //                 style: CustomTextStyles.CardText,
          //               ),
          //             ],
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextButton(
                      child: Text(
                        "Proceed",
                        style: TextStyle(
                            fontSize: 18, color: CustomColors.secondary),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  CircleButton(
                    onPressed: widget.onClosed,
                    icon: Icon(Icons.close, color: CustomColors.secondary),
                    bgColor: Colors.white,
                  )
                ]),
          )
        ],
      ),
    );
  }
}
