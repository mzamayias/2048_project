import 'package:flutter/material.dart' hide BackButton;

// import models
import 'package:project_2048/src/models/help/about/app.dart';
import 'package:project_2048/src/models/help/about/developer.dart';

// import controller
import 'package:project_2048/src/controllers/help/about/about_controller.dart';

// import about view layout
import 'package:project_2048/src/views/widgets/base_view.dart';
import 'package:project_2048/src/views/widgets/one_string_card.dart';
import 'package:project_2048/src/views/widgets/two_string_card.dart';
import 'package:project_2048/src/views/widgets/back_button.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Developer _developer = AboutController().developer;
    App _app = AboutController().app;
    return BaseView(
      viewTitle: 'About',
      children: <Widget>[
        OneStringCard(
          cardText: 'Developer details',
        ),
        TwoStringCard(
          dataType: 'Name',
          dataValue: '${_developer.firstName} ${_developer.lastName}',
        ),
        OneStringCard(
          cardText: 'App details',
        ),
        TwoStringCard(
          dataType: 'Name',
          dataValue: '${_app.name}',
        ),
        TwoStringCard(
          dataType: 'Version',
          dataValue: '${_app.version}',
        ),
        // Spacer(),
        BackButton(),
      ],
    );
  }
}
