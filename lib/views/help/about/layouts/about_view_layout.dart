// import packages
import 'package:flutter/material.dart';

// import models
import 'package:project_2048/models/help/about/app.dart';
import 'package:project_2048/models/help/about/developer.dart';

// import view components
import 'package:project_2048/views/components/base_view.dart';
import 'package:project_2048/views/components/base_card.dart';
import 'package:project_2048/views/components/base_button.dart';
import 'package:project_2048/views/components/about_data_card.dart';

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
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 1,
          ),
        ),
        AboutDataCard(
          flex: 8,
          dataType: 'Name',
          dataValue: '${developer.firstName} ${developer.lastName}',
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 1,
          ),
        ),
        BaseCard(
          cardText: 'App details',
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 1,
          ),
        ),
        AboutDataCard(
          flex: 8,
          dataType: 'Name',
          dataValue: '${app.name}',
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 1,
          ),
        ),
        AboutDataCard(
          flex: 8,
          dataType: 'Version',
          dataValue: '${app.version}',
        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 1,
          ),
        ),
        BaseButton(
          buttonText: 'Go back',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
