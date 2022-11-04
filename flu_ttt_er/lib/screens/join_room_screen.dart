import 'package:flutter/material.dart';

import '../resources/socket_methods.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routename = '/join-room';

  const JoinRoomScreen({Key? key}) : super(key: key);

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gameIdController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListner(context);
    _socketMethods.errorOccuredListner(context);
    _socketMethods.updatePlayerStateListner(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _gameIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(shadow: [], text: 'Join Room', fontSize: 70),
          SizedBox(height: size.height * 0.08),
          CustomTextField(
            controller: _nameController,
            hintText: 'Enter your Nickname',
          ),
          const SizedBox(height: 20),
          CustomTextField(
            controller: _gameIdController,
            hintText: 'Enter Game Id',
          ),
          SizedBox(height: size.height * 0.045),
          CustomButton(
              onTap: () => _socketMethods.joinRoom(
                  _nameController.text, _gameIdController.text),
              text: 'Join')
        ],
      ),
    ));
  }
}
