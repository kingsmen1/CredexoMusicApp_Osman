import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:credicxo_music_app/Blocs/trackDetails/trackdetails_bloc.dart';
import 'package:credicxo_music_app/models/track_lyrics.dart';
import 'package:credicxo_music_app/repositories/lyricsRepo.dart';
import 'package:equatable/equatable.dart';

part 'tracklyrics_dart_event.dart';
part 'tracklyrics_dart_state.dart';

class TracklyricsDartBloc
    extends Bloc<TracklyricsDartEvent, TracklyricsDartState> {
  final LyricsRepo _lyricsRepo;
  StreamSubscription? lyricsSubscription;
  TracklyricsDartBloc({required LyricsRepo lyricsRepo})
      : _lyricsRepo = lyricsRepo,
        super(TracklyricsDartLoading()) {
    on<loadTrackLyrics>(_loadTrackDetails);
    on<UpdateTrackLyrics>(_updateTrackLyrics);
    on<ResetData>((event, emit) => emit(TracklyricsDartLoading()));
  }

  _loadTrackDetails(event, Emitter<TracklyricsDartState> emit) {
    emit(TracklyricsDartLoading());
    lyricsSubscription?.cancel();
    lyricsSubscription =
        _lyricsRepo.getTrackList(trackId: event.trackid).listen((value) {
      add(UpdateTrackLyrics(lyrics: value!));
    });
  }

  _updateTrackLyrics(event, Emitter<TracklyricsDartState> emit) {
    print('_updateTrackLyrics');
    emit(TracklyricsDartLoaded(lyrics: event.lyrics));
  }
}
