import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/room_data_provider.dart';

class GameScreen extends StatefulWidget {
  static const routename = "game_screen";
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    print(Provider.of<RoomDataProvider>(context).player1.nickname);
    print(Provider.of<RoomDataProvider>(context).player2.nickname);

    return Scaffold(
      body: Center(
        child: Text(Provider.of<RoomDataProvider>(context).roomData.toString()),
      ),
    );
  }
}
