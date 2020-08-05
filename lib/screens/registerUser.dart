import 'package:ecartapp/model/apiresponse.dart';
import 'package:ecartapp/model/dropdown_model.dart';
import 'package:ecartapp/model/signupModel.dart';
import 'package:ecartapp/services/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login.dart';

class RegisterUserForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterUserFormState();
}

class _RegisterUserFormState extends State<RegisterUserForm> {
  SignUpService service = new SignUpService();
  List<DropdownMenuItem> categoryList;

  String _email;
  String _name;
  String _password;
  String _phone;
  int _category;
  int _country;
  // String _confirmPassword;
  bool _terms = false;
  bool _termsHasError = true;
  final barColour = const Color(0xFF008c8d);
  final borderColor = const Color(0xFF18acad);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _nameFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _phoneFocusNode = FocusNode();
  FocusNode _categoryFocusNode = FocusNode();
  FocusNode _countryFocusNode = FocusNode();
  FocusNode _confirmFocusNode = FocusNode();

  Widget buildEmail() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(border: Border.all(color: borderColor)),
      child: TextFormField(
        focusNode: _emailFocusNode,
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
        onFieldSubmitted: (_) {
          fieldFocusChange(context, _emailFocusNode, _nameFocusNode);
        },
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Widget buildName() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(border: Border.all(color: borderColor)),
      child: TextFormField(
        focusNode: _nameFocusNode,
        decoration: InputDecoration(
          hintText: 'Full Name ',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.person_outline,
            color: barColour,
            size: 30,
          ),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'User Full Name Is required';
          }
          return null;
        },
        onSaved: (String value) {
          _name = value;
        },
        onFieldSubmitted: (_) {
          fieldFocusChange(context, _nameFocusNode, _phoneFocusNode);
        },
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Widget buildPhone() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(border: Border.all(color: borderColor)),
      child: TextFormField(
        focusNode: _phoneFocusNode,
        keyboardType: TextInputType.number,
        maxLength: 16,
        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          hintText: 'Mobile No ',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.stay_primary_portrait,
            color: barColour,
            size: 30,
          ),
        ),
        validator: (String value) {
          // String pattern = r'(^?[0-9]{8,16}$)';
          // RegExp regExp = new RegExp(pattern);
          if (value.isEmpty) {
            return 'Mobile No Is required';
          }
          if (value.length < 8) {
            return 'Please enter a valid Mobile Number';
          }
          // if(regExp.hasMatch(value)){
          //   return 'Please enter a valid Mobile Number';
          // }
          //   if (!RegExp(
          //           r"^\(\d\d\d\)\d\d\d\-\d\d\d\d$").hasMatch(value)) {
          //     return 'Please enter a valid Mobile Number';
          //   }
          // RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');
          return null;
        },
        onSaved: (String value) {
          _phone = value;
        },
        onFieldSubmitted: (_) {
          fieldFocusChange(context, _phoneFocusNode, _categoryFocusNode);
        },
        textInputAction: TextInputAction.done,
      ),
    );
  }

  Widget buildCategory() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(border: Border.all(color: borderColor)),
      child: DropdownButtonFormField(
        value: _category,
        icon: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.card_travel,
              color: barColour,
              size: 30,
            )),
        isExpanded: true,
        items: categoryList?.toList() ?? [],
        validator: (value) => value == null ? 'Select Category' : null,
        onChanged: (value) {
          print('Category : $value');
          setState(() {
            _category = value;
          });
          fieldFocusChange(context, _categoryFocusNode, _countryFocusNode);
          _formkey.currentState.save();
          print('Dropdown Value : $_category');
        },
        decoration: InputDecoration(
          hintText: 'Category',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget buildCountry() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(border: Border.all(color: borderColor)),
      child: DropdownButtonFormField(
        value: _country,
        icon: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.language,
              color: barColour,
              size: 30,
            )),
        isExpanded: true,
        validator: (value) => value == null ? 'Select Country' : null,
        items: countryData?.map((item) {
              return DropdownMenuItem(
                child: Text(item.enName),
                value: item.id,
              );
            })?.toList() ??
            [],
        onChanged: (value) {
          print('Country : $value');
          setState(() {
            _country = value;
          });
          fieldFocusChange(context, _countryFocusNode, _passwordFocusNode);
        },
        decoration: InputDecoration(
          hintText: 'Country',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget buildPassWord() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(border: Border.all(color: borderColor)),
      child: TextFormField(
        focusNode: _passwordFocusNode,
        maxLength: 12,
        decoration: InputDecoration(
          hintText: 'Password ',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.lock_open,
            color: barColour,
            size: 30,
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Password Is required';
          }
          if (value.length < 6) {
            return 'Password minimum length is 6';
          }

          _formkey.currentState.save();
          return null;
        },
        onSaved: (String value) {
          _password = value;
        },
        onFieldSubmitted: (_) {
          fieldFocusChange(context, _passwordFocusNode, _confirmFocusNode);
        },
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Widget buildConfirmPassword() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(border: Border.all(color: borderColor)),
      child: TextFormField(
        focusNode: _confirmFocusNode,
        maxLength: 12,
        decoration: InputDecoration(
          hintText: 'Confirm Password ',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.lock,
            color: barColour,
            size: 30,
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Confirm Password Is required';
          }
          if (value.length < 6) {
            return 'Password minimum length is 6';
          }
          if (value != _password) {
            print('password: $_password');
            print('Confirm pwd: $value');
            return 'Confirm Password should match Paaword';
          }
          return null;
        },
        // onSaved: (String value) {
        //   _confirmPassword = value;
        // },
        textInputAction: TextInputAction.done,
      ),
    );
  }

