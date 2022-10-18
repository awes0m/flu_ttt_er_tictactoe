import 'package:flutter/material.dart';

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
          SizedBox(height: size.height * 0.04),
          CustomButton(onTap: () {}, text: 'Create')
        ],
      ),
    ));
  }
}
