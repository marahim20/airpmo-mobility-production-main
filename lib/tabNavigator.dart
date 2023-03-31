
import 'package:airpmp_mobility/Screens/login.dart';
import 'package:flutter/material.dart';
import 'Constants/Classes.dart';
import 'Constants/Enums.dart';
import 'Screens/PhoneScreens/actualEmployees.dart';
import 'Screens/PhoneScreens/job_screen.dart';
import 'Screens/PhoneScreens/main_screen.dart';
import 'Screens/TabScreens/tabActualEmployees.dart';
import 'Screens/TabScreens/tabJobScreen.dart';
import 'Screens/TabScreens/tabMainScreen.dart';
import 'Screens/account.dart';

class CustomNavigator extends StatelessWidget {
  CustomNavigator(
      {required this.navigatorKey,
      required this.tabItem,
      this.isTab = false,
      this.stage});
  final GlobalKey<NavigatorState> navigatorKey;
  final bool isTab;
  final Stage? stage;
  final int tabItem;

  void _push(BuildContext context, String path, {MyJobCard? argument}) {
    Map routeBuilders;
    if (isTab)
      routeBuilders = _tabRouteBuilders(context, argument: argument);
    else
      routeBuilders = _routeBuilders(context, argument: argument);

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => routeBuilders[path](context)));
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {MyJobCard? argument, MyJobCard2? argument2}) {
    return {
      "not_Started_Screen": (context) =>
          MainPagePhone(stage: Stage.Not_Started, onPush: _push),
      "in_Progress_Screen": (context) =>
          MainPagePhone(stage: Stage.In_Progress, onPush: _push),
      "waiting_For_Approval_Screen": (context) =>
          MainPagePhone(stage: Stage.Waiting, onPush: _push),
      "approved_Screen": (context) =>
          MainPagePhone(stage: Stage.Approved, onPush: _push),
      "job_Card_Screen": (context) =>
          JobPagePhone(onPush: _push, jobCard: argument ?? MyJobCard()),
      "actual_Employees": (context) => ActualResourcesPhone(
          resource: Resource.Employee,
          onPush: _push,
          jobCard: argument ?? MyJobCard(),
          jobCard2: argument2 ?? MyJobCard2()
          ),
      "actual_Equipments": (context) => ActualResourcesPhone(
          resource: Resource.Equipment,
          onPush: _push,
          jobCard: argument ?? MyJobCard(),
          jobCard2: argument2 ?? MyJobCard2()),
      "login": (context) => LoginPage(),
      "account": (context) => AccountPage()
    };
  }

  Map<String, WidgetBuilder> _tabRouteBuilders(BuildContext context,
      {MyJobCard? argument}) {
    return {
      "not_Started_Screen": (context) =>
          TabMainScreen(stage: Stage.Not_Started, onPush: _push),
      "in_Progress_Screen": (context) =>
          TabMainScreen(stage: Stage.In_Progress, onPush: _push),
      "waiting_For_Approval_Screen": (context) =>
          TabMainScreen(stage: Stage.Waiting, onPush: _push),
      "approved_Screen": (context) =>
          TabMainScreen(stage: Stage.Approved, onPush: _push),
      "job_Card_Screen": (context) =>
          TabJobScreen(onPush: _push, jobCard: argument ?? MyJobCard()),
      "actual_Employees": (context) => TabActualResources(
          resource: Resource.Employee,
          onPush: _push,
          jobCard: argument ?? MyJobCard()),
      "actual_Equipments": (context) => TabActualResources(
          resource: Resource.Equipment,
          onPush: _push,
          jobCard: argument ?? MyJobCard()),
      "login": (context) => LoginPage(),
      "account": (context) => AccountPage()
    };
  }

  String? _stageToString(Stage? st) {
    switch (st) {
      case null:
      case Stage.Not_Started:
        return "not_Started_Screen";
      case Stage.In_Progress:
        return "in_Progress_Screen";
      case Stage.Waiting:
        return "waiting_For_Approval_Screen";
      case Stage.Approved:
        return "approved_Screen";
    }
  }

  @override
  Widget build(BuildContext context) {
    Map routeBuilders;
    if (isTab)
      routeBuilders = _tabRouteBuilders(context);
    else
      routeBuilders = _routeBuilders(context);

    return Navigator(
        key: navigatorKey,
        initialRoute: _stageToString(stage),
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
              builder: (context) => routeBuilders[routeSettings.name](context));
        });
  }
}
