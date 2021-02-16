import 'app.dart';
import 'developer.dart';

class AboutModel {
  final Developer developer = Developer(
    firstName: 'Mike',
    lastName: 'Zamayias',
  );

  final App app = App(
    name: '2048 Semester Project',
    version: 'Still Under Developement',
  );
}
