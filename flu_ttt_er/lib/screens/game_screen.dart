import 'package:flu_ttt_er/resources/socket_methods.dart';
import 'package:flu_ttt_er/widgets/views/scoreboard.dart';
import 'package:flu_ttt_er/widgets/views/tic_tac_toe_board.dart';
import 'package:flu_ttt_er/widgets/views/waiting_lobby.dart';
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
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListner(context);
    _socketMethods.updatePlayerStateListner(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: roomDataProvider.roomData['isJoin']
            ? const WaitingLobby()
            : SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  [
                      const ScoreBoard(),
                      const TicTacToeBoard(),
                      Text("${roomDataProvider.roomData['turn']['nickname']}'s turn")
                    ],
                  ),
                ),
              ));
  }
}
