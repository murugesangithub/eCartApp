import 'package:ecartapp/model/signupModel.dart';
import 'package:ecartapp/services/signup_service.dart';
import 'package:flutter/material.dart';
import 'registerUser.dart';
import 'login.dart';

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  SignUpService service = new SignUpService();

  final borderColor = const Color(0xFF18acad);
  final barColour = const Color(0xFF008c8d);
  String _email;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget buildEmail() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(15, 20, 15, 10),
      decoration: BoxDecoration(border: Border.all(color: borderColor)),
      child: TextFormField(
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Email (User ID) ',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.mail,
            color: barColour,
            size: 30,
          ),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Email (UserName) Is required';
          }
          if (!RegExp(
                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
              .hasMatch(value)) {
            return 'Please enter a valid email Address';
          }

          return null;
        },
        onSaved: (String value) {
          _email = value;
        },
        textInputAction: TextInputAction.done,
      ),
    );
  }

  Future<void> forgotPassword() async {
    if (!_formkey.currentState.validate()) {
      return;
    }
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      final userId = new ResetModel(email: _email);
      final result = await service.forgotPassword(userId);
      final title = 'Success';
      final textContent = result.error
          ? result.errorMessage ?? 'An Error Occured'
          : 'Reset password mail sent to your mail.';
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text(title),
                content: Text(textContent),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Ok'),
                  ),
                ],
              )).then((data) {
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text('Forgot password'),
        backgroundColor: barColour,
      ),
      body: Container(
        alignment: Alignment.center,
        //width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: new AssetImage('lib/assets/mas-background.jpg'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                borderColor.withOpacity(0.9), BlendMode.darken),
          ),
        ),
        //Users/senthilkumarramani/first_app/lib/assets/MAS-Logo.png
        child: Column(
          children: <Widget>[
            Container(
              constraints:
                  BoxConstraints(maxHeight: 200, maxWidth: 200, minHeight: 50),
              margin: EdgeInsets.only(top: 50.0),
              child: Image.asset('lib/assets/MAS-Logo.png'),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              //width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.45,
              margin:
                  EdgeInsets.only(left: 12, right: 12), //(12, 130, 12, 180),
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 7.0, color: Color(0xFFb3c2c2))),
                color: Colors.white,
              ),
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    //   child: Image(
                    //     image: new AssetImage('lib/assets/maslogo.png'),
                    //     width: MediaQuery.of(context).size.width * 0.70,
                    //   ),
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Details will send to your Email',
                      style: TextStyle(color: Colors.black45, fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                    buildEmail(),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(125, 20, 125, 20),
                        color: borderColor,
                        onPressed: forgotPassword,
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
                          width: 30,
                        ),
                        FlatButton(
                          color: Colors.transparent,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ));
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        FlatButton(
                          color: Colors.transparent,
                          onPressed: () {
                            //print('Flat Button pressed');
                            // Navigator.pushReplacement(
                            //     context,
                            Route route = MaterialPageRoute(
                                builder: (context) => RegisterUserForm());
                            Navigator.push(context, route);
                          },
                          child: Text(
                            'Create new account',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
