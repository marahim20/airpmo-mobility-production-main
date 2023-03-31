import 'package:airpmp_mobility/Constants/Fonts_Styles.dart';
import 'package:flutter/material.dart';
import 'package:airpmp_mobility/API/hardcoded.dart';
class JobSearchDropdown extends StatelessWidget {
  const JobSearchDropdown({Key? key}) : super(key: key);

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
            Stack(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: CustomTextStyles.Hint_style,
                  ),
                  textAlignVertical: TextAlignVertical.bottom,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Ink(
                    decoration: ShapeDecoration(
                      shape: CircleBorder(),
                      color: Color(0xff57D1AF),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, i) {
                  return SizedBox(
                    height: 10,
                  );
                },
                scrollDirection: Axis.vertical,
                itemCount: jid.length,
                itemBuilder: (context, i) {
                  return Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child:
                            Text(jid[i], style: CustomTextStyles.Listtile_Title),
                      ),
                      SizedBox(
                        width: w < 600 ? w * .1 : w * 0.4,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(jname[i],
                            style: CustomTextStyles.Listtile_Title),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
