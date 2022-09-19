import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scorecard/match/services/match_service.dart';

part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  MatchBloc(this._service) : super(const MatchState()) {
    on<GetMatchData>(_onGetMatchData);
  }

  final MatchService? _service;

  void _onGetMatchData(GetMatchData event, Emitter emit) async {
    final matchData = await _service?.getMatchData();
    if (matchData!.hasError) {
      emit(state.copyWith(
        hasError: true,
      ));
    } else {
      emit(state.copyWith(
        data: matchData.data,
      ));
    }
  }
}
