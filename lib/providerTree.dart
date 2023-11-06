

import 'package:flutter/cupertino.dart';
import 'package:nov_project/provider/homeProvider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderTree {
  List<SingleChildWidget> get(BuildContext context) {
    return [
      ChangeNotifierProvider.value(value: HomeProvider())
    ];
  }
 }