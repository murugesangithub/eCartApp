import 'package:ecartapp/model/apiresponse.dart';
import 'package:ecartapp/model/dropdown_model.dart';
import 'package:ecartapp/model/signupModel.dart';
import 'package:ecartapp/services/signup_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'Common/commonwidgets.dart';
import 'login.dart';

class UserRegister extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserRegisterFormState();
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
enum Gender { Male, Female }
TextStyle _formTextStyle =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 12.0);
BoxDecoration _fieldDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(4.0),
  border: Border.all(
    color: primaryColorLightCustom,
    width: 0.3,
  ),
);

class _UserRegisterFormState extends State<UserRegister> {
  SignUpService service = new SignUpService();
  List<DropdownMenuItem> categoryList;
  List<DropDownModel> dayList;
  List<DropDownModel> monthList;
  List<DropDownModel> yearList;

  String _email;
  String _firstName;
  String _lastName;
  String _gender;
  Object _dobDay;
  Object _dobMonth;
  Object _dobYear;
  String _password;
  String _phone;
  int _country;
  bool _terms = false;
  bool _termsHasError = true;
  final barColour = const Color(0xFF008c8d);
  final borderColor = const Color(0xFF18acad);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _firstNameFocusNode = FocusNode();
  FocusNode _lastNameFocusNode = FocusNode();
  FocusNode _genderFocusNode = FocusNode();
  // FocusNode _dobDateFocusNode = FocusNode();
  // FocusNode _dobMonthFocusNode = FocusNode();
  // FocusNode _dobYearFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _phoneFocusNode = FocusNode();
  //FocusNode _countryFocusNode = FocusNode();
  FocusNode _confirmFocusNode = FocusNode();

  ApiResponse<List<Country>> _apiResponse;
  List<Country> countryData;
  getCountries() async {
    _apiResponse = await service.getCountryList();
    countryData = _apiResponse.data != null ? _apiResponse.data : null;
  }

  @override
  void initState() {
    super.initState();
    categoryList = service.loadCategoryList();
    dayList = service.loadDaysList();
    monthList = service.loadMonthList();
    yearList = service.loadYearsList();
    //getCountryData();
    getCountries();
  }

