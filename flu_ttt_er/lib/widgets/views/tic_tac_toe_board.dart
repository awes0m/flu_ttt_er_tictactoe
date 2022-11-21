import 'package:flu_ttt_er/resources/socket_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/room_data_provider.dart';

class TicTacToeBoard extends StatefulWidget {
  const TicTacToeBoard({Key? key}) : super(key: key);

  @override
  State<TicTacToeBoard> createState() => _TicTacToeBoardState();
}

class _TicTacToeBoardState extends State<TicTacToeBoard> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.tappedlistener(context);
  }

  void tapped(int index, RoomDataProvider roomDataProvider) {
    _socketMethods.tapGrid(
      index,
      roomDataProvider.roomData['_id'],
      roomDataProvider.displayElement,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.7,
        maxWidth: 500,
      ),
      child: AbsorbPointer(
        absorbing: roomDataProvider.roomData['turn']['socketID'] !=
            _socketMethods.socketClient.id,
        child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => tapped(index, roomDataProvider),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white24, width: 2)),
                  child: Center(
                    child: AnimatedSize(
                      duration: const Duration(milliseconds: 250),
                      child: Text(
                        roomDataProvider.displayElement[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 100,
                            shadows: [
                              Shadow(
                                blurRadius: 40,
                                color: roomDataProvider.displayElement[index] ==
                                        "O"
                                    ? Colors.red
                                    : Colors.blue,
                              )
                            ]),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
