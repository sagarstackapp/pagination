import 'package:flutter/material.dart';
import 'package:pagination/common/constant/color.dart';

Widget topAppBar(String title) {
  return AppBar(
    backgroundColor: ColorResources.Red,
    title: Text(title),
    centerTitle: true,
    elevation: 10,
    shadowColor: Color(0xFFFFE35452),
  );
}
