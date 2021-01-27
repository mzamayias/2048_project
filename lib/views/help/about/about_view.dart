import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import model
import 'package:project_2048/models/help/about/about_model.dart';

// import controller
import 'package:project_2048/controllers/help/about/about_controller.dart';

// import about view layout
import 'package:project_2048/views/help/about/layouts/about_view_layout.dart';

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AboutController aboutController = AboutController();
    return ChangeNotifierProvider<AboutModel>(
      create: (context) => AboutModel(),
      child: Consumer<AboutModel>(
        builder: (context, viewModel, child) => AboutViewLayout(
          developer: aboutController.developerGetter(context),
          app: aboutController.appGetter(context),
        ),
      ),
    );
  }
}