// void loadCategoryList(){
//   categoryList = [];
//     categoryList.add(new DropdownMenuItem(
//     child: Text('Government'),value: 'Government',),
//     );
//     categoryList.add(new DropdownMenuItem(
//     child: Text('Private Sector'),value: 'Private Sector',),
//     );
//     categoryList.add(new DropdownMenuItem(
//     child: Text('Student'),value: 'Student',),
//     );
//     categoryList.add(new DropdownMenuItem(
//     child: Text('Researcher'),value: 'Researcher',),
//     );
// }

  ApiResponse<List<Country>> _apiResponse;
  List<Country> countryData;
  getCountries() async {
    _apiResponse = await service.getCountryList();
    countryData = _apiResponse.data != null ? _apiResponse.data : null;
  }

// final String serviceUrl = 'http://pub.mas.gov.sa/api/';
// List<dynamic> countryData;
//  void getCountryData() async{
//   var response = await http.get(serviceUrl + 'countries');
//   var listData = jsonDecode(response.body);
//     setState(() {
//       countryData = listData;
//     });
//     //print('Data : $countryData');
// }

  @override
  void initState() {
    super.initState();
    categoryList = service.loadCategoryList();
    //getCountryData();
    getCountries();
  }

  Future<void> registerUser() async {
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
      final signUpData = SignUpModel(
          email: _email,
          fullName: _name,
          password: _password,
          countryId: _country,
          mobile: _phone,
          userType: _category);
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
                margin: EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 20.0),
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(width: 7.0, color: Color(0xFFb3c2c2))),
                  color: Colors.white,
                  // borderRadius: BorderRadius.all(Radius.circular(10))
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
                      buildEmail(),
                      buildName(),
                      buildPhone(),
                      buildCategory(),
                      buildCountry(),
                      buildPassWord(),
                      buildConfirmPassword(),
                      SizedBox(height: 30),
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
                      SizedBox(height: 10),
                      SizedBox(
                        width: 170,
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(45, 15, 10, 15),
                          onPressed: () {
                            // if (!_formkey.currentState.validate()) {
                            //   return;
                            // }
                            // _formkey.currentState.save();
                          },
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.help_outline,
                                size: 25,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Help',
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
                      Column(
                        children: <Widget>[
                          SizedBox(height: 20),
                          SizedBox(
                            width: 300,
                            child: RaisedButton(
                              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.fingerprint,
                                      size: 25, color: Colors.white),
                                  SizedBox(width: 10),
                                  Text(
                                    'Ministry Employess log in',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              color: Color(0XFFff9801),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0))),
                            ),
                          ),
                        ],
                      ),
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

void fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
