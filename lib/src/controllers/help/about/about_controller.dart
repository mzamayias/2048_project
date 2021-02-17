// import models
import '../../../models/help/about/about_model.dart'
    show AboutModel;
import '../../../models/help/about/app.dart';
import '../../../models/help/about/developer.dart';

class AboutController {
  AboutController();

  Developer get developer => AboutModel().developer;
  App get app => AboutModel().app;
}
