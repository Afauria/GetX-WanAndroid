import 'package:flutter/material.dart';

class LazyLoadBuilder extends StatelessWidget {
  final Function()? onBuild;

  LazyLoadBuilder({this.onBuild}) : super();

  @override
  Widget build(BuildContext context) {
    if (onBuild != null) {
      onBuild!();
    }
    return Text("lazy loading...");
  }
}
