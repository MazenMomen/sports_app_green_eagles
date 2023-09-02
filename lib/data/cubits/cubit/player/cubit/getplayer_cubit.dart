import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/api.dart';
import '../../../../repo/repoplayer.dart';

part 'getplayer_state.dart';

class GetplayerCubit extends Cubit<GetplayerState> {
  final String teamidd;
  late Getplayersrepo PRepo;

  GetplayerCubit(this.teamidd) : super(GetplayerInitial()) {
    PRepo = Getplayersrepo(teamId: teamidd);
  }

  getplayer() async {
    emit(loding());

    try {
      await PRepo.getplayer().then((value) {
        if (value != null) {
          emit(getplayerscucces(Result: value));
        } else {
          emit(getplayererror());
        }
      });
    } catch (error) {
      emit(getplayererror());
    }
  }
}
