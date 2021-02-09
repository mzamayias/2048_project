// import models
import 'package:project_2048/src/models/help/about/about_model.dart'
    show AboutModel;
import 'package:project_2048/src/models/help/about/app.dart';
import 'package:project_2048/src/models/help/about/developer.dart';

class AboutController {
  AboutController();

  Developer get developer => AboutModel().developer;
  App get app => AboutModel().app;
}
