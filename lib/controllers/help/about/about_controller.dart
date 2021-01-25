import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:project_2048/models/help/about/about_model.dart';
import 'package:project_2048/models/help/about/app.dart';
import 'package:project_2048/models/help/about/developer.dart';

class AboutController {
  AboutController();

  Developer developerGetter(BuildContext context) {
    AboutModel viewModel = Provider.of<AboutModel>(context, listen: false);
    return viewModel.developer;
  }

  App appGetter(BuildContext context) {
    AboutModel viewModel = Provider.of<AboutModel>(context, listen: false);
    return viewModel.app;
  }
}
