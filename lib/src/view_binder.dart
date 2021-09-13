import 'package:flutter/material.dart';

typedef OnItemBinderTap<T> = void Function(
    BuildContext ctx, int postition, T model);

typedef OnItemBinder = Widget Function(
    BuildContext ctx, int postition, dynamic model);

abstract class ViewBinder<T> {
  Type get type => T;

  Widget bind(BuildContext ctx, int position, T model);
}
