import 'package:flutter/material.dart';
import 'package:project_2048/src/views/widgets/base_button.dart';
import 'package:project_2048/src/controllers/game/playing_area/game_board/restart_controller.dart';
import 'package:provider/provider.dart';

class RestartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RestartController restartController =
        Provider.of<RestartController>(context);
    return Expanded(
      child: BaseButton(
        buttonText: 'Restart',
        onPressed: () {
          debugPrint(
              'old restart controller value: ${restartController.value}');
          restartController.value = true;
          debugPrint(
              'new restart controller value: ${restartController.value}');
        },
      ),
    );
  }
}
