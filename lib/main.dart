import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/data/cubits/cubit/players_cubit.dart';
import 'package:sports/screens/PlayerListScreen.dart';
import 'package:sports/screens/players.dart';

import 'data/cubits/cubit/player/cubit/getplayer_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    final String teamidd="97";
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => GetplayerCubit(teamidd ),
        ),
      ],
      child: MaterialApp(
        home: Players(teamname: "teamname"),
      ),
    );
  }
}
