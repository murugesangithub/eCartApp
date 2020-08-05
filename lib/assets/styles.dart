import 'package:ecartapp/assets/theme_colors.dart';
import 'package:flutter/material.dart';

class MASCardContainer extends StatelessWidget {
  final Widget child;

  MASCardContainer({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(4.0),
        boxShadow: [
          new BoxShadow(
              color: Colors.black26,
              offset: new Offset(0.5, 0.5),
              blurRadius: 0.5),
        ],
      ),
      child: child,
    );
  }
}

class MASHeaderContainer extends StatelessWidget {
  final Widget child;

  MASHeaderContainer({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: accentColorCustom,
        // borderRadius: BorderRadius.circular(4.0),
        boxShadow: [
          new BoxShadow(
              color: Colors.black26,
              offset: new Offset(0.5, 0.5),
              blurRadius: 0.5),
        ],
      ),
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          padding: EdgeInsets.all(10.0),
          color: Colors.white,
          child: child),
    );
  }
}

class MASHeader extends StatelessWidget {
  final String headerText;

  MASHeader({@required this.headerText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      color: primaryColorLightCustom,
      child: Text(
        headerText,
        style: titleTextStyleWhite(),
      ),
    );
  }
}

TextStyle titleTextStyle() {
  return TextStyle(
    color: primaryColorCustom,
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    height: 2.0,
  );
}

TextStyle titleTextStyleWhite() {
  return TextStyle(
    color: Colors.white,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    height: 2.0,
  );
}

TextStyle descriptionTextStyle() {
  return TextStyle(
      color: descriptionTextCustom,
      fontWeight: FontWeight.w400,
      fontSize: 12.0);
}

TextStyle descriptionTextStylePrimary() {
  return TextStyle(
      color: primaryColorCustom, fontWeight: FontWeight.w400, fontSize: 12.0);
}

TextStyle descriptionTextStyleWhite() {
  return TextStyle(
      color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12.0);
}

class MASButton extends StatelessWidget {
  final String buttonText;
  final Icon buttonIcon;
  final Function buttonFunc;

  MASButton(
      {@required this.buttonText, @required this.buttonFunc, this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: primaryColorLightCustom),
      child: FlatButton(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buttonIcon != null ? buttonIcon : Container(),
              SizedBox(width: buttonIcon != null ? 5.0 : 0.0),
              Text(
                buttonText, //AppLocalizations.of(context).lblDownloadMasBrochure,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0),
              ),
            ],
          ),
        ),
        onPressed: buttonFunc,
        // onPressed: () {
        //   downloadFile(_data['brochureLink'], 'MasBook.pdf');
        // },
      ),
    );
  }
}

class MASButtonAccent extends StatelessWidget {
  final String buttonText;
  final Icon buttonIcon;
  final Function buttonFunc;

  MASButtonAccent(
      {@required this.buttonText, @required this.buttonFunc, this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: accentColorCustom),
      child: FlatButton(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buttonIcon != null ? buttonIcon : Container(),
              SizedBox(width: buttonIcon != null ? 5.0 : 0.0),
              Text(
                buttonText, //AppLocalizations.of(context).lblDownloadMasBrochure,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0),
              ),
            ],
          ),
        ),
        onPressed: buttonFunc,
        // onPressed: () {
        //   downloadFile(_data['brochureLink'], 'MasBook.pdf');
        // },
      ),
    );
  }
}

class MASButtonView extends StatelessWidget {
  final String buttonText;
  final Icon buttonIcon;
  final Function buttonFunc;

  MASButtonView(
      {@required this.buttonText, @required this.buttonFunc, this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: skyBlue),
      child: FlatButton(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buttonIcon != null ? buttonIcon : Container(),
              SizedBox(width: buttonIcon != null ? 5.0 : 0.0),
              Text(
                buttonText, //AppLocalizations.of(context).lblDownloadMasBrochure,
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0),
              ),
            ],
          ),
        ),
        onPressed: buttonFunc,
        // onPressed: () {
        //   downloadFile(_data['brochureLink'], 'MasBook.pdf');
        // },
      ),
    );
  }
}
