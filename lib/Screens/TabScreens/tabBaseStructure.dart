// import 'package:airpmp_mobility/utilities/constants/colors.dart';
// import 'package:airpmp_mobility/utilities/widgets/tabSideNavMenu.dart';
// import 'package:flutter/material.dart';

// class TabBaseStructure extends StatelessWidget {
//   final Widget child;
//   const TabBaseStructure({Key? key, required this.child}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           // Side Navigation Rail
//           // Navigation rail Widget not used due to the lack of proper trailing property
//           Container(
//             color: CustomColors.primary,
//             child: Column(
//               children: [
//                 Container(
//                     width: 100,
//                     margin: EdgeInsets.symmetric(vertical: 25),
//                     child: Image.asset("assets/images/airpmo.png")),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 25),
//                   child: Icon(Icons.dashboard,
//                       color: CustomColors.icon_not_selected),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 25),
//                   child: Icon(Icons.card_giftcard_outlined,
//                       color: CustomColors.secondary),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 25),
//                   child:
//                       Icon(Icons.edit, color: CustomColors.icon_not_selected),
//                 ),
//                 Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 25),
//                   child: Icon(Icons.settings_outlined,
//                       color: CustomColors.icon_not_selected),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 25),
//                   child:
//                       Icon(Icons.logout, color: CustomColors.icon_not_selected),
//                 )
//               ],
//             ),
//           ),

//           Expanded(flex: 30, child: SideNavMenu()),
//           Expanded(
//               flex: 78,
//               child: Padding(padding: const EdgeInsets.all(15.0), child: child))
//         ],
//       ),
//     );
//   }
// }
