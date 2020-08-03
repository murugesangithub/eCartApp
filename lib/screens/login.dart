import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

void fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

Map<int, Color> _primaryColorLight = {
  50: Color.fromRGBO(0, 142, 142, .1),
  100: Color.fromRGBO(0, 142, 142, .2),
  200: Color.fromRGBO(0, 142, 142, .3),
  300: Color.fromRGBO(0, 142, 142, .4),
  400: Color.fromRGBO(0, 142, 142, .5),
  500: Color.fromRGBO(0, 142, 142, .6),
  600: Color.fromRGBO(0, 142, 142, .7),
  700: Color.fromRGBO(0, 142, 142, .8),
  800: Color.fromRGBO(0, 142, 142, .9),
  900: Color.fromRGBO(0, 142, 142, 1),
};
MaterialColor primaryColorLightCustom =
    MaterialColor(0xFF008E8E, _primaryColorLight);
final borderColor = const Color(0xFF18acad);
final barColour = const Color(0xFF008c8d);
TextStyle _formTextStyle =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 12.0);
BoxDecoration _fieldDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(4.0),
  border: Border.all(
    color: primaryColorLightCustom,
    width: 0.3,
  ),
);
FocusNode _emailFocusNode = FocusNode();
FocusNode _passwordFocusNode = FocusNode();

class _LoginState extends State<Login> {
  int counter = 1;
  // final barColour = const Color(0xFF99AAAB);
  final bgColour = const Color(0xFFb8c5ce);
  // final borderColor = const Color(0xFF18acad);
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: bgColour,
              ),
              child: Column(children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  //margin: EdgeInsets.fromLTRB(12.0, 50.0, 12.0, 10.0),
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    // border: Border(
                    //     top: BorderSide(width: 7.0, color: Color(0xFFb3c2c2))),
                    color: Colors.white,
                    // borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.fingerprint,
                            size: 25,
                            color: borderColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sign in',
                            style:
                                TextStyle(color: borderColor, fontSize: 18.0),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: _fieldDecoration,
                        child: TextFormField(
                          autofocus: true,
                          focusNode: _emailFocusNode,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: _formTextStyle,
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.person,
                              color: barColour,
                            ),
                            //labelText: 'Username',
                          ),
                          onFieldSubmitted: (_) {
                            fieldFocusChange(
                                context, _emailFocusNode, _passwordFocusNode);
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: _fieldDecoration,
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          focusNode: _passwordFocusNode,
                          autofocus: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: _formTextStyle,
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.lock_open,
                              color: barColour,
                            ),
                            //labelText: 'Password',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(120, 20, 120, 20),
                          color: borderColor,
                          onPressed: () {
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Home()));
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 50,
                          ),
                          FlatButton(
                            color: Colors.transparent,
                            onPressed: () {
                              // Route route = MaterialPageRoute(
                              //     builder: (context) => UserRegister());
                              // Navigator.push(context, route);
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          FlatButton(
                            color: Colors.transparent,
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           ForgotPasswordForm(),
                              //     ));
                            },
                            child: Text(
                              'Forget Password',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
