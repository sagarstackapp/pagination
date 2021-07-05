import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:pagination/common/constant/color.dart';
import 'package:pagination/model/records_model.dart';
import 'package:http/http.dart' as http;

class RestApi {
  Future fetchRecords(String item) async {
    String url = 'https://jsonplaceholder.typicode.com/albums/' + item;
    try {
      final response = await http.get(Uri.parse(url));
      print(url);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body);
        return RecordsModel.fromJson(data);
      } else {
        Fluttertoast.showToast(
          msg: "Something Went Wrong",
          textColor: ColorResources.White,
          backgroundColor: ColorResources.Red,
          fontSize: 15,
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
