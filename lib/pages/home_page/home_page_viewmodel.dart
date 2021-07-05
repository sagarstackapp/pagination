import 'package:flutter/material.dart';
import 'package:pagination/model/records_model.dart';
import 'package:pagination/pages/home_page/home.dart';
import 'package:pagination/service/records_api.dart';

class HomePageViewModel {
  HomeState? hState;
  RestApi restApi = RestApi();
  RecordsModel? recordsModel;

  HomePageViewModel(this.hState, item) {
    getUserdata(item);
  }

  getUserdata(item) async {
    var userData = await restApi.fetchRecords(item);

    if (userData == null) {
      print('UserData coming is NULL');
    } else {
      print('Data sending');
      recordsModel = userData;
      return recordsModel;
    }

    // ignore: invalid_use_of_protected_member
    hState!.setState(() {});
  }
}
