import 'package:airpmp_mobility/Components/Drawer.dart';
import 'package:airpmp_mobility/Components/JobListTile.dart';
import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:airpmp_mobility/Constants/Enums.dart';
import 'package:airpmp_mobility/Constants/Fonts_Styles.dart';
import 'package:airpmp_mobility/Models/ProviderModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../functions.dart';

class MainPagePhone extends StatelessWidget {
  final Stage stage;
  final Function? onPush;
  const MainPagePhone({Key? key, required this.stage, this.onPush})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderModel>(builder: (context, values, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              // Includes the "Arabtech" part with background image and "Not Started" part

              SliverAppBar(
                backgroundColor: CustomColors.primary,
                iconTheme: IconThemeData(color: Colors.white),
                elevation: 0,
                pinned: true,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30))),
                flexibleSpace: Container(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/appBarBG.png"),
                                  fit: BoxFit.cover),
                              color: Color.fromARGB(255, 19, 108, 87),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30))),
                          child: Center(
                            child: Text(
                              "Activites",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 252, 252, 252),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     // Width between the left end of screen and ArabTech Text
                          //     SizedBox(
                          //       width: 50,
                          //     ),
                          //     Column(
                          //       mainAxisAlignment: MainAxisAlignment.end,
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Container(
                          //           child: Text(
                          //             values.getProjectDetails.clientName,
                          //             style: CustomTextStyles.White_title,
                          //           ),
                          //         ),
                          //         //Bottom Padding of ArabTech text
                          //         SizedBox(
                          //           height: 8,
                          //         )
                          //       ],
                          //     ),
                          //   ],
                          // ),
                        ),
                      ),
                      //Space for the second appbar, with the not started text.
                      //Padding given so that the bottom left border radius will be seen
                      SizedBox(height: 56)
                    ],
                  ),
                ),
                expandedHeight: MediaQuery.of(context).size.height / 3.3,

                // Not Started App Bar
                bottom: AppBar(
                  elevation: 0,
                  backgroundColor: Color.fromARGB(255, 236, 241, 240),
                  leadingWidth: 0,
                  leading: Container(),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(24))),
                  title: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.task,
                        color: Colors.black,
                        size: 30,
                      ),
                      Text(
                        stageToString(values.stageSelection) ?? "Not Started",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              // Project name above the list
              SliverAppBar(
                // toolbarHeight: 30,
                leadingWidth: 10,
                leading: Container(),
                backgroundColor: Colors.transparent,
                title: Row(
                  children: [
                    // SizedBox(width: 10),
                    Text(
                      "Project:  ",
                      style: TextStyle(
                          color: CustomColors.textcolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Expanded(
                      child: Text(
                        values.getProjectDetails.projectName,
                        style: TextStyle(
                            color: CustomColors.textcolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, i) {
                return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: JobListTile(
                      text: values.getJobCards()[i].activiyName,
                      iD: values.getJobCards()[i].activityCode,
                      onPressed: () {
                        onPush!(context, "job_Card_Screen",
                            argument: values.getJobCards()[i]);
                      },
                    ));
              }, childCount: values.getJobCards().length)),
              if (values.getJobCards().length == 0)
                SliverFillRemaining(
                    child: Center(
                  child: Text(
                    "No Assigned Job cards in \"${stageToString(values.stageSelection) ?? "Not Started"}\" state",
                    textAlign: TextAlign.center,
                  ),
                )),
            ],
          ),
          drawer: CustomDrawer());
    });
  }
}

// class MainScreenTab extends StatelessWidget {
//   const MainScreenTab({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TabBaseStructure(child: TabMainScreen());
//   }
// }
