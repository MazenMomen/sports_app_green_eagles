import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sports_app_green_eagles/data/models/get_teams_model.dart';
import 'package:sports_app_green_eagles/data/models/get_top_model.dart';

import 'package:sports_app_green_eagles/data/repositories/get_teams_repo.dart';
import 'package:sports_app_green_eagles/data/repositories/get_top_repo.dart';

part 'get_teams_state.dart';

class GetTeamsCubit extends Cubit<GetTeamsState> {
  GetTeamsCubit() : super(GetTeamsInitial());

  GetTeamsRepo teamsRepo = GetTeamsRepo();
  GetTopRepo topRepo = GetTopRepo();

  getTop() async {
    emit(GetTopLoading());

    try {
      await topRepo.getTop().then((value) {
        if (value != null) {
          emit(GetTopSuccess(response: value));
        } else {
          emit(GetTopError());
        }
      });
    } catch (error) {
      emit(GetTopError());
    }
  }

  getTeams() async {
    emit(GetTeamsLoading());

    try {
      await teamsRepo.getTeams().then((value) {
        if (value != null) {
          emit(GetTeamsSuccess(response: value));
        } else {
          emit(GetTeamsError());
        }
      });
    } catch (error) {
      emit(GetTeamsError());
    }
  }

  showTextField() async {
    emit(ShowTextField());
  }
}
