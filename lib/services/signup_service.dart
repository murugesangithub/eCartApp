import 'dart:convert';
import 'package:date_util/date_util.dart';
import 'package:ecartapp/model/apiresponse.dart';
import 'package:ecartapp/model/dropdown_model.dart';
import 'package:ecartapp/model/signupModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpService {
  final String serviceUrl = 'http://pub.mas.gov.sa/api/';
  final String sTSUrl = 'http://192.168.56.3/UserApi/api/accounts';
  //static const headerString = {'Content-type': 'application/json'};///reset

  List<DropdownMenuItem> loadCategoryList() {
    return [
      new DropdownMenuItem(
        child: Text('Government'),
        value: 1,
      ),
      new DropdownMenuItem(
        child: Text('Private Sector'),
        value: 2,
      ),
      new DropdownMenuItem(
        child: Text('Student'),
        value: 3,
      ),
      new DropdownMenuItem(
        child: Text('Researcher'),
        value: 4,
      ),
    ];
  }

  Future<ApiResponse<List<Country>>> getCountryList() {
    return http.get(serviceUrl + 'countries').then((data) {
      if (data.statusCode == 200) {
        //final jsonData = json.decode(data.body);
        final countries = parseCountries(data.body);
        return ApiResponse<List<Country>>(data: countries);
      }
      return ApiResponse<List<Country>>(
          error: true, errorMessage: 'An error Occured');
    }).catchError((_) => ApiResponse<List<Country>>(
        error: true, errorMessage: 'An error Occured'));
  }

  List<Country> parseCountries(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Country>((json) => Country.fromJson(json)).toList();
  }

  Future<ApiResponse<bool>> registerUser(SignUpModel signUpData) {
    //print(signUpData.toJson());
    return http
        .post(sTSUrl,
            headers: {'Content-type': 'application/json'},
            body: json.encode(signUpData.toJson()))
        .then((data) {
      //print('StatusCode : $data.statusCode');
      if (data.statusCode == 200 || data.statusCode == 201) {
        return ApiResponse<bool>(data: true);
      }
      return ApiResponse<bool>(error: true, errorMessage: 'An error Occured');
    }).catchError((_) =>
            ApiResponse<bool>(error: true, errorMessage: 'An error Occured'));
  }

  Future<ApiResponse<bool>> forgotPassword(ResetModel userID) {
    return http
        .post(sTSUrl + '/reset',
            headers: {'Content-type': 'application/json'},
            body: json.encode(userID.toJson()))
        .then((data) {
      if (data.statusCode == 200 || data.statusCode == 201) {
        return ApiResponse<bool>(data: true);
      }
      return ApiResponse<bool>(error: true, errorMessage: 'An error Occured');
    }).catchError((_) =>
            ApiResponse<bool>(error: true, errorMessage: 'An error Occured'));
  }

  List<DropDownModel> loadMonthList() {
    List<DropDownModel> listItem = new List<DropDownModel>();
    var monthName = '';
    var dateUtility = new DateUtil();
    for (var i = 0; i < 12; i++) {
      monthName = dateUtility.month(i + 1);
      listItem.add(DropDownModel(textValue: monthName, id: (i + 1)));
    }
    return listItem;
  }

  List<DropDownModel> loadDaysList() {
    List<DropDownModel> listItem = new List<DropDownModel>();
    var days = '';
    for (var i = 0; i < 31; i++) {
      days = (i < 9) ? '0' + (i + 1).toString() : (i + 1).toString();
      listItem.add(DropDownModel(textValue: days, id: (i + 1)));
    }
    return listItem;
  }

  List<DropDownModel> loadYearsList() {
    List<DropDownModel> listItem = new List<DropDownModel>();
    for (var i = 1950; i < 2020; i++) {
      //days = (i < 10) ? '0' + (i + 1).toString() : (i + 1).toString();
      listItem.add(DropDownModel(textValue: i.toString(), id: i));
    }
    return listItem;
  }
}
