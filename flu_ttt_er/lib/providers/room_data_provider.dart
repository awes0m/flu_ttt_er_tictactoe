// ignore_for_file: unused_field

import 'package:flutter/material.dart';

import '../models/player.dart';

/// RoomData [Provider] includes details of Both [Player]s including their [socketID],[points]and [playerType]info ie 'X' or 'Y'
class RoomDataProvider extends ChangeNotifier {
  /// [_roomData] inizializes and stores the necessary dta to create a room like [roomId],[socketID] and [Player] info
  Map<String, dynamic> _roomData = {};
  List<String> _displayElement = ['', '', '', '', '', '', '', '', ''];
  int _filledBoxes = 0;
  Player _player1 = Player(
    nickname: '',
    socketID: '',
    points: 0,
    playerType: 'X',
  );
  Player _player2 = Player(
    nickname: '',
    socketID: '',
    points: 0,
    playerType: 'O',
  );

  /// Getter for [_roomData]
  Map<String, dynamic> get roomData => _roomData;

  /// Getter for [_displayElement]
  List<String> get displayElement => _displayElement;
  Player get player1 => _player1;
  Player get player2 => _player2;

  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    notifyListeners();
  }

  void updatePlayer1(Map<String, dynamic> player1Data) {
    _player1 = Player.fromMap(player1Data);
    notifyListeners();
  }

  void updatePlayer2(Map<String, dynamic> player2Data) {
    _player2 = Player.fromMap(player2Data);
    notifyListeners();
  }

  void updateDisplayElements(int index, String choice) {
    _displayElement[index] = choice;
    _filledBoxes += 1;
  }
}
