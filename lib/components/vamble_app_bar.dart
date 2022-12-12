import 'package:flutter/material.dart';
import '../styles/styles.dart';

class VambleAppBar extends SliverAppBar {
  VambleAppBar(bool innerBoxIsScrolled)
      : super(
          forceElevated: true,
          floating: false,
          pinned: false,
        );

  @override
  final Widget title =
      Text("Vamble Search".toUpperCase(), style: Styles.navBarTitle);

  @override
  final IconThemeData iconTheme = IconThemeData(color: Colors.black);

  @override
  final Color backgroundColor = Colors.white;

  @override
  final bool centerTitle = true;

  @override
  final double elevation = 0;
}
