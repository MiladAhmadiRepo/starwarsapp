import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'appTheme.dart';

String appName = "StartWarsMovies";

class ConstantClass {}

BuildContext globalContext = null;

//Webservice Urls
String baseUrl = "https://swapi.dev/api";
String moviesSubDomain = "/films";
String peopleSubDomain = "/people";
String subDomain = "/?";
String slash = "/";
String andSection = "&";
String searchSubDomain = "search=";
String pagingSubDomain = "page=";

//image address
String movieIconPath = 'assets/images/film_roll.svg';
String aboutIconPath = 'assets/images/information.svg';
String characterIconPath = 'assets/images/superhero.svg';
String logoIconPath = 'assets/images/death_star.png';
String imageList1Path = 'assets/images/pic1.jpg';
String imageList2Path = 'assets/images/pic2.jpg';
String imageList3Path = 'assets/images/pic3.jpg';
String imageList4Path = 'assets/images/pic4.jpg';
String imageList5Path = 'assets/images/pic5.jpg';
String imageList6Path = 'assets/images/pic6.png';

//percentSize
double percentChannelBack = 0.25;
double heightPercent = MediaQuery.of(globalContext).size.height * 0.27;
double width7Percent = MediaQuery.of(globalContext).size.width * 0.07;
double width1Percent = MediaQuery.of(globalContext).size.width * 0.01;
double width4Percent = MediaQuery.of(globalContext).size.width * 0.04;
double width6Percent = MediaQuery.of(globalContext).size.width * 0.06;
double width10Percent = MediaQuery.of(globalContext).size.width * 0.1;
double width20Percent = MediaQuery.of(globalContext).size.width * 0.25;
double width15Percent = MediaQuery.of(globalContext).size.width * 0.25;
double fullWidth = MediaQuery.of(globalContext).size.width;
double fullHeight = MediaQuery.of(globalContext).size.height;

//margins
double marginLow = MediaQuery.of(globalContext).size.width * 0.05;
double margin2Low = MediaQuery.of(globalContext).size.width * 0.03;
double marginHeight = MediaQuery.of(globalContext).size.height * 0.022;
double bottomNavigationHeight = MediaQuery.of(globalContext).size.height * 0.08;
double insertedHistoryRecordId = 0.0;
String selectedWeldByCode = "sfd";

//image widgets
Widget movieIconSvg = SvgPicture.asset(
  movieIconPath,
  width: MediaQuery.of(globalContext).size.width * 0.08,
  fit: BoxFit.fitWidth,
  color: AppTheme.light_grey,
);

Widget characterIconSvg = SvgPicture.asset(
  characterIconPath,
  width: MediaQuery.of(globalContext).size.width * 0.08,
  fit: BoxFit.fitWidth,
  color: AppTheme.light_grey,
);

Widget aboutIconSvg = SvgPicture.asset(
  aboutIconPath,
  width: MediaQuery.of(globalContext).size.width * 0.08,
  fit: BoxFit.fitWidth,
  color: AppTheme.light_grey,
);

Widget movieSelectedIconSvg = SvgPicture.asset(
  movieIconPath,
  width: MediaQuery.of(globalContext).size.width * 0.08,
  fit: BoxFit.fitWidth,
  color: AppTheme.amberLight,
);

Widget characterSelectedIconSvg = SvgPicture.asset(
  characterIconPath,
  width: MediaQuery.of(globalContext).size.width * 0.08,
  fit: BoxFit.fitWidth,
  color: AppTheme.amberLight,
);

Widget aboutSelectedIconSvg = SvgPicture.asset(
  aboutIconPath,
  width: MediaQuery.of(globalContext).size.width * 0.08,
  fit: BoxFit.fitWidth,
  color: AppTheme.amberLight,
);

Widget logoImage = Image(
    width: MediaQuery.of(globalContext).size.width * 0.08,
    image: AssetImage(logoIconPath),
    fit: BoxFit.fitWidth);

Widget imageList1Image = ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: Image(
      image: AssetImage(imageList1Path), fit: BoxFit.fitWidth),
);
Widget imageList2Image = ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: Image(
      image: AssetImage(imageList2Path), fit: BoxFit.fitWidth),
);
Widget imageList3Image = ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: Image(
      image: AssetImage(imageList3Path), fit: BoxFit.fitWidth),
);
Widget imageList4Image = ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: Image(
      image: AssetImage(imageList4Path), fit: BoxFit.fitWidth),
);
Widget imageList5Image = ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: Image(
      image: AssetImage(imageList5Path), fit: BoxFit.fitWidth),
);
Widget imageList6Image = ClipRRect(
  borderRadius: BorderRadius.circular(8.0),
  child: Image(
      image: AssetImage(imageList6Path), fit: BoxFit.fitWidth),
);

