import 'package:flu_ttt_er/utils/colors.dart';
import 'package:flutter/material.dart';

import '../resources/socket_methods.dart';
import '../responsive/responsive.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_field.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routename = '/create-room';

  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  /// NickName field controller
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Responsive(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              shadow: [Shadow(blurRadius: 40, color: blueColor)],
              text: 'Create Room',
              fontSize: 70,
            ),
            SizedBox(height: size.height * 0.08),
            CustomTextField(
              controller: _nameController,
              hintText: 'Enter your Nickname',
            ),
            SizedBox(height: size.height * 0.04),
            CustomButton(
                onTap: () => _socketMethods.createRoom(_nameController.text),
                text: 'Create')
          ],
        ),
      ),
    ));
  }
}
