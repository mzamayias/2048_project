import 'package:flutter/material.dart';
import 'package:project_2048/custom_widgets/string_data.dart';

import '../../data/help/app.dart';
import '../../data/help/developer.dart';
import '../../views/help/details.dart';

import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_card.dart';
import '../../views/blueprint.dart';

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
      version: 'Development',
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
