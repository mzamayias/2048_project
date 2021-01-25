import 'package:flutter/material.dart';

import 'package:project_2048/models/help/about/app.dart';
import 'package:project_2048/models/help/about/developer.dart';

import 'package:project_2048/views/components/base_view.dart';
import 'package:project_2048/views/components/base_card.dart';
import 'package:project_2048/views/components/base_button.dart';
import 'package:project_2048/views/components/string_data.dart';

class AboutViewLayout extends StatelessWidget {
  const AboutViewLayout({
    Key key,
    @required this.developer,
    @required this.app,
  }) : super(key: key);

  final Developer developer;
  final App app;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewTitle: 'About',
      children: <Widget>[
        BaseCard(
          cardText: 'Developer details',
        ),
        SizedBox(
          height: 10,
        ),
        StringData(
          flex: 1,
          dataType: 'Name',
          dataValue:
              '${developer.firstName} ${developer.lastName}',
        ),
        SizedBox(
          height: 10,
        ),
        BaseCard(
          cardText: 'App details',
        ),
        SizedBox(
          height: 10,
        ),
        StringData(
          flex: 1,
          dataType: 'Name',
          dataValue: '${app.name}',
        ),
        SizedBox(
          height: 10,
        ),
        StringData(
          flex: 1,
          dataType: 'Version',
          dataValue: '${app.version}',
        ),
        SizedBox(
          height: 210,
        ),
        BaseButton(
          buttonText: 'Go back',
          onPressed: () => Navigator.pop(context),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
