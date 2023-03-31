import 'package:airpmp_mobility/Constants/Colors.dart';
import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  /// Width should be given by wrapping inside a bouded widget

  const CustomRoundedButton(
      {Key? key, required this.label, required this.onPressed, this.iconData})
      : super(key: key);
  final IconData? iconData;
  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: CustomColors.secondary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconData != null)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 5, 8),
                  child: Icon(
                    iconData,
                    color: Colors.white,
                  ),
                ),
              ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 8, 12, 8),
                child: Text(
                  label,
                  style: TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final Icon icon;
  final Color bgColor;
  final VoidCallback? onPressed;
  const CircleButton(
      {Key? key,
      required this.icon,
      this.bgColor = Colors.white,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
        padding: EdgeInsets.all(5),
        child: IconButton(
          icon: icon,
          onPressed: onPressed,
        ));
  }
}
