import 'package:airpmp_mobility/Components/Side_Nav_Bar.dart';
import 'package:airpmp_mobility/Constants/Enums.dart';
import 'package:airpmp_mobility/Models/ProviderModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(
                child: SideNavBar(
              isTab: false,
              onSelected: (Stage st) {
                Provider.of<ProviderModel>(context, listen: false)
                    .changeStage(st);
                Navigator.pop(context);
              },
            )),
          ],
        ),
      ),
    );
  }
}
