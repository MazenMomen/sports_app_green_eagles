import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sports_app/Data/Models/get_top.dart';
import 'package:sports_app/Data/Models/get_teams.dart';
import 'package:sports_app/Data/Repository/get_teams_repo.dart';
import 'package:sports_app/Data/Repository/get_top_repo.dart';


part 'get_teams_state.dart';

class GetTeamsCubit extends Cubit<GetTeamsState> {
  GetTeamsCubit() : super(GetTeamsInitial());

  GetTeamsRepo teamsRepo = GetTeamsRepo();
  GetTopRepo topRepo = GetTopRepo();





 getTop() async{
    emit(GetTopLoading());

    try {
      await topRepo.getTop().then((value) {
        if(value != null){
          emit(GetTopSuccess(response: value));
        }else{
          emit(GetTopError());
        }
      });
    }catch(error){
      emit(GetTopError());
    }
  }
  getTeams() async{
    emit(GetTeamsLoading());

    try {
      await teamsRepo.getTeams().then((value) {
        if(value != null){
          emit(GetTeamsSuccess(response: value));
        }else{
          emit(GetTeamsError());
        }
      });
    }catch(error){
      emit(GetTeamsError());
    }

  
  }
  
  showTextField() async{

    emit(ShowTextField());



  }
}
