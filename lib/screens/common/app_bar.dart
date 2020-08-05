import 'package:ecartapp/assets/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

Widget masAppBar(BuildContext context, String screenTitle) {
  return AppBar(
    primary: true,
    centerTitle: true,
    titleSpacing: 0.0,
    leading: Container(
      decoration: BoxDecoration(color: primaryColorLightCustom),
      child: new Builder(
        builder: (context) {
          return new IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          );
        },
      ),
    ),
    title: Container(
      // margin: EdgeInsets.all(0.0),
      padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 5.0),
      // height: double.maxFinite ,
      decoration: BoxDecoration(
        color: primaryColorLightCustom,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: AutoSizeText(screenTitle,
                maxLines: 1,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: Colors.white)),
          ),
        ],
      ),
    ),
  );
}
