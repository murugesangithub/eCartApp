import 'package:ecartapp/assets/theme_colors.dart';
import 'package:ecartapp/util/helper.dart';
import 'package:flutter/material.dart';

bool connection = true;

class NoConnection extends StatefulWidget {
  @override
  _NoConnectionState createState() => _NoConnectionState();
}

class _NoConnectionState extends State<NoConnection> {
  @override
  void initState() {
    super.initState();
  }

  void checkConnectivity() {
    hasConnection().then((value) {
      setState(() {
        connection = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    checkConnectivity();
    return connection
        ? SizedBox(height: 1)
        : Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
              border: Border.all(
                color: primaryColorLightCustom,
                width: 0.3,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'TODO', //AppLocalizations.of(context).msgNoConnection,
                  style: TextStyle(
                      color: primaryColorLightCustom,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0),
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
