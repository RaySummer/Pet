import 'package:flutter/material.dart';

import 'bloc/bloc_provider.dart';
import 'bloc/system/app_bloc.dart';
import 'main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BLoCProvider<AppBLoC>(
      bloc: AppBLoC.instance,
      child: HomePage(),
    );
  }
}
