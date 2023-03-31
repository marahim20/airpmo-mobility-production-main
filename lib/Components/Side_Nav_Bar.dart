import 'package:airpmp_mobility/Components/stageCard.dart';
import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:airpmp_mobility/Constants/Enums.dart';
import 'package:airpmp_mobility/Models/ProviderModel.dart';
import 'package:airpmp_mobility/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideNavBar extends StatelessWidget {
  final bool isTab;
  final onSelected;
  SideNavBar({Key? key, required this.isTab, required this.onSelected})
      : super(key: key);

  final List<Stage> stages = [
    Stage.Not_Started,
    Stage.In_Progress,
    Stage.Waiting,
    Stage.Approved
  ];

  final List<IconData> icons = [
    Icons.not_started,
    Icons.construction,
    Icons.timelapse,
    Icons.approval,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 236, 241, 240),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
                height: isTab ? 100 : 50,
                child: Center(
                  child: Text("Job Cards",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                )),
            for (int i = 0; i < 4; i++)
              Expanded(
                  child: Align(
                alignment: Provider.of<ProviderModel>(context).stageSelection ==
                        stages[i]
                    ? Alignment.center
                    : Alignment.centerLeft,
                child: StageCard(
                    stage: stages[i],
                    icon: icons[i],
                    onPressed: () {
                      onSelected(stages[i]);
                    },
                    text: stageToString(stages[i])!),
              )),
            if (isTab) SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
