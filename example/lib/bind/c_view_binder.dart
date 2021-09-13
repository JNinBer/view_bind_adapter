import 'package:example/model/models.dart';
import 'package:flutter/material.dart';
import 'package:view_bind_adapter/view_bind_adapter.dart';

class CViewBinder extends ViewBinder<CModel> {
  @override
  Widget bind(BuildContext ctx, int position, CModel model) {
    return Container(
      width: double.infinity,
      height: 40,
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.cyanAccent,
      child: Text('type C Card'),
    );
  }
}
