import 'package:airpmp_mobility/API/ApiClass.dart';
import 'package:airpmp_mobility/API/ResourceClasses.dart';
import 'package:airpmp_mobility/Constants/Fonts_Styles.dart';
import 'package:airpmp_mobility/Models/ProviderModel.dart';
import 'package:flutter/material.dart';
import 'package:airpmp_mobility/API/hardcoded.dart';
import 'package:provider/provider.dart';

class AddEmpDropDown extends StatelessWidget {
  const AddEmpDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
// <=====================================================================>

// <=====================================================================>
    // the deice is a Phone
    //if (w < 600) {
    return Card(
      elevation: 8,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: w < 600 ? w * .2 : w * 0.4,
        height: h * 0.6,
        padding: EdgeInsets.all(25),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          border: new Border(
            top: BorderSide(
              color: Colors.white,
              width: 3.0,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: CustomTextStyles.Hint_style,
              ),
              textAlignVertical: TextAlignVertical.bottom,
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: FutureBuilder<List<SingleEquipment>>(
                // future: Provider.of<ProviderModel>(context).getEquipments(res),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<SingleEquipment> data = snapshot.data ?? [];
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  height: 75,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(data[index].id,
                                            style: CustomTextStyles
                                                .Listtile_Title),
                                      ),
                                      SizedBox(
                                        width: w < 600 ? w * .1 : w * 0.4,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(data[index].type,
                                            style: CustomTextStyles
                                                .Listtile_Title),
                                      ),
                                    ],
                                  )),
                            ],
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // By default show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
              // child: ListView.separated(
              //   separatorBuilder: (context, i) {
              //     return SizedBox(
              //       height: 10,
              //     );
              //   },
              //   scrollDirection: Axis.vertical,
              //   itemCount: id.length,
              //   itemBuilder: (context, i) {
              //     return Row(
              //       children: [
              //         Align(
              //           alignment: Alignment.centerLeft,
              //           child:
              //               Text(id[i], style: CustomTextStyles.Listtile_Title),
              //         ),
              //         SizedBox(
              //           width: w < 600 ? w * .1 : w * 0.4,
              //         ),
              //         Align(
              //           alignment: Alignment.centerRight,
              //           child: Text(name[i],
              //               style: CustomTextStyles.Listtile_Title),
              //         ),
              //       ],
              //     );
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