  Future<void> registerUser() async {
    _formkey.currentState.save();
    print(_email.toString());
    setState(() {
      _termsHasError = false;
    });
    if (!_formkey.currentState.validate()) {
      return;
    }
    if (!_terms) {
      return;
    }

    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      print('Email Value : $_email');
      final signUpData = SignUpModel(
          email: _email,
          fullName: _firstName,
          password: _password,
          countryId: _country,
          mobile: _phone);
      final result = await service.registerUser(signUpData);

      final title = 'Success!';
      final text = result.error
          ? result.errorMessage ?? 'An Error Occured'
          : 'User Created! Kindly activate user from your Mail.';

      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text(title),
                content: Text(text),
                actions: <Widget>[
                  FlatButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              )).then((data) {
        if (result.data) {
          Navigator.of(context).pop();
        }
      });
    }
  }

  //String _datenow = DateFormat('dd-MM-yyyy').format(DateTime.now());
  DateTime selectedDate = DateTime.now();
  TextEditingController _dobDate = new TextEditingController();
  Future<void> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 1),
        lastDate: DateTime(2021));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        //_dobDate = picked.toString();
        _dobDate.value = TextEditingValue(
            text: DateFormat('dd-MM-yyyy').format(selectedDate));
      });
  }

  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  Gender _genderval = Gender.Male;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text('Signup'),
        backgroundColor: barColour,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height + 50,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFF006464),
            Color(0xFF008c8d),
            Color(0xFF27b5b6)
          ])),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: new AssetImage('lib/assets/maslogo.png'),
                          width: MediaQuery.of(context).size.width * 0.40,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Signup to use our service',
                        style: TextStyle(fontSize: 18, color: barColour),
                      ),
                      SizedBox(height: 20),
                      EmailTextField(
                          currentFocus: _emailFocusNode,
                          moveTo: TextInputAction.next,
                          onSaved: (String value) {
                            _email = value;
                          },
                          onFieldSubmitted: (_) {
                            fieldFocusChange(
                                context, _emailFocusNode, _firstNameFocusNode);
                          }),
                      NormalTextField(
                        hint: 'First Name',
                        icon: Icons.verified_user,
                        currentFocus: _firstNameFocusNode,
                        moveTo: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          fieldFocusChange(
                              context, _firstNameFocusNode, _lastNameFocusNode);
                        },
                        onSaved: (String value) {
                          _firstName = value;
                        },
                      ),
                      NormalTextField(
                        hint: 'Last Name',
                        icon: Icons.verified_user,
                        currentFocus: _lastNameFocusNode,
                        moveTo: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          fieldFocusChange(
                              context, _lastNameFocusNode, _firstNameFocusNode);
                        },
                        onSaved: (String value) {
                          _firstName = value;
                        },
                      ),
                      PhoneTextField(
                        hint: 'Phone',
                        icon: Icons.phone_android,
                        currentFocus: _phoneFocusNode,
                        moveTo: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          fieldFocusChange(
                              context, _phoneFocusNode, _firstNameFocusNode);
                        },
                        onSaved: (String value) {
                          _phone = value;
                        },
                      ),
                      //buildCountry(),
                      PasswordField(
                        hint: "Password",
                        icon: Icons.fingerprint,
                        currentFocus: _passwordFocusNode,
                        moveTo: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          fieldFocusChange(
                              context, _passwordFocusNode, _firstNameFocusNode);
                        },
                        onSaved: (String value) {
                          _password = value;
                        },
                      ),
                      PasswordField(
                        hint: "Confirm Password",
                        icon: Icons.fingerprint,
                        currentFocus: _confirmFocusNode,
                        moveTo: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          fieldFocusChange(
                              context, _confirmFocusNode, _firstNameFocusNode);
                        },
                        onSaved: (String value) {
                          _password = value;
                        },
                      ),
                      //SizedBox(height: 30),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: _fieldDecoration,
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Transform.translate(
                                offset: const Offset(0.0, 5.0),
                                child: Text(
                                  'Gender :',
                                  style: _formTextStyle,
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0.0, -5.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: RadioListTile<Gender>(
                                          value: Gender.Male,
                                          groupValue: _genderval,
                                          title: Text(
                                            'Male',
                                            style: _formTextStyle,
                                          ),
                                          onChanged: (val) {
                                            print("Radio Tile pressed $val");
                                            setState(() {
                                              _genderval = val;
                                            });
                                          },
                                          activeColor: Colors.green,
                                        ),
                                      ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: RadioListTile<Gender>(
                                          value: Gender.Female,
                                          groupValue: _genderval,
                                          title: Text(
                                            'Female',
                                            style: _formTextStyle,
                                          ),
                                          onChanged: (val) {
                                            print("Radio Tile pressed $val");
                                            setState(() {
                                              _genderval = val;
                                            });
                                          },
                                          activeColor: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: _fieldDecoration,
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Transform.translate(
                                offset: const Offset(0.0, 5.0),
                                child: Text(
                                  'Date of birth :',
                                  style: _formTextStyle,
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(0.0, -5.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: BuildDropdown(
                                            hint: 'Day',
                                            ddValue: _dobDay,
                                            ddItems: dayList,
                                            icon: Icons.calendar_today,
                                            onChanged: (value) {
                                              setState(() {
                                                _dobDay = value;
                                              });
                                            }),
                                      ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: BuildDropdown(
                                            hint: 'Month',
                                            ddValue: _dobMonth,
                                            ddItems: monthList,
                                            icon: Icons.calendar_today,
                                            onChanged: (value) {
                                              setState(() {
                                                _dobMonth = value;
                                              });
                                            }),
                                      ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: BuildDropdown(
                                            hint: 'Year',
                                            ddValue: _dobYear,
                                            ddItems: yearList,
                                            icon: Icons.calendar_today,
                                            onChanged: (value) {
                                              setState(() {
                                                _dobYear = value;
                                              });
                                            }),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5.0),
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: _fieldDecoration,
                        child: GestureDetector(
                          onTap: () => selectDate(context),
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: _dobDate,
                              // initialValue: DateFormat('dd-MM-yyyy')
                              //     .format(selectedDate), //.toString(),
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                //hintText: 'Date of Birth',
                                labelText: 'Date of Birth',
                                labelStyle: _formTextStyle,
                                border: InputBorder.none,
                                suffixIcon: Icon(
                                  Icons.calendar_today,
                                  color: primaryColorLightCustom,
                                ),
                              ),
                              validator: (value) =>
                                  value == null ? 'Select DOB' : null,
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   height: 200,
                      //   child: CupertinoDatePicker(
                      //     mode: CupertinoDatePickerMode.date,
                      //     initialDateTime: DateTime(1969, 1, 1),
                      //     onDateTimeChanged: (DateTime newDateTime) {
                      //       // Do something
                      //     },
                      //   ),
                      // ),
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: _terms,
                                onChanged: (bool value) {
                                  setState(() {
                                    _terms = value;
                                  });
                                },
                              ),
                              Flexible(
                                child:
                                    //Padding(padding: EdgeInsets.only(top: 20)),
                                    Text(
                                  'I have read and agree to the terms of service.',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                ),
                              )
                            ],
                          ),
                          Text(
                            _terms == false && _termsHasError == false
                                ? 'You need to accept terms'
                                : '',
                            style:
                                TextStyle(color: Theme.of(context).errorColor),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 170,
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(35, 15, 10, 15),
                          onPressed: registerUser,
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.fingerprint,
                                size: 25,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          color: barColour,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0))),
                        ),
                      ),
                      SizedBox(height: 10),
                      FlatButton(
                          color: Colors.transparent,
                          onPressed: () {
                            //print('Flat Button pressed');
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text(
                            'Sign in to existing account',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.normal),
                          )),
                      // SizedBox(height: 10),
                      // SizedBox(
                      //   width: 170,
                      //   child: RaisedButton(
                      //     padding: EdgeInsets.fromLTRB(45, 15, 10, 15),
                      //     onPressed: () {
                      //       // if (!_formkey.currentState.validate()) {
                      //       //   return;
                      //       // }
                      //       // _formkey.currentState.save();
                      //     },
                      //     child: Row(
                      //       children: <Widget>[
                      //         Icon(
                      //           Icons.help_outline,
                      //           size: 25,
                      //           color: Colors.white,
                      //         ),
                      //         SizedBox(width: 10),
                      //         Text(
                      //           'Help',
                      //           style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 18,
                      //               fontWeight: FontWeight.bold),
                      //           textAlign: TextAlign.center,
                      //         ),
                      //       ],
                      //     ),
                      //     color: barColour,
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(30.0))),
                      //   ),
                      // ),
                      // Column(
                      //   children: <Widget>[
                      //     SizedBox(height: 20),
                      //     SizedBox(
                      //       width: 300,
                      //       child: RaisedButton(
                      //         padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      //         onPressed: () {
                      //           Navigator.pushReplacement(
                      //               context,
                      //               MaterialPageRoute(
                      //                   builder: (context) => Login()));
                      //         },
                      //         child: Row(
                      //           children: <Widget>[
                      //             Icon(Icons.fingerprint,
                      //                 size: 25, color: Colors.white),
                      //             SizedBox(width: 10),
                      //             Text(
                      //               'Ministry Employess log in',
                      //               style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: 18,
                      //                   fontWeight: FontWeight.bold),
                      //               textAlign: TextAlign.center,
                      //             ),
                      //           ],
                      //         ),
                      //         color: Color(0XFFff9801),
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(30.0))),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(height: 150),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
