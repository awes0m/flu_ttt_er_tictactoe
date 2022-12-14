import 'package:flu_ttt_er/providers/room_data_provider.dart';
import 'package:flu_ttt_er/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../screens/game_screen.dart';
import 'socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  Socket get socketClient => _socketClient;

// EMITS
  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit('createRoom', {
        'nickname': nickname,
      });
    }
  }

  void joinRoom(String nickname, String roomId) {
    if (nickname.isNotEmpty && roomId.isNotEmpty) {
      _socketClient.emit('joinRoom', {
        'nickname': nickname,
        'roomId': roomId,
      });
    }
  }

  void tapGrid(int index, String roomId, List<String> displayElements) {
    // if cell is blank=> we send in the index and roomId
    // The Display elements [X] ansd [O] need s not be retuned to the backend server and can stay in fron end
    if (displayElements[index] == '') {
      //index.js, - On tap
      _socketClient.emit('tap', {
        'index': index,
        'roomId': roomId,
      });
    }
  }

// LISTENERS
  void createRoomSuccessListner(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      //Update room data to provider
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routename);
    });
  }

  void joinRoomSuccessListner(BuildContext context) {
    _socketClient.on('joinRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, GameScreen.routename);
    });
  }

  void errorOccuredListner(BuildContext context) {
    _socketClient.on('errorOccured', (data) {
      showSnackBar(context, data);
    });
  }

  void updatePlayerStateListner(BuildContext context) {
    _socketClient.on('updatePlayers', (playerData) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer1(playerData[0]);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatePlayer2(playerData[1]);
    });
  }

  void updateRoomListner(BuildContext context) {
    _socketClient.on('updateRoom', (data) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(data);
    });
  }

  void tappedlistener(BuildContext context) {
    _socketClient.on('tapped', (data) {
      RoomDataProvider roomDataProvider =
          Provider.of<RoomDataProvider>(context, listen: false);
      roomDataProvider.updateDisplayElements(
        data['index'],
        data['choice'],
      );
      roomDataProvider.updateRoomData(data['room']);
      // check winner
    });
  }
}
