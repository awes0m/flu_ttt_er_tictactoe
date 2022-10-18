import 'package:flutter/material.dart';

import 'screens/create_room_screen.dart';
import 'screens/join_room_screen.dart';
import 'screens/main_menu_screen.dart';
import 'utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bgColor),
      initialRoute: MainMenuScreen.routename,
      routes: {
        MainMenuScreen.routename: (context) => const MainMenuScreen(),
        CreateRoomScreen.routename: (context) => const CreateRoomScreen(),
        JoinRoomScreen.routename: (context) => const JoinRoomScreen(),
      },
    );
  }
}
