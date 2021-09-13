import 'package:example/model/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:view_bind_adapter/view_bind_adapter.dart';

class AViewBinder extends ViewBinder<AModel> {
  @override
  Widget bind(BuildContext ctx, int position, AModel model) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.red,
      child: Text('type A Card'),
    );
  }
}
