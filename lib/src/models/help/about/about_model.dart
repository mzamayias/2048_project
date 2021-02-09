import 'package:flutter/material.dart';

import 'developer.dart';
import 'app.dart';

class AboutModel {
  Developer _developer = Developer(
    firstName: 'Mike',
    lastName: 'Zamayias',
  );
  App _app = App(
    name: '2048 Semester Project',
    version: 'Under developement',
  );

  AboutModel();

  Developer get developer => this._developer;

  set developer(Developer value) {
    this._developer = value;
  }

  App get app => this._app;

  set app(App value) {
    this._app = value;
  }
}
