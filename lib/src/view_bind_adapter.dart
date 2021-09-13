import 'package:flutter/material.dart';

import 'view_binder.dart';

class ViewBindAdapter {
  List<dynamic> _data = [];

  List<dynamic> get dataSource => _data;

  set data(List<dynamic> value) => _data = value;

  void add(dynamic item) => _data.add(item);

  void addAll(Iterable iterable) => _data.addAll(iterable);

  dynamic removeAt(int position) => _data.removeAt(position);

  dynamic remove(dynamic item) => _data.remove(item);

  dynamic removeWhere(bool test(dynamic element)) => _data.removeWhere(test);

  void insert(int index, dynamic element) => _data.insert(index, element);

  void insertAll(int index, Iterable iterable) =>
      _data.insertAll(index, iterable);

  final Map<Type, ViewBinder?> _typeBinder = <Type, ViewBinder?>{};

  Type? _cacheKey;

  ViewBinder? _cacheBinder;

  Widget? _unKnownWidget;

  set unKnownWidget(Widget value) => _unKnownWidget = value;

  OnItemBinder? _unKnownItemBinder;

  set unKnownItemBinder(OnItemBinder value) => _unKnownItemBinder = value;

  void registerWithType<T>(ViewBinder? viewBinder) {
    _typeBinder.putIfAbsent(T, () => viewBinder);
  }

  void register(ViewBinder? viewBinder) {
    if (viewBinder != null) {
      _typeBinder.putIfAbsent(viewBinder.type, () => viewBinder);
    }
  }

  dynamic getDynamicByPosition(int index) => _data[index];

  T? getPosition<T>(int index) => _data[index] as T?;

  V? getBinder<V extends ViewBinder>(dynamic key) {
    if (key == null) return null;
    return _typeBinder[key.runtimeType] as V?;
  }

  Widget bind(BuildContext ctx, int index) {
    var itemObj = _data[index];
    return _bindView(ctx, index, itemObj);
  }

  Widget _bindView(BuildContext ctx, int index, Object object) {
    var runtimeType = object.runtimeType;
    if (_cacheKey == null || _cacheKey != runtimeType) {
      if (_typeBinder.containsKey(runtimeType)) {
        var binder = _typeBinder[runtimeType];
        if (binder != null) {
          _cacheKey = runtimeType;
          _cacheBinder = binder;
          return binder.bind(ctx, index, object);
        } else {
          return _onUnknownBuild(ctx, index, object);
        }
      }
    } else {
      return _cacheBinder!.bind(ctx, index, object);
    }
    return _onUnknownBuild(ctx, index, object);
  }

  Widget _onUnknownBuild(BuildContext ctx, int index, Object object) {
    if (_unKnownItemBinder != null) {
      return _unKnownItemBinder!(ctx, index, object);
    }
    return _unKnownWidget ?? SizedBox();
  }
}
