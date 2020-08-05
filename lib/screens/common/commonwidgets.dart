import 'package:ecartapp/model/dropdown_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
BoxDecoration _fieldDecoration = BoxDecoration(
  // borderRadius: BorderRadius.circular(4.0),
  border: Border.all(
    color: primaryColorLightCustom,
    width: 0.3,
  ),
);
TextStyle _formTextStyle =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 12.0);

class EmailTextField extends StatelessWidget {
  final Function onSaved;
  final FocusNode currentFocus;
  final TextInputAction moveTo;
  final Function onFieldSubmitted;

  EmailTextField(
      {this.currentFocus, this.moveTo, this.onSaved, this.onFieldSubmitted});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: _fieldDecoration,
      child: TextFormField(
          focusNode: currentFocus,
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: _formTextStyle,
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.account_circle,
              color: primaryColorLightCustom,
            ),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return 'Email is required';
            }
            if (!RegExp(
                    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
          onSaved: onSaved,
          textInputAction: moveTo,
          onFieldSubmitted: onFieldSubmitted),
    );
  }
}

class NormalTextField extends StatelessWidget {
  final String hint;
  final Function onSaved;
  final FocusNode currentFocus;
  final TextInputAction moveTo;
  final Function onFieldSubmitted;
  final IconData icon;

  NormalTextField(
      {this.hint,
      this.currentFocus,
      this.moveTo,
      this.onSaved,
      this.onFieldSubmitted,
      this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: _fieldDecoration,
      child: TextFormField(
          focusNode: currentFocus,
          autofocus: true,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: this.hint,
            labelStyle: _formTextStyle,
            border: InputBorder.none,
            suffixIcon: Icon(
              icon,
              color: primaryColorLightCustom,
            ),
          ),
          validator: (String value) {
            if (value.isEmpty) {
              return '$hint is required';
            }
            return null;
          },
          onSaved: onSaved,
          textInputAction: moveTo,
          onFieldSubmitted: onFieldSubmitted),
    );
  }
}

class PhoneTextField extends StatelessWidget {
  final String hint;
  final Function onSaved;
  final FocusNode currentFocus;
  final TextInputAction moveTo;
  final Function onFieldSubmitted;
  final IconData icon;

  PhoneTextField(
      {this.hint,
      this.currentFocus,
      this.moveTo,
      this.onSaved,
      this.onFieldSubmitted,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: _fieldDecoration,
      child: TextFormField(
        focusNode: currentFocus,
        keyboardType: TextInputType.number,
        maxLength: 16,
        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: _formTextStyle,
          border: InputBorder.none,
          counterText: '',
          suffixIcon: Icon(
            Icons.stay_primary_portrait,
            color: barColour,
          ),
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Mobile No Is required';
          }
          if (value.length < 8) {
            return 'Please enter a valid Mobile Number';
          }
          return null;
        },
        onSaved: onSaved,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  final String hint;
  final Function onSaved;
  final FocusNode currentFocus;
  final TextInputAction moveTo;
  final Function onFieldSubmitted;
  final IconData icon;

  PasswordField(
      {this.hint,
      this.currentFocus,
      this.moveTo,
      this.onSaved,
      this.onFieldSubmitted,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: _fieldDecoration,
      child: TextFormField(
        focusNode: currentFocus,
        maxLength: 12,
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: _formTextStyle,
          border: InputBorder.none,
          counterText: '',
          suffixIcon: Icon(
            icon,
            color: barColour,
            size: 30,
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        validator: (String value) {
          if (value.isEmpty) {
            return '$hint Is required';
          }
          return null;
        },
        onSaved: onSaved,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: moveTo,
      ),
    );
  }
}

class BuildDropdown extends StatelessWidget {
  final String hint;
  final Function onChanged;
  final IconData icon;
  final List<DropDownModel> ddItems;
  final Object ddValue;

  BuildDropdown(
      {this.hint, this.onChanged, this.icon, this.ddItems, this.ddValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3.0),
      padding: EdgeInsets.symmetric(horizontal: 0),
      //decoration: _fieldDecoration,
      child: DropdownButtonFormField(
        value: ddValue,
        // icon: Padding(
        //     padding: EdgeInsets.only(right: 10),
        //     child: Icon(
        //       icon,
        //       color: barColour,
        //     )),
        isExpanded: true,
        validator: (value) => value == null ? 'Select $hint' : null,
        items: ddItems?.map((item) {
              return DropdownMenuItem(
                child: Text(
                  item.textValue,
                  style: _formTextStyle,
                ),
                value: item.id,
              );
            })?.toList() ??
            [],
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: _formTextStyle,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
