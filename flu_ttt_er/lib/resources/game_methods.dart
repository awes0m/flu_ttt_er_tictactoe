import 'package:flu_ttt_er/providers/room_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';

class GameMethods {
  void checkWinner(BuildContext context, Socket socketClient) {
    RoomDataProvider roomDataProvider =
        Provider.of<RoomDataProvider>(context, listen: false);
  }
}
