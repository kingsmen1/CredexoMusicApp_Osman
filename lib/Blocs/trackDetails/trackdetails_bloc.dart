import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:credicxo_music_app/Blocs/trackList/tracklist_bloc.dart';
import 'package:credicxo_music_app/repositories/trackDetailsRepo.dart';
import 'package:equatable/equatable.dart';
import '../../models/track.dart';

part 'trackdetails_event.dart';
part 'trackdetails_state.dart';

class TrackdetailsBloc extends Bloc<TrackdetailsEvent, TrackdetailsState> {
  final TrackDetailsRepo _trackDetailsRepo;
  final TracklistBloc _tracklistBloc;
  StreamSubscription? _trackSubscription;
  List<Track?>? tracks;

  TrackdetailsBloc(
      {required TrackDetailsRepo trackDetailsRepo,
      required TracklistBloc trackdetailsBloc})
      : _trackDetailsRepo = trackDetailsRepo,
        _tracklistBloc = trackdetailsBloc,
        super(TrackdetailsLoding()) {
    on<LoadTrackDetails>(_loadTrackDetails);
    on<UpdateTrackDetails>(_updateTrackDetails);
    on<EmitTrackdetailsCollected>(_emitTrackdetailsCollected);

    _trackSubscription?.cancel();
    _trackSubscription = _tracklistBloc.stream.listen((state) {
      print('subscription function');
      add(LoadTrackDetails());
    });
  }

  _loadTrackDetails(
      LoadTrackDetails event, Emitter<TrackdetailsState> emit) async {
    print("_loadTrackDetails");
    final state = _tracklistBloc.state;
    if (state is TracklistLoaded) {
      late List<Track> trackDetailsList = [];

      print(trackDetailsList.length);
      for (var tracks in state.tracks) {
        _trackDetailsRepo
            .getTrackDetails(TRACK_ID: tracks!.track.trackId)
            .then((value) {
          trackDetailsList.add(value);
        });
      }

      await Future.delayed(const Duration(seconds: 2), () {
        print('Future played');
        emit(TrackdetailsCollected(tracks: trackDetailsList));
        tracks = trackDetailsList;
      });
    }
  }

  _updateTrackDetails(
      UpdateTrackDetails event, Emitter<TrackdetailsState> emit) {
    final state = this.state;

    if (state is TrackdetailsCollected) {
      print(state.tracks.length);
      var track =
          state.tracks.firstWhere((track) => track!.trackId == event.trackId);
      emit(TrackdetailsLoaded(track: track!));
    }
  }

  _emitTrackdetailsCollected(
      EmitTrackdetailsCollected event, Emitter<TrackdetailsState> emit) {
    print("_emitTrackdetailsCollected");
    final state = this.state;
    if (tracks!.isEmpty) {
      print('tracks is empty to emit TrackdetailsCollected again');
    } else {
      emit(TrackdetailsCollected(tracks: tracks!));
    }
  }
}
