import 'app.dart';
import 'developer.dart';

class AboutModel {
  Developer _developer = Developer(
    firstName: 'Mike',
    lastName: 'Zamayias',
  );

  App _app = App(
    name: '2048 Semester Project',
    version: 'Still Under Developement',
  );

  Developer get developer => _developer;

  set developer(Developer value) {
    _developer = value;
  }

  App get app => _app;

  set app(App value) {
    _app = value;
  }
}
