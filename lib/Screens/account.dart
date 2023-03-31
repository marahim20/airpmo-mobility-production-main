import 'package:airpmp_mobility/API/Functions.dart';
import 'package:airpmp_mobility/Constants/Fonts_Styles.dart';
import 'package:airpmp_mobility/Screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
              ),
            ),
            elevation: 5,
            backgroundColor: Color.fromARGB(255, 19, 108, 87),
            title: Row(
              children: [
                Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: w * 0.5,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                    saveToken("");
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: Color.fromARGB(255, 236, 241, 240),
            ),
            Column(
              children: [
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Spacer(
                        flex: 1,
                      ),
                      Expanded(
                          flex: 9,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            color: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.white),
                              child: FractionallySizedBox(
                                heightFactor: 1,
                                widthFactor: 0.7,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://completeconcussions.com/drive/uploads/2017/10/detail-john-doe.jpg'),
                                      radius: w * 0.13,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'John Doe',
                                        style: CustomTextStyles.Main_title,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Architect',
                                        style: CustomTextStyles.Main_subtitle,
                                      ),
                                    ),
                                    Container(
                                      width: w,
                                      padding: EdgeInsets.symmetric(
                                          vertical: w * 0.025,
                                          horizontal: w * 0.01),
                                      decoration: BoxDecoration(
                                        //color: Color(0xff57D1AF),
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Text(
                                                  'Project:',
                                                  style: CustomTextStyles
                                                      .Main_subtitle,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Text(
                                                  'Sama Al Jadaf Infrastructure Works DS135/2',
                                                  style: CustomTextStyles
                                                      .Main_subtitle,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.025,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Text(
                                                  'Company:',
                                                  style: CustomTextStyles
                                                      .Main_subtitle,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Text(
                                                  'airPMO',
                                                  style: CustomTextStyles
                                                      .Main_subtitle,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.025,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Text(
                                                  'Job Cards Assigned:',
                                                  style: CustomTextStyles
                                                      .Main_subtitle,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Text(
                                                  '7',
                                                  style: CustomTextStyles
                                                      .Main_subtitle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                      Spacer(
                        flex: 1,
                      )
                    ],
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ],
        ));
  }
}
