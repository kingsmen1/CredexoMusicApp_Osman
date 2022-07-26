import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:credicxo_music_app/models/track_list.dart';
import 'package:credicxo_music_app/repositories/getTracksRepo.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
part 'tracklist_event.dart';
part 'tracklist_state.dart';

class TracklistBloc extends Bloc<TracklistEvent, TracklistState> {
  final GetTracksRepo _getTracks;
  StreamSubscription? _tracksSubscription;

  TracklistBloc({required GetTracksRepo getTracksRepo})
      : _getTracks = getTracksRepo,
        super(TracklistLoading()) {
    on<LoadTrackList>(_loadTrackList);
    on<UpdateTrackList>(_updateTrackList);
  }

  _loadTrackList(event, Emitter<TracklistState> emit) {
    _tracksSubscription?.cancel();
    _tracksSubscription = _getTracks.getTrackList().listen((tracks) {
      add(UpdateTrackList(tracks!));
    });
  }

  _updateTrackList(event, Emitter<TracklistState> emit) {
    emit(TracklistLoaded(tracks: event.tracks));
  }
}
