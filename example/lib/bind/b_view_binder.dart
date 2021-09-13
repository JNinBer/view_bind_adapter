import 'package:example/model/models.dart';
import 'package:flutter/material.dart';
import 'package:view_bind_adapter/view_bind_adapter.dart';

class BViewBinder extends ViewBinder<BModel> {
  @override
  Widget bind(BuildContext ctx, int position, BModel model) {
    return Container(
      width: double.infinity,
      height: 80,
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.amberAccent,
      child: Text('type B Card'),
    );
  }
}
