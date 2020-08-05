import 'package:ecartapp/assets/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MASSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      itemBuilder: (_, int index) {
        return Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height / 4),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              color: primaryColorLightCustom,
            ),
          ),
        );
      },
    );
  }
}
