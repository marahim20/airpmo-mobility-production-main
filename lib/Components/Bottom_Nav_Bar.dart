import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final int currentTab;
  final Function onSelectTab;
  const BottomNavigation(
      {Key? key, required this.currentTab, required this.onSelectTab})
      : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: BottomNavigationBar(
          // iconSize: 28,
          selectedItemColor: CustomColors.secondary,
          unselectedItemColor: CustomColors.icon_not_selected,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: widget.currentTab,
          onTap: (i) {
            widget.onSelectTab(i);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: "Dashboard"),
            BottomNavigationBarItem(
                icon: Icon(Icons.workspaces), label: "Job Cards"),
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Remarks"),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  maxRadius: 14,
                ),
                label: "Account"),
          ]),
    );
  }
}
