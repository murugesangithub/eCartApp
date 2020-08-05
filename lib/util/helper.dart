import 'package:ecartapp/assets/styles.dart';
import 'package:ecartapp/assets/theme_colors.dart';
import 'package:ecartapp/model/dialog_type_model.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:connectivity/connectivity.dart';
import 'package:intl/intl.dart';
// import 'package:downloads_path_provider/downloads_path_provider.dart';

showSnackBar(BuildContext ctx, String message, {bool accent = false}) {
  Scaffold.of(ctx).showSnackBar(masSnackBar(message: message, accent: accent));
}

Widget masSnackBar(
    {@required String message, bool accent = false, SnackBarAction action}) {
  return SnackBar(
      backgroundColor: accent ? accentColorCustom : primaryColorLightCustom,
      content: Text(
        message,
        style:
            titleTextStyleWhite(), // accent ? descriptionTextStyle() : titleTextStyleWhite(),
      ),
      action: action);
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

String handleRequestType(BuildContext ctx, String type) {
  String retVal = type;
  // switch (type.toUpperCase()) {
  //   case "CU_INFO_REQUEST":
  //     retVal = AppLocalizations.of(ctx).lblInfoRequest;
  //     break;
  //   case "P_SPECIAL_REQUEST":
  //     retVal = AppLocalizations.of(ctx).lblInfoRequest;
  //     break;
  //   case "CU_SUGGESTIONS":
  //     retVal = AppLocalizations.of(ctx).lblCommentsRequest;
  //     break;
  //   case "CU_COMMENTS":
  //     retVal = AppLocalizations.of(ctx).lblCommentsRequest;
  //     break;
  //   case "TECH_SUPPORT":
  //     retVal = AppLocalizations.of(ctx).lblTechSupportRequest;
  //     break;
  // }

  return retVal;
}

String handleRequestStatus(BuildContext ctx, String status) {
  String retVal = status;
  // switch (status.toUpperCase()) {
  //   case "OPEN":
  //     retVal = AppLocalizations.of(ctx).lblOpen;
  //     break;
  //   case "CLOSED":
  //     retVal = AppLocalizations.of(ctx).lblClosed;
  //     break;
  //   case "WAITING":
  //     retVal = AppLocalizations.of(ctx).lblWaiting;
  //     break;
  // }
  return retVal;
}

Widget labelCell(String lbl) {
  return Container(
    margin: EdgeInsets.all(2.0),
    padding: EdgeInsets.all(5.0),
    decoration: BoxDecoration(color: primaryColorLightCustom),
    child: Text(lbl, style: descriptionTextStyleWhite()),
  );
}

Widget labelCellAccent(String lbl) {
  return Container(
    margin: EdgeInsets.all(2.0),
    padding: EdgeInsets.all(5.0),
    decoration: BoxDecoration(color: accentColorCustom),
    child: Text(lbl, style: descriptionTextStyle()),
  );
}

Widget valueCell(String value, {bool showIcon = false, Icon icon}) {
  return Container(
    margin: EdgeInsets.all(2.0),
    padding: EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      color: bottomBarCustom,
    ),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Text(
            value,
            style: descriptionTextStyle(),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        showIcon ? icon : Container(),
      ],
    ),
  );
}

Icon handleRequestIcon(String requestStatus) {
  return requestStatus.toUpperCase() == 'CLOSED'
      ? Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 20.0,
        )
      : requestStatus.toUpperCase() == 'WAITING'
          ? Icon(
              Icons.info_outline,
              color: Colors.red,
              size: 20.0,
            )
          : Icon(
              Icons.report_problem,
              color: Colors.orange,
              size: 20.0,
            );
}

Widget labelRequestSbjctCell(String lbl) {
  return Container(
    margin: EdgeInsets.all(2.0),
    padding: EdgeInsets.all(5.0),
    decoration: BoxDecoration(color: borderCustom),
    child: Text(lbl,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12.0)),
  );
}

Widget valueRequestSbjctCell(String value, {bool showIcon = false, Icon icon}) {
  return Container(
    margin: EdgeInsets.all(2.0),
    padding: EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      border: Border.all(
        color: borderCustom,
        width: 0.3,
      ),
      // color: bottomBarCustom,
    ),
    child: Row(
      children: <Widget>[
        Text(
          value,
          style: descriptionTextStyle(),
        ),
      ],
    ),
  );
}

Widget htmlText(String txt, String currentLang) {
  return Html(
    data: txt,
    //Optional parameters:
    defaultTextStyle: descriptionTextStyle(),
    customTextAlign: (dom.Node node) {
      if (node is dom.Element) {
        switch (node.localName) {
          case "p":
            return currentLang == 'ar' ? TextAlign.right : TextAlign.left;
          default:
            return currentLang == 'ar' ? TextAlign.right : TextAlign.left;
          // TextAlign.right;
        }
      }
      return null;
    },
  );
}

void showMASDialog(BuildContext context, DialogType type, String title,
    String content, String firstActionText,
    {Function firstActionFun,
    String secondActionText,
    Function secondActionFunc}) {
  MaterialColor titleBackgoundColor;
  TextStyle titleTextStyle;
  switch (type) {
    case DialogType.Info:
      titleBackgoundColor = primaryColorLightCustom;
      titleTextStyle = descriptionTextStyleWhite();
      break;
    case DialogType.Success:
      titleBackgoundColor = Colors.green;
      titleTextStyle = descriptionTextStyleWhite();
      break;
    case DialogType.Fail:
      titleBackgoundColor = Colors.red;
      titleTextStyle = descriptionTextStyleWhite();
      break;
    case DialogType.Warning:
      titleBackgoundColor = accentColorCustom;
      titleTextStyle = descriptionTextStyle();
      break;
  }
  showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            titlePadding: EdgeInsets.all(0),
            backgroundColor: Colors.white,
            elevation: 2,
            // title: Row(
            //   children: <Widget>[
            //     Expanded(
            //       child: Container(
            //         padding: EdgeInsets.all(10.0),
            //         color: titleBackgoundColor,
            //         child: Text(
            //           title,
            //           style: titleTextStyle,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            title: Container(
              padding: EdgeInsets.all(10.0),
              color: titleBackgoundColor,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: titleBackgoundColor, width: 0.5),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.message,
                      color: titleBackgoundColor,
                      size: 15.0,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    title,
                    style: titleTextStyle,
                  ),
                ],
              ),
            ),
            content: Text(
              content,
              style: descriptionTextStylePrimary(),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(firstActionText, style: descriptionTextStyle()),
                onPressed: () {
                  Navigator.of(ctx).pop();
                  if (firstActionFun != null) firstActionFun();
                },
              ),
              secondActionText != null
                  ? FlatButton(
                      child:
                          Text(secondActionText, style: descriptionTextStyle()),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                        if (secondActionFunc != null) secondActionFunc();
                      },
                    )
                  : Container(),
            ],
          ));
}

Future<bool> hasConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    return false;
  } else {
    return true;
  }
}

Future<String> getSavePath() async {
  // Directory downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
  // String dir = downloadsDirectory.path.replaceFirst('file://', '');
  String dir;
  try {
    // Get path for Android
    dir = (await getExternalStorageDirectory()).path;
  } catch (error) {
    // Get path for IOS
    dir = (await getApplicationDocumentsDirectory()).path;
  }
  print(dir);
  return dir;
}

String formatedDate(DateTime dateTime, String format) {
  DateFormat dateFormat = DateFormat(format);
  return dateFormat.format(dateTime);
}
