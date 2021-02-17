// import flutter packages
import 'package:flutter/material.dart' hide BackButton;

// import models
import '../../../models/help/about/app.dart';
import '../../../models/help/about/developer.dart';

// import controller
import '../../../controllers/help/about/about_controller.dart';

// import about view layout
import '../../widgets/base_view.dart';
import '../../widgets/one_string_card.dart';
import '../../widgets/two_string_card.dart';
import '../../widgets/back_button.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Developer _developer = AboutController().developer;
    final App _app = AboutController().app;
    return BaseView(
      viewTitle: 'About',
      children: <Widget>[
        const OneStringCard(
          cardText: 'Developer details',
        ),
        TwoStringCard(
          dataType: 'Name',
          dataValue: '${_developer.firstName} ${_developer.lastName}',
        ),
        const OneStringCard(
          cardText: 'App details',
        ),
        TwoStringCard(
          dataType: 'Name',
          dataValue: _app.name,
        ),
        TwoStringCard(
          dataType: 'Version',
          dataValue: _app.version,
        ),
        const Spacer(),
        const BackButton(),
      ],
    );
  }
}
