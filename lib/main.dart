import 'package:flutter/material.dart';
import 'package:sports_app/Cubits/GetTeamsCubit/get_teams_cubit.dart';
import 'package:sports_app/screens/teams_Top_Scorers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:sports_app/Data/Repository/get_teams_repo.dart';

void main() {
  runApp(const SportsApp());
}

class SportsApp extends StatelessWidget {
  const SportsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetTeamsCubit>(
          create: (BuildContext context) => GetTeamsCubit(),
        ),
       
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TeamsTopScorersScreen(),
      ),
    );
  }
}


