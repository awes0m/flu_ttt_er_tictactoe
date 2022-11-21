import 'package:flu_ttt_er/providers/room_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScoreTile(
            nickname: roomDataProvider.player1.nickname,
            score: roomDataProvider.player1.points),
        ScoreTile(
            nickname: roomDataProvider.player2.nickname,
            score: roomDataProvider.player2.points),
      ],
    );
  }
}

class ScoreTile extends StatelessWidget {
  const ScoreTile({
    super.key,
    required this.nickname,
    required this.score,
  });

  final String nickname;
  final double score;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            nickname,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          Text(score.toStringAsFixed(0), style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
