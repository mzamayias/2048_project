import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import model
import '../../../models/help/about/about_model.dart';
// import controller
import '../../../controllers/help/about/about_controller.dart';

// import about layout
import 'layouts/about_view_layout.dart';

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
