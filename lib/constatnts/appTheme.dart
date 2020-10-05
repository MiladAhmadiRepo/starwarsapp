import 'package:flutter/material.dart';

import 'contants_dimension/BaseDimension.dart';

class AppTheme {
  AppTheme._();

  //colors
  static const double defaultScreenWidth = 601;
  static const double defaultScreenHeight = 913.4;
  static const Color PrimaryGreen = Color(0xFF3a933a);
  static const Color lightGreen = Colors.lightGreen;
  static const Color ButtonGrey = Color(0xFF3f3f3d);
  static const Color mainBlueDark = Color(0xFF1695a4);
  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color backSort = Color(0xFFf7f8fa);
  static const Color borderSort = Color(0xFFcfd0d0);
  static const Color borderSortActive = Color(0xFFf4feeb);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color greyBorder = Color(0xFFf2f5f7);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);
  static const Color light_grey = Color(0xFF707070);
  static const Color light_grey_hint = Color(0xFFb1b8ba);
  static const Color hint_back = Color(0xFFeeeeee);
  static const Color red = Color(0xFFFF0000);
  static const Color darkText = Color(0xFF253840);
  static const Color black = Color(0xFF000000);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color lightGrey = Color(0xffeeeeee);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const Color gray8 = Color(0xFFE8E8E8);
  static const Color backColorMainPage=Color(0xff141419);
  static const Color boxColorMainPage=Color(0xff212529);
  static const Color lightBlue= Color(0xff9CCCE7);
  static const Color blueStatic= Color(0xff9CCCE7);
  static const Color blueLightDark= Color(0xff217397);
  static const Color blueMiddle= Color(0xff217397);
  static const Color blueForDot= Color(0xff37A3D2);
  static const Color blueDark2= Color(0xff1A5A75);
  static const Color blueDark= Color(0xff102F42);
  static const Color whiteColor= Colors.white;
  static const Color purpel= Color(0xff8A716A);
  static const Color purpelLight= Color(0xffFDE8E9);
  static const Color backBluelLight= Color(0xff0d969d);
  static Color amberLight= Colors.amber[800];
  static Color amberVeryLight= Colors.amber[50];
  static Color blackLight= Colors.black38;

  //fontFamily
  static const String fontName = 'Roboto';
  static const String fontNameAppbar = 'AlienWars';

  //text style

  static TextStyle appbarTitleBig = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize:   BaseDimension.getMyDimen(18),
    color: AppTheme.red, // was lightGrey
  );

  static TextStyle lightGrey14Style = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w800,
    fontSize:  BaseDimension.getMyDimen(14),
    color: grey, // was lightGrey
  );

  static TextStyle lightBlackBig = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w800,
    fontSize:  BaseDimension.getMyDimen(14),
    color: black, // was lightGrey
  );

  static TextStyle errorTextField = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize:  BaseDimension.getMyDimen(14) ,
    color: Colors.red, // was lightGrey
  );

  static TextStyle lightGreyStyle = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w800,
    fontSize:  BaseDimension.getMyDimen(12),
    color: grey, // was lightGrey
  );

  static TextStyle rankAmbit = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w800,
    fontSize:  BaseDimension.getMyDimen(14),
    color: amberLight, // was lightGrey
  );

  static TextStyle lightBlack = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w800,
    fontSize:  BaseDimension.getMyDimen(14),
    color: black, // was lightGrey
  );

  static TextStyle AppbarBlack = TextStyle(
    // Caption -> caption
    fontFamily: fontNameAppbar,
    fontWeight: FontWeight.w800,
    fontSize:  BaseDimension.getMyDimen(16),
    color: black, // was lightGrey
  );

}
