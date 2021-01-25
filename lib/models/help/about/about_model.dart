import 'package:flutter/material.dart';

import 'developer.dart' show Developer;
import 'app.dart' show App;

class AboutModel extends ChangeNotifier {
  Developer developer = developerDetails;
  App app = appDetails;

  AboutModel();
}

Developer developerDetails = Developer(
  firstName: 'Mike',
  lastName: 'Zamayias',
);

App appDetails = App(
  name: '2048 Semester Project',
  version: 'Under developement',
);
