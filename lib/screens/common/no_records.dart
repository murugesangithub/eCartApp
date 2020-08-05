import 'package:ecartapp/assets/theme_colors.dart';
import 'package:flutter/material.dart';

class NoRecords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'TODO', //AppLocalizations.of(context).msgNoResultFound,
            style: TextStyle(
                color: primaryColorLightCustom,
                fontWeight: FontWeight.w500,
                fontSize: 16.0),
          ),
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.info_outline,
            color: primaryColorLightCustom,
          )
        ],
      ),
    );
  }
}
