// import packages
import 'package:flutter/material.dart';

// import models
import 'package:project_2048/src/models/help/about/app.dart';
import 'package:project_2048/src/models/help/about/developer.dart';

// import view components
import 'package:project_2048/src/views/components/base_view.dart';
import 'package:project_2048/src/views/components/base_card.dart';
import 'package:project_2048/src/views/components/base_button.dart';
import 'package:project_2048/src/views/help/about/components/about_data_card.dart';

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
        Spacer(
          flex: 1,
        ),
        AboutDataCard(
          flex: 8,
          dataType: 'Name',
          dataValue: '${developer.firstName} ${developer.lastName}',
        ),
        Spacer(
          flex: 1,
        ),
        BaseCard(
          cardText: 'App details',
        ),
        Spacer(
          flex: 1,
        ),
        AboutDataCard(
          flex: 8,
          dataType: 'Name',
          dataValue: '${app.name}',
        ),
        Spacer(
          flex: 1,
        ),
        AboutDataCard(
          flex: 8,
          dataType: 'Version',
          dataValue: '${app.version}',
        ),
        Spacer(
          flex: 1,
        ),
        BaseButton(
          buttonText: 'Go back',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
