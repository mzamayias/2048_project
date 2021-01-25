import 'package:flutter/material.dart';

import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_card.dart';
import '../../custom_widgets/string_data.dart';
import '../../views/blueprint.dart';
import '../../models/help/app.dart';
import '../../models/help/developer.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Developer _developerDetails = Developer(
      firstName: 'Mike',
      lastName: 'Zamayias',
    );

    App _appDetails = App(
      name: '2048 Semester Project',
      version: 'Development Channel',
    );

    return BlueprintView(
      viewTitle: 'About',
      children: <Widget>[
        CustomCard(
          cardText: 'Developer details',
        ),
        SizedBox(
          height: 10,
        ),
        StringData(
          flex: 1,
          dataType: 'Name',
          dataValue:
              '${_developerDetails.firstName} ${_developerDetails.lastName}',
        ),
        SizedBox(
          height: 10,
        ),
        CustomCard(
          cardText: 'App details',
        ),
        SizedBox(
          height: 10,
        ),
        StringData(
          flex: 1,
          dataType: 'Name',
          dataValue: '${_appDetails.name}',
        ),
        SizedBox(
          height: 10,
        ),
        StringData(
          flex: 1,
          dataType: 'Version',
          dataValue: '${_appDetails.version}',
        ),
        SizedBox(
          height: 210,
        ),
        CustomButton(
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
