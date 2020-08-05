import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// https://stackoverflow.com/questions/48481590/how-to-set-update-sate-of-statefulwidget-from-other-statefulwidget-in-flutter

final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

// final bool ProgressIndicatorIsVisible = true;

enum VisibilityFlag {
  visible,
  invisible,
  offscreen,
  gone,
}

// Singleton Class
class AppGlobalState {
  static final AppGlobalState _appGlobalState = new AppGlobalState._internal();
  bool hdrProgIndicIsVisible = false;
  String currentCulture = "ar-SA";
  String baseUrl = 'http://mas.gov.sa';
  String apiUrl = 'http://pub.mas.gov.sa';
  String kenticoUrl ='http://ecom.mas.gov.sa/api';
  String stsUrl = 'http://sts.mas.gov.sa/api/token';

// String 
  factory AppGlobalState() {
    return _appGlobalState;
  }

  AppGlobalState._internal() {
    //... // initialization logic here
  }

}
