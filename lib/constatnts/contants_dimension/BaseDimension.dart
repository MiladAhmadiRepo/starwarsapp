import 'package:flutter/material.dart';

import 'PhoneDimension.dart';
import 'TabletDimension.dart';

class BaseDimension {
  static Map<String, double> getDimen = {
    //font size
    'fontVerySmall': 6,
    'fontMedium': 8,
    'fontLarge': 10,
    'fontXLarge': 12,
    'fontxxLarge': 15,
    'fontxxxLarge': 18,
    'fontxxxxLarge': 22,
    // padding
    'padding2': 2,
    'padding5': 5,
    'padding10': 10,
    'padding20': 20,
  };
  static Map<int, double> getNumber= {
    1  : 1.0  ,
    2  : 2.0  ,
    3  : 3.0  ,
    4  : 4.0  ,
    5  : 5.0  ,
    6  : 6.0  ,
    7  : 7.0  ,
    8  : 8.0  ,
    9  : 9.0  ,
    10 : 10.0 ,
    11 : 11.0 ,
    12 : 12.0 ,
    13 : 13.0 ,
    14 : 14.0 ,
    15 : 15.0 ,
    16 : 16.0 ,
    17 : 17.0 ,
    18 : 18.0 ,
    19 : 19.0 ,
    20 : 20.0 ,
    21 : 21.0 ,
    22 : 22.0 ,
    23 : 23.0 ,
    24 : 24.0 ,
    25 : 25.0 ,
    26 : 26.0 ,
    27 : 27.0 ,
    28 : 28.0 ,
    29 : 29.0 ,
    30 : 30.0 ,
  };

  static String ScreenType = "phone";

  static void setScreenType(double maxWidth) {
    print('eee::'+maxWidth.toString());

    if (maxWidth > 600) {
      ScreenType = "tablet";
    } else {
      ScreenType = "phone";
    }
  }

  static double getFontSize(String fontName) {
    print('ddd::'+ScreenType.toString());

    if (ScreenType == "phone") {
      return PhoneDimension.getDimen[fontName];
      //copyMap( PhoneDimension.getDimen);
    } else {
      return TabletDimension.getDimen[fontName];
    }
  }

  static double getPadding(String padding) {
    if (ScreenType == "phone") {
      return PhoneDimension.getDimen[padding];
      //copyMap( PhoneDimension.getDimen);
    } else {
      return TabletDimension.getDimen[padding];
    }
  }

  static double getMyDimen(double dimen){
    if (ScreenType == "phone") {
      return PhoneDimension.getNumber[dimen];
    } else {
      return TabletDimension.getNumber[dimen];
    }
  }

  static void copyMap(Map<String, double> newMap) {
    newMap.forEach((k, v) {
      getDimen.update(k, (v) {
        return newMap[k];
      });
    });
  }
}
