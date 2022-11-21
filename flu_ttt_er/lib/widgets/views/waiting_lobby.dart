import 'package:flu_ttt_er/providers/room_data_provider.dart';
import 'package:flu_ttt_er/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({Key? key}) : super(key: key);

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController rooomIdController;

  @override
  void initState() {
    super.initState();
    rooomIdController = TextEditingController(
        text: Provider.of<RoomDataProvider>(context, listen: false)
            .roomData['_id']);
  }

  @override
  void dispose() {
    super.dispose();
    rooomIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Waiting for a Player to join ...."),
        const SizedBox(height: 20),
        CustomTextField(
          controller: rooomIdController,
          hintText: '',
          isReadOnly: false,
        )
      ],
    );
  }
}
