import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PlatformListTile extends PlatformWidgetBase<Material, MergeSemantics> {
  final String title;
  final String subtitle;

  PlatformListTile({this.title, this.subtitle});

  @override
  MergeSemantics createMaterialWidget(BuildContext context) {
    return MergeSemantics(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        dense: false,
      ),
    );
  }

  @override
  Material createCupertinoWidget(BuildContext context) {
    return Material(
        color: Color(0xFFFFFFFF),
        child: MergeSemantics(
          child: ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            dense: false,
          ),
        ));
  }
}
