import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:flutter/material.dart';

class JobListTile extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String iD;
  const JobListTile(
      {Key? key, required this.text, required this.iD, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          height: 64,
          decoration: BoxDecoration(
              color: CustomColors.primary,
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Container(
                  width: 50,
                  child: Center(
                    child: Text(iD),
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        text,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
