import 'dart:math';

import 'package:airpmp_mobility/Constants/Classes.dart';
import 'package:airpmp_mobility/Models/ProviderModel.dart';
import 'package:airpmp_mobility/Screens/phoneApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'API/Functions.dart';
import 'Screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Rubik",
        inputDecorationTheme: InputDecorationTheme(),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Color(0xFFF4442E)),
        appBarTheme: AppBarTheme(
          color: Color(0xFFF4442E),
          iconTheme: IconThemeData(color: Colors.black),
          // textTheme: TextTheme(
          //   headline1: TextStyle(color: Colors.black),
          // ),
        ),
      ),
      home: LoginChecker(),
    );
  }
}

class LoginChecker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LoginDetails>(
        future: getLoginDetais(),
        builder: (context, snapshot) {
          print("Login Checker: ${snapshot.hasData}");
          return snapshot.hasData
              ? snapshot.data?.token == ""
                  ? LoginPage()
                  : Builder(builder: (context) {
                      return ChangeNotifierProvider<ProviderModel>(
                          create: (ccontext) =>
                              ProviderModel(snapshot.data as LoginDetails),
                          child: MainApp(
                              isTab: MediaQuery.of(context).size.width > 700));
                    })
              : Center(child: CircularProgressIndicator(color: Colors.blue));
        });
  }
}
