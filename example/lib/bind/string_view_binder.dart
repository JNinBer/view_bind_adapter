import 'package:flutter/cupertino.dart';
import 'package:view_bind_adapter/view_bind_adapter.dart';

class StringViewBinder extends ViewBinder<String> {
  @override
  Widget bind(BuildContext ctx, int position, String model) {
    return Container(
      alignment: Alignment.center,
      child: Text('$ctx  position  =$position  text =$model'),
      height: 40,
    );
  }
}
