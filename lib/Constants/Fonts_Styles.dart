import 'package:flutter/material.dart';

abstract class CustomTextStyles {
//=========================== TEXT STYLES ===========================
  static const TextStyle Main_title = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );

  static const TextStyle Main_subtitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static const TextStyle White_subtitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: Colors.white,
  );

  static const TextStyle CardText = TextStyle(
    fontSize: 17,
    color: Colors.white,
  );

  static const White_title = TextStyle(
    fontSize: 25.0,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

//=========================== BUTTON STYLES ===========================
  static const TextStyle Button_subtitle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle Button_green = TextStyle(
    color: Color(0xff57D1AF),
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
//=========================== TEXTFIELD STYLES ===========================

  static const TextStyle Hint_style = TextStyle(
    fontSize: 16,
    color: Color(0xffC1C1C1),
  );

//=========================== OTHER STYLES ===========================

  static const TextStyle Listtile_Title = TextStyle();
  static const TextStyle Appbar_title = TextStyle();
}
